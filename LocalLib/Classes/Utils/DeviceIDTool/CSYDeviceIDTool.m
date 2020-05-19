
//
//  CSYDeviceIDTool.m
//  OrangeCDSDesign
//
//  Created by nor on 2019/7/9.
//

#import "CSYDeviceIDTool.h"

#import "KeychainItemWrapper.h"
#import <CommonCrypto/CommonDigest.h>

NSString  *const kDeviceUUID = @"com.orangecds.OrangeCDSDesign.uuid";// UUID在KeyChain的Key值
NSUInteger const md5CodeLength = 5; // 摘要位数
NSUInteger const firstLength = 8; // 片段一加密长度
NSUInteger const secondLength = 10; // 片段二加密长度

@implementation CSYDeviceIDTool
+ (NSString *)deviceUUID {
    NSString *deviceId = [self deviceID] ;
    if(deviceId.length - md5CodeLength > 0) {
        return [deviceId substringToIndex:deviceId.length - md5CodeLength] ;
    }
    return deviceId ;
}

/// 生成UUID
+ (NSString *)deviceID {

    NSString *deviceID = nil;

    // 生成KeyChain,取出ID的数据
    KeychainItemWrapper *keychainItem = [[KeychainItemWrapper alloc] initWithIdentifier:kDeviceUUID accessGroup:nil] ;

    NSString *deviceID1 = [keychainItem objectForKey:(id)kSecValueData] ;

    // 取出为空,则进行生成,并放入KeyChain,函数返回
    if (deviceID1.length == 0) {
        deviceID = [self generatorDeviceId] ;
        [keychainItem setObject:kDeviceUUID forKey:(id)kSecAttrAccount];
        [keychainItem setObject:deviceID forKey:(id)kSecValueData];
        return deviceID ;
    }

    // 成功取出,检查UUID是否符合自定义摘要逻辑
    BOOL deviceIdAvailable1 = [self checkDeviceIdAvailable:deviceID1] ;

    // 生成Current UUID
    NSString *uniqueIdentifier = [[[UIDevice currentDevice] identifierForVendor] UUIDString];

    // 检查从KeyChain取出的UUID是否包含Current UUID
    if([deviceID1 hasPrefix:uniqueIdentifier]) {
        return deviceID1 ;
    }

    // KeyChain 是否符合自定义逻辑
    if (deviceIdAvailable1) {
        return deviceID1;
    } else {
        // 重新生成
        deviceID = [self generatorDeviceId] ;
        [keychainItem setObject:kDeviceUUID forKey:(id)kSecAttrAccount];
        [keychainItem setObject:deviceID forKey:(id)kSecValueData];
        return deviceID ;
    }

    return nil;
}


/// 生成UUID (由于剪切版有些情况导致k假死， 暂时弃用)
+ (NSString *)deviceID2 {
    NSString *deviceID = nil ;
    // 生成KeyChain,取出ID的数据
    KeychainItemWrapper *keychainItem = [[KeychainItemWrapper alloc] initWithIdentifier:kDeviceUUID accessGroup:nil] ;

    NSString *deviceID1 = [keychainItem objectForKey:(id)kSecValueData] ;

    // 生成剪切版,取出剪贴板数据
    NSString *deviceID2 = nil ;
    UIPasteboard *pasteboard = [UIPasteboard pasteboardWithName:kDeviceUUID create:YES] ;
    NSData *data = [pasteboard valueForPasteboardType:kDeviceUUID] ;
    if(data && [data isKindOfClass:[NSData class]]) {
        deviceID2 = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }

    // 去过取出为空,则进行生成,并放入剪贴板和KeyChain,函数返回
    if (deviceID1.length==0 && deviceID2.length==0) {
        deviceID = [self generatorDeviceId] ;
        [keychainItem setObject:kDeviceUUID forKey:(id)kSecAttrAccount];
        [keychainItem setObject:deviceID forKey:(id)kSecValueData];

        [pasteboard setValue:deviceID forPasteboardType:kDeviceUUID] ;
        return deviceID ;
    }
    // 成功取出,检查UUID是否符合自定义摘要逻辑
    BOOL deviceIdAvailable1 = [self checkDeviceIdAvailable:deviceID1] ;
    BOOL deviceIdAvailable2 = [self checkDeviceIdAvailable:deviceID2] ;

    // 生成Current UUID
    NSString *uniqueIdentifier = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    // 检查从KeyChain取出的UUID是否包含Current UUID
    if([deviceID1 hasPrefix:uniqueIdentifier]) {
        [pasteboard setValue:deviceID1 forPasteboardType:kDeviceUUID] ;
        return deviceID1 ;
    }
    //检查从粘贴板取出的UUID是否包含Current UUID
    if([deviceID2 hasPrefix:uniqueIdentifier]) {
        [keychainItem setObject:kDeviceUUID forKey:(id)kSecAttrAccount];
        [keychainItem setObject:deviceID2 forKey:(id)kSecValueData];
        return deviceID2 ;
    }

    // KeyChain和剪贴板都符合自定义逻辑
    if(deviceIdAvailable1 && deviceIdAvailable2) {
        // KeyChain和剪贴板相同,返回KeyChain
        if ([deviceID1 isEqualToString:deviceID2]) {
            return deviceID1 ;
        }
        else {
            // KeyChain和剪贴板不同,但是却同时都符合逻辑
            [keychainItem setObject:kDeviceUUID forKey:(id)kSecAttrAccount];
            [keychainItem setObject:deviceID2 forKey:(id)kSecValueData];
            return deviceID2 ;
        }
    }
    // KeyChain符合逻辑，粘贴板不符合逻辑,返回KeyChain并重写剪贴板
    else if (deviceIdAvailable1 && !deviceIdAvailable2) {
        [pasteboard setValue:deviceID1 forPasteboardType:kDeviceUUID] ;
        return deviceID1 ;
    }
    // KeyChain不符合逻辑,剪贴板符合逻辑,返回剪贴板,重写KeyChain
    else if (!deviceIdAvailable1 && deviceIdAvailable2) {
        [keychainItem setObject:kDeviceUUID forKey:(id)kSecAttrAccount];
        [keychainItem setObject:deviceID2 forKey:(id)kSecValueData];
        return deviceID2 ;
    }
    else {
        // 都不符合逻辑,于是重新生成新的
        deviceID = [self generatorDeviceId] ;
        [keychainItem setObject:kDeviceUUID forKey:(id)kSecAttrAccount];
        [keychainItem setObject:deviceID forKey:(id)kSecValueData];
        [pasteboard setValue:deviceID forPasteboardType:kDeviceUUID] ;
        return deviceID ;
    }
    return nil ;
}

/// 通过IDFV取出UUID
+ (NSString *)generatorDeviceId {
    NSString *uniqueIdentifier = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    return [self encryptUUID:uniqueIdentifier] ;
}

// 自定义摘要逻辑,取两个片段进行md5,然后合并md5结果再来一次
// 取UUID然后拼接md5CodeLength长度的摘要
+ (NSString *)encryptUUID:(NSString *)uuid {
    if(uuid.length>20) {
        NSString *subString1 = [uuid substringToIndex:firstLength] ;
        NSString *subString2 = [uuid substringToIndex:secondLength] ;
        subString1 = [self md5Encrypt:subString1] ;
        subString2 = [self md5Encrypt:subString2] ;
        //合并之后再来一次
        NSString *combineString = [subString1 stringByAppendingString:subString2];
        NSString *md5 = [self md5Encrypt:combineString] ;
        if(md5.length >= md5CodeLength) {
            md5 = [md5 substringToIndex:md5CodeLength-1] ;//取前md5CodeLength位
            return [uuid stringByAppendingFormat:@"-%@", md5] ;//加入原文UUID后
        }
    }
    return uuid ;
}

/// 验证合法性
+ (BOOL)checkDeviceIdAvailable:(NSString *)deviceId {
    if(deviceId.length>md5CodeLength) {
        //取出UUID中系统生成的部分,进行自定义逻辑计算
        NSString *uuid = [deviceId substringToIndex:deviceId.length-md5CodeLength] ;
        NSString *encrypt = [self encryptUUID:uuid] ;
        //检查经过自定义摘要逻辑后是否还是原字符串
        //符合即为合法的,且符合自定义逻辑
        if ([encrypt isEqualToString:deviceId] && ![encrypt isEqualToString:uuid]) {
            return YES ;
        }
    }
    return NO ;
}

+ (NSString *)md5Encrypt:(NSString *)string {
    const char *original_str = [string UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original_str, (unsigned int)strlen(original_str), result);
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [hash appendFormat:@"%02X", result[i]];
    }
    return hash;
}
@end

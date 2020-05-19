//
//  DataSecurity.m
//  Util
//
//  Created by BianZheng on 16/4/5.
//  Copyright © 2016年 Computer. All rights reserved.
//

#import "DataSecurity.h"
#import <CommonCrypto/CommonCryptor.h>

@implementation DataSecurity
+ (NSData *)AES128EncryptWithData:(NSData *) data key:(NSData *)key
{
    if (data == nil || data.length == 0 || key == nil || key.length == 0)
    {
        return nil;
    }
    
    const void*  keyPtr = [key bytes];
    char dataPtr[[data length]];
    memcpy(dataPtr, [data bytes], [data length]);
    size_t bufferSize = kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                          kCCAlgorithmAES128,
                                          kCCOptionECBMode + kCCOptionPKCS7Padding,
                                          keyPtr,
                                          kCCKeySizeAES128,
                                          NULL,
                                          dataPtr,
                                          sizeof(dataPtr),
                                          buffer,
                                          bufferSize,
                                          &numBytesEncrypted);
    
    if(cryptStatus == kCCSuccess)
    {
        NSData * retData = [NSData dataWithBytes:buffer length:numBytesEncrypted];
        free(buffer);
        buffer = NULL;
        return retData;
    }
    
    free(buffer);
    buffer = NULL;
    
    return nil;
}

+ (NSData *)AES128DecryptWithData:(NSData *) data key:(NSData *)key
{
    if (data == nil || data.length == 0 || key == nil || key.length == 0)
    {
        return nil;
    }
    
    //按照协议首先进行md5
    NSData* retData = nil;
    //	uint8_t iv[]={ 0, 0x39, 0x9f, 0x3d, 0x12, 0x5d, 0xb5, 0x53, 0xa, 0xb5, 0xe0,
    //        0, 0xd6, 0xb0, 0xf4, 0x5a };
    
    const void* keyPtr = [key bytes];
    
    NSUInteger dataLength = [data length];
    
    //See the doc: For block ciphers, the output size will always be less than or
    //equal to the input size plus the size of one block.
    //That's why we need to add the size of one block here
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmAES128,
                                          kCCOptionECBMode + kCCOptionPKCS7Padding,
                                          keyPtr, kCCKeySizeAES128,
                                          NULL/*iv*/ /* initialization vector (optional) */,
                                          [data bytes], dataLength, /* input */
                                          buffer, bufferSize, /* output */
                                          &numBytesDecrypted);
    
    if (cryptStatus == kCCSuccess)
    {
        //the returned NSData takes ownership of the buffer and will free it on deallocation
        retData= [NSData dataWithBytes:buffer length:numBytesDecrypted];
    }
    
    free(buffer); //free the buffer;
    return retData;
}

+ (NSData *)AES256EncryptWithData:(NSData *) data key:(NSData*)keyData iv:(NSData *) iv
{
    if (data == nil || data.length == 0 || keyData == nil || keyData.length == 0)
    {
        return nil;
    }
    NSData* retData=nil;
    //keyData 必须为32个字节数据

    uint8_t * pIV= (uint8_t *)[iv bytes];

    const void * keyPtr=[keyData bytes];
    
    NSUInteger dataLength = [data length];
    
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmAES128, kCCOptionPKCS7Padding,
                                          keyPtr, kCCKeySizeAES128,
                                          pIV /* initialization vector (optional) */,
                                          [data bytes], dataLength, /* input */
                                          buffer, bufferSize, /* output */
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        //the returned NSData takes ownership of the buffer and will free it on deallocation
        retData= [NSData dataWithBytes:buffer length:numBytesEncrypted];
    }
    
    free(buffer); //free the buffer;
    return retData;
}

+ (NSData *)AES256DecryptWithData:(NSData *) data key:(NSData*)keyData iv:(NSData *) iv
{
    if (data == nil || data.length == 0 || keyData == nil || keyData.length == 0)
    {
        return nil;
    }
    
    NSData* retData=nil;
    
    uint8_t * pIV= (uint8_t *)[iv bytes];
    
    const void* keyPtr=[keyData bytes];
    
    NSUInteger dataLength = [data length];
    
    //See the doc: For block ciphers, the output size will always be less than or
    //equal to the input size plus the size of one block.
    //That's why we need to add the size of one block here
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128, kCCOptionPKCS7Padding,
                                          keyPtr, kCCKeySizeAES128,
                                          pIV /* initialization vector (optional) */,
                                          [data bytes], dataLength, /* input */
                                          buffer, bufferSize, /* output */
                                          &numBytesDecrypted);
    
    if (cryptStatus == kCCSuccess) {
        //the returned NSData takes ownership of the buffer and will free it on deallocation
        retData= [NSData dataWithBytes:buffer length:numBytesDecrypted];
    }
    
    free(buffer); //free the buffer;
    return retData;
}

+ (NSData *) DESEncryptWithData:(NSData *) data keyString:(NSString *) key;
{
    return [DataSecurity desWithData:data keyString:key op:kCCEncrypt];
}

+ (NSData *) DESDecryptWithData:(NSData *) data keyString:(NSString *) key
{
    return [DataSecurity desWithData:data keyString:key op:kCCDecrypt];
}

+ (NSData *) desWithData:(NSData *)data keyString:(NSString *) key op:(CCOperation)op
{
    if (data == nil || data.length == 0 || key == nil || key.length == 0)
    {
        return nil;
    }
    
    char *buffer = malloc(data.length + 8);
    memset(buffer, 0, data.length + 8);
    size_t bufferNumBytes;
    CCCryptorStatus cryptStatus = CCCrypt(op,
                                          kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          [key UTF8String],
                                          kCCKeySizeDES,
                                          NULL,
                                          [data bytes],
                                          [data length],
                                          buffer,
                                          data.length + 8,
                                          &bufferNumBytes);
    if(cryptStatus == kCCSuccess)
    {
        NSData *returnData =  [NSData dataWithBytes:buffer length:bufferNumBytes];
        free(buffer);
        return returnData;
    }
    NSLog(@"des failed！");
    free(buffer);
    return nil;
}

@end

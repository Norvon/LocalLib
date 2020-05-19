//
//  DataSecurity.h
//  Util
//
//  Created by BianZheng on 16/4/5.
//  Copyright © 2016年 Computer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataSecurity : NSObject

/**
 *  @brief AES128位加密方法
 *
 *  @param data 待加密数据
 *  @param key  密钥
 *
 *  @return 返回已加密数据，若加密失败则返回 nil
 */
+ (NSData *)AES128EncryptWithData:(NSData *) data key:(NSData *)key;

/**
 *  @brief AES128位解密方法
 *
 *  @param data 待解密数据
 *  @param key  密钥
 *
 *  @return 返回已解密数据，若解密失败则返回 nil
 */
+ (NSData *)AES128DecryptWithData:(NSData *) data key:(NSData *)key;


/**
 *  @brief AES256位加密方法
 *
 *  @param data    待加密数据
 *  @param keyData 密钥
 *
 *  @return 返回已加密数据，若加密失败则返回 nil
 */
+ (NSData *)AES256EncryptWithData:(NSData *) data key:(NSData*)keyData iv:(NSData *) iv;
/**
 *  @brief AES256位解密方法
 *
 *  @param data    待解密数据
 *  @param keyData 密钥
 *
 *  @return 返回已解密数据，若解密失败则返回 nil
 */
+ (NSData *)AES256DecryptWithData:(NSData *) data key:(NSData*)keyData iv:(NSData *) iv;

/**
 *  @brief DES加密方法
 *
 *  @param data 待加密数据
 *  @param key  密钥
 *
 *  @return 返回已加密数据，若加密失败则返回 nil
 */
+ (NSData *) DESEncryptWithData:(NSData *) data keyString:(NSString *) key;
/**
 *  @brief DES 解密数据
 *
 *  @param data 待解密数据
 *  @param key  密钥
 *
 *  @return 返回已解密数据，若解密失败则返回 nil
 */
+ (NSData *) DESDecryptWithData:(NSData *) data keyString:(NSString *) key;


@end

//
//  CSYDataDigest.h
//  OrangeCDSDesign
//
//  Created by nor on 2019/9/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DataDigest : NSObject
/**
 *  @brief sha1摘要算法
 *
 *  @param data 待进行摘要计算的数据
 *
 *  @return 返回摘要计算的结果，若计算失败返回 nil
 */
+ (NSData *) sha1Digest:(NSData *) data;

/**
 *  @brief md5摘要算法
 *
 *  @param data 待进行摘要计算的数据
 *
 *  @return 返回摘要计算的结果，若计算失败返回 nil
 */
+ (NSData *) md5Digest:(NSData *) data;

/**
 *  @brief 将 NSData数据转成16进制字符串格式
 *
 *  @param data 待转换格式数据
 *
 *  @return 16进制字符串，若转换失败返回 nil
 */
+ (NSString*) binToHexWithData:(NSData*)data;
@end

NS_ASSUME_NONNULL_END

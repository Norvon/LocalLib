//
//  DataKeyChain.h
//  Util
//
//  Created by BianZheng on 16/4/5.
//  Copyright © 2016年 Computer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataKeyChain : NSObject

/**
 *  存储数据到钥匙串中
 *
 *  @param service 名称标识
 *  @param data    数据
 */
+ (void)saveWithService:(NSString *)service data:(id)data;

/**
 *  从钥匙串中读取数据
 *
 *  @param service 名称标识
 *
 *  @return 数据
 */
+ (id)loadWithService:(NSString *)service;

/**
 *  删除数据
 *
 *  @param service 名称标识
 */
+ (void)deleteWithService:(NSString *)service;

@end

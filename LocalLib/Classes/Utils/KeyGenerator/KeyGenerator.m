//
//  KeyGenerator.m
//
//  Created by BianZheng on 16/5/5.
//  Copyright © 2017 HealthCom. All rights reserved.
//

#import "KeyGenerator.h"
#import "DataDigest.h"

@implementation KeyGenerator
+ (NSString *) gen:(NSString *) text
{
    if (text == nil || text.length == 0)
    {
        text = @"";
    }

    // 计算密码码表
    NSString * pwMapString = @"";
    {
        NSString * pwMapRawString = [DataDigest binToHexWithData:[DataDigest md5Digest:[text dataUsingEncoding:NSUTF8StringEncoding]]];
        
        if (pwMapRawString.length != 32)
        {
            return nil;
        }
        
        for (int i = 0; i != pwMapRawString.length; i += 4)
        {
            NSString * s = [pwMapRawString substringWithRange:NSMakeRange(i, 4)];
            s = [DataDigest binToHexWithData:[DataDigest md5Digest:[s dataUsingEncoding:NSUTF8StringEncoding]]];
            pwMapString = [pwMapString stringByAppendingString:s];
        }
    }
    
    // 索引
    NSString * indexString = [DataDigest binToHexWithData:[DataDigest md5Digest:[text dataUsingEncoding:NSUTF8StringEncoding]]];
    if (indexString.length != 32)
    {
        return nil;
    }
    
    // 中间索引可以变换
    
    NSString * retKey = @"";
    for (int i = 0; i != indexString.length; i += 2)
    {
        NSString * s = [indexString substringWithRange:NSMakeRange(i, 2)];
        u_char c1 = [s characterAtIndex:0];
        u_char c2 = [s characterAtIndex:1];
        
        NSUInteger i = [self cal:c1] * 16 + [self cal:c2];
        
        NSString * s1 = [pwMapString substringWithRange:NSMakeRange(i, 1)];
        retKey = [retKey stringByAppendingString:s1];
    }
    return retKey;
}

+ (NSUInteger) cal:(u_char) c
{
    if (c >= '0' && c < '9')
    {
        return c - '0';
    }
    else if (c >= 'A' && c <= 'Z')
    {
        return c - 'A';
    }
    else if (c >= 'a' && c <= 'z')
    {
        return c - 'z';
    }
    
    return 0;
}
@end

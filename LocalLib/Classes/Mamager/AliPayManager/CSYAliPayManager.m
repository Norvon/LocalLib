//
//  CSYAliPayManager.m
//  OrangeCDSDesign
//
//  Created by nor on 2019/7/18.
//

#import "CSYAliPayManager.h"
#import <AlipaySDK/AlipaySDK.h>

@implementation CSYAliPayManager
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static CSYAliPayManager *instance = nil;
    dispatch_once(&onceToken,^{
        instance = [[super allocWithZone:NULL] init];
    });
    return instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedInstance];
}

- (void) payOrder:(NSString *)orderStr fromScheme:(NSString *)schemeStr callback:(CompletionBlock)completionBlock
{
    if (orderStr == nil || orderStr.length == 0 ||
        schemeStr == nil || schemeStr.length == 0)
    {
        return;
    }

    [[AlipaySDK defaultService] payOrder:orderStr
                              fromScheme:schemeStr
                                callback:completionBlock ? : nil];
}


@end

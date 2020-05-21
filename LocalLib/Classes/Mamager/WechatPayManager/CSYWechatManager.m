//
//  CSYWechatPayManager.m
//  OrangeCDSDesign
//
//  Created by nor on 2019/7/18.
//

#import "CSYWechatManager.h"
@implementation CSYWechatManager
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static CSYWechatManager *instance = nil;
    dispatch_once(&onceToken,^{
        instance = [[super allocWithZone:NULL] init];
    });
    return instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedInstance];
}

+ (BOOL) isWXAppInstalled {
    return [WXApi isWXAppInstalled];
}

+ (BOOL) isWXAppSupportApi {
    return [WXApi isWXAppSupportApi];
}

/**
 调起微信支付

 @param payReqDic 传递的参数
 */
- (void)jumpToWxPayDic:(NSDictionary *)payReqDic {
    if (payReqDic.count == 0) {
        return;
    }

    PayReq *request   = [[PayReq alloc] init];
    request.openID    = [payReqDic objectForKey:@"appid"];
    request.partnerId = [payReqDic objectForKey:@"partnerid"];
    request.prepayId  = [payReqDic objectForKey:@"prepayid"];
    request.package   = [payReqDic objectForKey:@"package"];
    request.nonceStr  = [payReqDic objectForKey:@"noncestr"];
    NSString * timeStampString = [payReqDic objectForKey:@"timestamp"];
    request.timeStamp = (UInt32)[timeStampString integerValue];
    request.sign      = [payReqDic objectForKey:@"sign"];

    if ([WXApi isWXAppInstalled] == NO) {
        return;
    }

    if ([WXApi isWXAppSupportApi] == NO) {
        return;
    }

    [WXApi sendReq:request completion:^(BOOL success) {
        NSLog(@"jumpToWxPayDic WXApi sendReq completion");
    }];
}

- (void)loginScope:(NSString *)scope state:(NSString *)state {

    if (!scope.length  || !state.length) {
        return;
    }

    SendAuthReq* req = [[SendAuthReq alloc] init];
    req.scope = scope;
    req.state = state;
    [WXApi sendReq:req completion:^(BOOL success) {
        NSLog(@"loginScope WXApi sendReq completion");
    }];
}

#pragma mark - WXApiDelegate
- (void)onResp:(BaseResp *)resp {
    if (self.delegate) {

        // 支付
        if ([self.delegate respondsToSelector:@selector(wechatPayOnResp:)]) {
            if ([resp isKindOfClass:[PayResp class]]) {
                // 微信支付
                [self.delegate wechatPayOnResp:resp];
            }
        }

        // 登录
        if ([self.delegate respondsToSelector:@selector(wechatLoginOnResp:)]) {
            if ([resp isKindOfClass:[SendAuthResp class]]) {
                // 微信登录
                [self.delegate wechatLoginOnResp:resp];
            }
        }
    }
}

@end

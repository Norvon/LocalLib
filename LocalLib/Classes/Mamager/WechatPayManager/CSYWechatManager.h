//
//  CSYWechatPayManager.h
//  OrangeCDSDesign
//
//  Created by nor on 2019/7/18.
//

#import <Foundation/Foundation.h>
#import <WechatOpenSDK/WXApi.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CSYWechatManagerDelegate <NSObject>


@optional
/**
 微信支付回掉结果

 @param resp 响应结果类
 */
- (void)wechatPayOnResp:(BaseResp *)resp;


/**
 微信登录回掉结果

 @param resp 响应结果类
 */
- (void)wechatLoginOnResp:(BaseResp *)resp;

@end

@interface CSYWechatManager : NSObject<WXApiDelegate>

@property (nonatomic, weak) id<CSYWechatManagerDelegate> delegate;

+ (instancetype)sharedInstance;

/**
 是否安装微信客户端
 */
+ (BOOL) isWXAppInstalled;

/**
 * 当前微信客户端暂不支持支付功能
 */
+ (BOOL) isWXAppSupportApi;

/**
 进行微信支付

 @param payReqDic 传入支付需要数据
 */
- (void)jumpToWxPayDic:(NSDictionary *)payReqDic;

- (void)loginScope:(NSString *)scope state:(NSString *)state;
@end

NS_ASSUME_NONNULL_END

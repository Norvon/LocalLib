//
//  CSYShareManager.h
//  OrangeCDSCounselor
//
//  Created by Norvon on 2020/2/7.
//  Copyright © 2020 Norvon. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CSYShareManager : NSObject
+ (instancetype)sharedInstance;

/// 分享
/// @param currentViewController  CurrentVC
/// @param shareLink 分享的链接
/// @param title 标题
/// @param descr 描述
/// @param webpageUrl 打开的地址
/// @param thumImage thumImage
- (void)showShareWithCurrentVC:(UIViewController *)currentViewController
                     shareLink:(NSString *)shareLink
                         title:(NSString *)title
                         descr:(NSString *)descr
                    webpageUrl:(NSString *)webpageUrl
                     thumImage:(id )thumImage;
@end

NS_ASSUME_NONNULL_END

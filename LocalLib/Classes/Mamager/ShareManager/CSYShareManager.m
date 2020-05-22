//
//  CSYShareManager.m
//  OrangeCDSCounselor
//
//  Created by Norvon on 2020/2/7.
//  Copyright © 2020 Norvon. All rights reserved.
//

#import "CSYShareManager.h"

// other
#import <UShareUI/UShareUI.h>
#import <Toast/UIView+Toast.h>

@implementation CSYShareManager
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static CSYShareManager *instance = nil;
    dispatch_once(&onceToken,^{
        instance = [[super allocWithZone:NULL] init];
    });
    return instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedInstance];
}


- (void)showShareWithCurrentVC:(UIViewController *)currentViewController
                     shareLink:(NSString *)shareLink
                         title:(NSString *)title
                         descr:(NSString *)descr
                    webpageUrl:(NSString *)webpageUrl
                     thumImage:(id )thumImage {

    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {

        UIView *view = currentViewController.view;

        if (!currentViewController || !shareLink || !title || !descr || !webpageUrl || !thumImage ) {
            [view makeToast:@"分享失败"];
            return;
        }

        if (platformType == UMSocialPlatformType_UserDefine_Begin + 1) {

            UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
            pasteboard.string = shareLink;
            [view makeToast:@"复制链接成功"];
            return;
        }

        UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];

        // 创建网页内容对象
        UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:title
                                                                                 descr:descr
                                                                             thumImage:thumImage];
        // 设置网页地址
        shareObject.webpageUrl = webpageUrl;
        // 分享消息对象设置分享内容对象
        messageObject.shareObject = shareObject;
        [[UMSocialManager defaultManager] shareToPlatform:platformType
                                            messageObject:messageObject
                                    currentViewController:currentViewController
                                               completion:^(id result, NSError *error) {
            if (error) {

                NSDictionary *dic = error.userInfo;
                [view makeToast:[dic objectForKey:@"message"]];
            }
        }];
    }];
}
@end

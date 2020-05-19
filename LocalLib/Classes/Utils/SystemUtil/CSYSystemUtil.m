//
//  CSYSystemUtil.m
//  OrangeCDSDesign
//
//  Created by nor on 2019/8/21.
//

#import "CSYSystemUtil.h"

#import <AssetsLibrary/AssetsLibrary.h>
#import <AVFoundation/AVFoundation.h>
#import "LGAlertViewManager.h"

@implementation CSYSystemUtil
+ (BOOL) isCameraAvailable
{
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (authStatus == AVAuthorizationStatusAuthorized || authStatus == AVAuthorizationStatusNotDetermined)
    {
        if ([UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront] &&
            [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear])
        {
            return YES;
        }
        else
        {
            [LGAlertViewManager showAlertViewWithTitle:@"提示"
                                               message:@"相机无法正常使用拍照功能，请检查设备或开启相机权限"
                                                 style:LGAlertViewStyleAlert
                                          buttonTitles:nil
                                     cancelButtonTitle:@"知道了"
                                destructiveButtonTitle:nil
                                         actionHandler:nil
                                         cancelHandler:nil
                                    destructiveHandler:nil
                                          showAnimated:YES
                                     completionHandler:nil];
            return NO;
        }
    }
    else
    {
        if ([UIDevice currentDevice].systemVersion.floatValue < 8.0)
        {

            [LGAlertViewManager showAlertViewWithTitle:@"提示"
                                               message:@"请在iPhone的“设置-隐私-相机”选项中，允许应用访问您的相机"
                                                 style:LGAlertViewStyleAlert
                                          buttonTitles:nil
                                     cancelButtonTitle:@"知道了"
                                destructiveButtonTitle:nil
                                         actionHandler:nil
                                         cancelHandler:nil
                                    destructiveHandler:nil
                                          showAnimated:YES
                                     completionHandler:nil];
            return NO;
        }
        else
        {
            [LGAlertViewManager showAlertViewWithTitle:@"提示"
                                               message:@"请在iPhone的“设置-隐私-相机”选项中，允许应用访问您的相机"
                                                 style:LGAlertViewStyleAlert
                                          buttonTitles:@[@"去设置"]
                                     cancelButtonTitle:@"取消"
                                destructiveButtonTitle:nil
                                         actionHandler:^(LGAlertView * alertView, NSUInteger index, NSString *  title) {
                                             NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                                             if ([[UIApplication sharedApplication] canOpenURL:url])
                                             {
                                                 [[UIApplication sharedApplication] openURL:url];
                                             }
                                         }
                                         cancelHandler:nil
                                    destructiveHandler:nil
                                          showAnimated:YES
                                     completionHandler:nil];
            return NO;
        }
    }

    return YES;
}

+ (BOOL) isAlbumAvailable
{
    ALAuthorizationStatus author = [ALAssetsLibrary authorizationStatus];
    if (author == ALAuthorizationStatusAuthorized || author == ALAuthorizationStatusNotDetermined)
    {
        // 有权限
        return YES;
    }
    else
    {
        if ([UIDevice currentDevice].systemVersion.floatValue < 8.0)
        {
            [LGAlertViewManager showAlertViewWithTitle:@"提示"
                                               message:@"请在iPhone的“设置-隐私-照片”选项中，允许应用访问您的照片"
                                                 style:LGAlertViewStyleAlert
                                          buttonTitles:nil
                                     cancelButtonTitle:@"知道了"
                                destructiveButtonTitle:nil
                                         actionHandler:nil
                                         cancelHandler:nil
                                    destructiveHandler:nil
                                          showAnimated:YES
                                     completionHandler:nil];
            return NO;
        }
        else
        {
            [LGAlertViewManager showAlertViewWithTitle:@"提示"
                                               message:@"请在iPhone的“设置-隐私-照片”选项中，允许应用访问您的照片"
                                                 style:LGAlertViewStyleAlert
                                          buttonTitles:@[@"去设置"]
                                     cancelButtonTitle:@"取消"
                                destructiveButtonTitle:nil
                                         actionHandler:^(LGAlertView * alertView, NSUInteger index, NSString *  title) {
                                             NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                                             if ([[UIApplication sharedApplication] canOpenURL:url])
                                             {
                                                 [[UIApplication sharedApplication] openURL:url];
                                             }
                                         }
                                         cancelHandler:nil
                                    destructiveHandler:nil
                                          showAnimated:YES
                                     completionHandler:nil];
            return NO;
        }
    }
    return YES;
}

+ (BOOL)copyToClipboardWithConten:(NSString *)content {
    if (!content.length) {
        return NO;
    }

    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = content;
    return YES;
    
}
@end

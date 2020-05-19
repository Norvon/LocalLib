//
//  UIView+CSYHUD.m
//  OrangeCDSDesign
//
//  Created by nor on 2019/7/9.
//

#import "UIView+CSYHUD.h"

#import <MBProgressHUD/MBProgressHUD.h>

@implementation UIView (MBProgressHUD)
- (void)makeSuccessHUD:(NSString *)text
{
    [self makeMiddleHudWithCustomViewImage:[UIImage imageNamed:@"checkmark"] text:text];
}

- (void)makeErrorHUD:(NSString *)text
{
    [self makeMiddleHudWithCustomViewImage:[UIImage imageNamed:@"error"] text:text];
}

- (void)makeMiddleHudWithCustomViewImage:(UIImage *)customViewImage text:(NSString *)text
{
    MBProgressHUD *hud = [MBProgressHUD HUDForView:self];
    if (hud != nil) [hud removeFromSuperview];
    // 快速显示一个提示信息
    hud  = [MBProgressHUD showHUDAddedTo:self animated:YES];

    hud.customView=[[UIImageView alloc] initWithImage:customViewImage];
    hud.mode = MBProgressHUDModeCustomView;
    hud.label.text = text;
    [hud showAnimated:YES];
    [hud hideAnimated:YES afterDelay:2];
}

- (void)makeSuccessHUD:(NSString *)text WithBlock:(SuccessHUDBlock)block{
    MBProgressHUD *hud = [MBProgressHUD HUDForView:self];
    if (hud != nil) [hud removeFromSuperview];
    // 快速显示一个提示信息
    hud  = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.customView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"checkmark"]];
    hud.mode = MBProgressHUDModeCustomView;
    hud.label.text = text;
    [hud showAnimated:YES];
    [hud hideAnimated:YES afterDelay:2];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (block) {
            block();
        }
    });
}

- (void)makeHUDOnWindow:(NSString *)text viewController:(UIViewController *)vc blcok:(SuccessHUDBlock)block
{
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:vc.navigationController.view];
    if (hud != nil) [hud removeFromSuperview];
    // 快速显示一个提示信息
    [vc.navigationController.view addSubview:hud];
    hud.customView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"checkmark"]];
    hud.mode = MBProgressHUDModeCustomView;
    hud.label.text = text;
    [hud showAnimated:YES];
    [hud hideAnimated:YES afterDelay:2];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (block) {
            block();
        }
    });
}

- (void)makeHUDWithText:(NSString *)text{
    MBProgressHUD *hud = [MBProgressHUD HUDForView:self];
    if (hud != nil) return ;
    // 快速显示一个提示信息
    hud                = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.layer.cornerRadius = 5;
    hud.label.text      = text;
    [hud showAnimated:YES];
}

- (void)makeHUD {
    MBProgressHUD *hud = [MBProgressHUD HUDForView:self];
    if (hud != nil) return ;
    // 快速显示一个提示信息
    hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.layer.cornerRadius = 5;
    [hud showAnimated:YES];
}

-(void)hideHUDOnViewController:(UIViewController *)vc
{
    MBProgressHUD *hud = [MBProgressHUD HUDForView:vc.navigationController.view];
    if(hud != nil) [hud hideAnimated:YES];
}

-(void)hideHUD{
    MBProgressHUD *hud = [MBProgressHUD HUDForView:self];
    if (hud != nil) [hud hideAnimated:YES];
}
@end

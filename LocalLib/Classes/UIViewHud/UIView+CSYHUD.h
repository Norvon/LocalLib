//
//  UIView+CSYHUD.h
//  OrangeCDSDesign
//
//  Created by nor on 2019/7/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^SuccessHUDBlock) (void);

@interface UIView (CSYHUD)
- (void)makeHUD;
- (void)makeSuccessHUD:(NSString *)text;
- (void)makeErrorHUD:(NSString *)text;
- (void)makeSuccessHUD:(NSString *)text WithBlock:(SuccessHUDBlock)block;
- (void)hideHUD;
- (void)hideHUDOnViewController :(UIViewController *)vc;
- (void)makeHUDWithText:(NSString *)text;
- (void)makeHUDOnWindow:(NSString *)text viewController:(UIViewController *)vc blcok:(SuccessHUDBlock)block;
@end

NS_ASSUME_NONNULL_END

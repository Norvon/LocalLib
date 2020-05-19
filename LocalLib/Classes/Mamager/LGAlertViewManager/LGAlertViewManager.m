
//
//  LGAlertViewManager.m
//  OrangeCDSDesign
//
//  Created by nor on 2019/7/29.
//

#import "LGAlertViewManager.h"

@implementation LGAlertViewManager
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static LGAlertViewManager *instance = nil;
    dispatch_once(&onceToken,^{
        instance = [[super allocWithZone:NULL] init];
    });
    return instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedInstance];
}

+ (LGAlertView *) showAlertViewWithTitle:(NSString *)title
                        message:(NSString *)message
                   buttonTitles:(NSArray<NSString *> *)buttonTitles
              cancelButtonTitle:(NSString *)cancelButtonTitle
                  actionHandler:(LGAlertViewActionHandler)actionHandler
                  cancelHandler:(LGAlertViewHandler)cancelHandler
              completionHandler:(LGAlertViewCompletionHandler)completionHandler {

    LGAlertView * alertView = [[LGAlertView alloc] initWithTitle:title
                                                         message:message
                                                           style:LGAlertViewStyleAlert
                                                    buttonTitles:buttonTitles
                                               cancelButtonTitle:cancelButtonTitle
                                          destructiveButtonTitle:nil
                                                   actionHandler:actionHandler
                                                   cancelHandler:cancelHandler
                                              destructiveHandler:nil];

    [self customViewSetting:alertView];

    [alertView showAnimated:YES completionHandler:completionHandler];

    return alertView;
}


+ (void) showAlertViewWithTitle:(NSString *)title
                        message:(NSString *)message
                          style:(LGAlertViewStyle)style
                   buttonTitles:(NSArray<NSString *> *)buttonTitles
              cancelButtonTitle:(NSString *)cancelButtonTitle
         destructiveButtonTitle:(NSString *)destructiveButtonTitle
                  actionHandler:(LGAlertViewActionHandler)actionHandler
                  cancelHandler:(LGAlertViewHandler)cancelHandler
             destructiveHandler:(LGAlertViewHandler)destructiveHandler
                   showAnimated:(BOOL)animated
              completionHandler:(LGAlertViewCompletionHandler)completionHandler
{
    LGAlertView * alertView = [[LGAlertView alloc] initWithTitle:title
                                                         message:message
                                                           style:style
                                                    buttonTitles:buttonTitles
                                               cancelButtonTitle:cancelButtonTitle
                                          destructiveButtonTitle:destructiveButtonTitle
                                                   actionHandler:actionHandler
                                                   cancelHandler:cancelHandler
                                              destructiveHandler:destructiveHandler];

    [self customViewSetting:alertView];

    [alertView showAnimated:animated completionHandler:completionHandler];
}

+ (void) showAlertViewWithTitle:(NSString *)title
                        message:(NSString *)message
                          style:(LGAlertViewStyle)style
                           view:(UIView *) view
                   buttonTitles:(NSArray<NSString *> *)buttonTitles
              cancelButtonTitle:(NSString *)cancelButtonTitle
         destructiveButtonTitle:(NSString *)destructiveButtonTitle
                  actionHandler:(LGAlertViewActionHandler)actionHandler
                  cancelHandler:(LGAlertViewHandler)cancelHandler
             destructiveHandler:(LGAlertViewHandler)destructiveHandler
                   showAnimated:(BOOL)animated
              completionHandler:(LGAlertViewCompletionHandler)completionHandler
{
    LGAlertView * alertView = [[LGAlertView alloc] initWithViewAndTitle:title
                                                                message:message
                                                                  style:style
                                                                   view:view
                                                           buttonTitles:buttonTitles
                                                      cancelButtonTitle:cancelButtonTitle
                                                 destructiveButtonTitle:destructiveButtonTitle
                                                          actionHandler:actionHandler
                                                          cancelHandler:cancelHandler
                                                     destructiveHandler:destructiveHandler];

    [self customViewSetting:alertView];

    [alertView showAnimated:animated completionHandler:completionHandler];
}

+ (void) customViewSetting:(LGAlertView *) alertView
{
    if (alertView == nil) {
        return;
    }
    UIColor *colorEA5504 = [UIColor colorWithRed:234/255.0 green:85/255.0 blue:4/255.0 alpha:1.0f];
    UIColor *color15223B = [UIColor colorWithRed:21/255.0 green:34/255.0 blue:59/255.0 alpha:1.0f];
    
    alertView.cancelOnTouch = NO;
    alertView.width = UIScreen.mainScreen.bounds.size.width - 80;
    alertView.cancelButtonTitleColor = colorEA5504;
    alertView.cancelButtonTitleColorHighlighted = colorEA5504;
    alertView.cancelButtonBackgroundColorHighlighted = [UIColor whiteColor];
    alertView.cancelButtonFont = [UIFont systemFontOfSize:16];

    alertView.titleFont = [UIFont boldSystemFontOfSize:16];
    alertView.titleTextColor = color15223B;

    alertView.messageFont = [UIFont systemFontOfSize:12];
    alertView.messageTextColor = color15223B;

    alertView.buttonsTitleColor = [UIColor whiteColor];
    alertView.buttonsBackgroundColor = colorEA5504;
    alertView.buttonsBackgroundColorHighlighted = colorEA5504;
    alertView.buttonsFont = [UIFont systemFontOfSize:16];
}

@end

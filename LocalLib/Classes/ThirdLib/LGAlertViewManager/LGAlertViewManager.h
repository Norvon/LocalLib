//
//  LGAlertViewManager.h
//  OrangeCDSDesign
//
//  Created by nor on 2019/7/29.
//

#import <Foundation/Foundation.h>

#import "LGAlertView.h"

NS_ASSUME_NONNULL_BEGIN

@interface LGAlertViewManager : NSObject

/// 较少参数
+ (LGAlertView *) showAlertViewWithTitle:(NSString *)title
                        message:(NSString *)message
                   buttonTitles:(NSArray<NSString *> *)buttonTitles
              cancelButtonTitle:(NSString *)cancelButtonTitle
                  actionHandler:(LGAlertViewActionHandler)actionHandler
                  cancelHandler:(LGAlertViewHandler)cancelHandler
              completionHandler:(LGAlertViewCompletionHandler)completionHandler;

/// 默认
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
              completionHandler:(LGAlertViewCompletionHandler)completionHandler;

/// 包含view
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
              completionHandler:(LGAlertViewCompletionHandler)completionHandler;
@end

NS_ASSUME_NONNULL_END

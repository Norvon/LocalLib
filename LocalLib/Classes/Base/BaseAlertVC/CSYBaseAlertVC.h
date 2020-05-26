//
//  CSYBaseAlertVC.h
//  OrangeCDSDesign
//
//  Created by nor on 2019/12/9.
//

#import "BaseViewController.h"

#import "CSYBaseAlertHeadView.h"

NS_ASSUME_NONNULL_BEGIN

@interface CSYBaseAlertVC : BaseViewController

@property (nonatomic, strong) UIView *currentContentView;
@property (nonatomic, strong) CSYBaseAlertHeadView *headView;


/// 显示
- (void)showWithObj:(id)obj;
/// 隐藏
- (void)dismiss;

/// 点击view
- (void)clickBackGroundView;
@end

NS_ASSUME_NONNULL_END

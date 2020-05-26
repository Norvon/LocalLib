//
//  CSYBaseAlertHeadView.h
//  OrangeCDSDesign
//
//  Created by nor on 2019/12/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CSYBaseAlertHeadView : UIView

@property (nonatomic, copy) void (^clickCancelBlock)(void);

@property (nonatomic, strong) UIButton *cancelBtn;
@property (nonatomic, strong) UILabel *titleLabel;
@end

NS_ASSUME_NONNULL_END

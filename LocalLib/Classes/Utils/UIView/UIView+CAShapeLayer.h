//
//  UIView+CAShapeLayer.h
//  OrangeCDSDesign
//
//  Created by nor on 2019/12/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (CAShapeLayer)

/// 底部弧度
/// @param radian 弧度高度
- (CAShapeLayer *)getBottomShapeLayerWithRadian:(CGFloat) radian;

/// 设置画圆角大小和位置
- (void)setCornerRadius:(CGFloat)value rectCorners:(UIRectCorner)rectCorner;
@end

NS_ASSUME_NONNULL_END

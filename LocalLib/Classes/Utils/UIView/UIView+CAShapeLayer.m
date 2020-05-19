//
//  UIView+CAShapeLayer.m
//  OrangeCDSDesign
//
//  Created by nor on 2019/12/17.
//

#import "UIView+CAShapeLayer.h"

@implementation UIView (CAShapeLayer)
- (CAShapeLayer *)getBottomShapeLayerWithRadian:(CGFloat) radian {
    if(radian == 0) return nil;
    CGFloat t_width = CGRectGetWidth(self.frame); // 宽
    CGFloat t_height = CGRectGetHeight(self.frame); // 高
    CGFloat height = fabs(radian); // 圆弧高度
    CGFloat x = 0;
    CGFloat y = 0;
    
    // 计算圆弧的最大高度
    CGFloat maxRadian = 0;

    maxRadian =  MIN(t_height, t_width / 2);
     
    if(height > maxRadian){
        return nil;
    }
    
    // 计算半径
    CGFloat radius = 0;
    CGFloat c = sqrt(pow(t_width / 2, 2) + pow(height, 2));
    CGFloat sin_bc = height / c;
    radius = c / ( sin_bc * 2);
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setFillColor:[[UIColor whiteColor] CGColor]];
    CGMutablePathRef path = CGPathCreateMutable();
    
    if(radian > 0) {
        CGPathMoveToPoint(path,NULL, t_width,t_height - height);
        CGPathAddArc(path,NULL, t_width / 2, t_height - radius, radius, asin((radius - height ) / radius), M_PI - asin((radius - height ) / radius), NO);
    } else {
        CGPathMoveToPoint(path,NULL, t_width,t_height);
        CGPathAddArc(path,NULL, t_width / 2, t_height + radius - height, radius, 2 * M_PI - asin((radius - height ) / radius), M_PI + asin((radius - height ) / radius), YES);
    }
    CGPathAddLineToPoint(path,NULL, x, y);
    CGPathAddLineToPoint(path,NULL, t_width, y);
    
    CGPathCloseSubpath(path);
    [shapeLayer setPath:path];
    CFRelease(path);
    
    return shapeLayer;
}

- (void)setCornerRadius:(CGFloat)value rectCorners:(UIRectCorner)rectCorner {

    [self layoutIfNeeded];

    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                               byRoundingCorners:rectCorner
                                                     cornerRadii:CGSizeMake(value, value)];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = self.bounds;
    shapeLayer.path = path.CGPath;
    self.layer.mask = shapeLayer;
}
@end

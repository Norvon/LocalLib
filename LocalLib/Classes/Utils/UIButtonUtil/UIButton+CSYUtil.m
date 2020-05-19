//
//  UIButton+CSYUtil.m
//  OrangeCDSDesign
//
//  Created by nor on 2019/9/30.
//

#import "UIButton+CSYUtil.h"

#import "UIImage+CSYUtil.h"

@implementation UIButton (CSYUtil)
- (void)setBackgroundColor:(UIColor *)color forState:(UIControlState)state {
    UIImage *colorImage = [UIImage createImageWithColor:color];

    [self setBackgroundImage:colorImage forState:state];
}
@end

//
//  UIImage+CSYUtil.m
//  OrangeCDSDesign
//
//  Created by nor on 2019/7/14.
//

#import "UIImage+CSYUtil.h"

@implementation UIImage (CSYUtil)
+ (UIImage *)createImageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

+ (UIImage *)base64StringToImage:(NSString *)base64Str {

    if (!base64Str.length) {
        return nil;
    }

    NSURL *url = [NSURL URLWithString: base64Str];
    NSData *data = [NSData dataWithContentsOfURL: url];
    UIImage *image = [UIImage imageWithData: data];

    return image;
}

// 压缩图片
- (UIImage*)imageWithScaledToSize:(CGSize)newSize {
    UIGraphicsBeginImageContext(newSize);
    [self drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return newImage;
}
@end

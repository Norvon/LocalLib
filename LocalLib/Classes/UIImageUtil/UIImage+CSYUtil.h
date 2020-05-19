//
//  UIImage+CSYUtil.h
//  OrangeCDSDesign
//
//  Created by nor on 2019/7/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (CSYUtil)

/**
 通过颜色创建图片

 @param color 颜色
 @return 图片
 */
+ (UIImage *)createImageWithColor:(UIColor *)color;


/**
 通过base64字符串获取图片
 */
+ (UIImage *)base64StringToImage:(NSString *)base64Str;

/**
 压缩图片为指定大小
 */
- (UIImage*)imageWithScaledToSize:(CGSize)newSize;
@end

NS_ASSUME_NONNULL_END

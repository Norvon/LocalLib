//
//  ColorMacros.h
//  OrangeCDSDesign
//
//  Created by nor on 2019/7/5.
//

#ifndef ColorMacros_h
#define ColorMacros_h

#define kRGB(r,g,b) ([UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0f])
#define kRGBA(r,g,b,a) ([UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a])
#define kRGBColor16Bit(RGB) ([UIColor colorWithRed:((float)((RGB & 0xFF0000) >> 16)) / 255.0 \
green:((float)((RGB & 0xFF00) >> 8)) / 255.0 \
blue:((float)((RGB & 0xFF))) / 255.0 \
alpha:1.0])

#define kRGBColor16BitAlpha(RGB, a) ([UIColor colorWithRed:((float)((RGB & 0xFF0000) >> 16)) / 255.0 \
                                                     green:((float)((RGB & 0xFF00) >> 8)) / 255.0 \
                                                      blue:((float)((RGB & 0xFF))) / 255.0 \
                                                     alpha:((float)(a / 100.0))])

// 文字颜色定义
#define kCSYColorClear  ([UIColor clearColor])
#define kCSYColorRed    ([UIColor redColor])
#define kCSYColorWhite  (kRGB(0xff, 0xff, 0xff))
#define kCSYColorBlack  (kRGB(0x00, 0x00, 0x00))
#define kCSYColorEA5504 (kRGBColor16Bit(0xEA5504)) // 橙色
#define kCSYColor9399A5 (kRGBColor16Bit(0x9399a5)) // 灰色
#define kCSYColor15223B (kRGBColor16Bit(0x15223b)) // 黑色
#define kCSYColor5272B1 (kRGBColor16Bit(0x5272b1)) // 蓝色
#define kCSYColor333333 (kRGBColor16Bit(0x333333))
#define kCSYColorE2E2E2 (kRGBColor16Bit(0xE2E2E2))
#define kCSYColorF5F5F5 (kRGBColor16Bit(0xF5F5F5))
#define kCSYColorE1E1E1 (kRGBColor16Bit(0xE1E1E1))
#define kCSYColorD6D7DC (kRGBColor16Bit(0xD6D7DC))
#define kCSYColorF4F4F4 (kRGBColor16Bit(0xf4f4f4))
#define kCSYColorCBCBCB (kRGBColor16Bit(0xCBCBCB))
#define kCSYColorFFF5EF (kRGBColor16Bit(0xFFF5EF))
#define kCSYColorEEEEEE (kRGBColor16Bit(0xEEEEEE))
#define kCSYColorD8D8D8 (kRGBColor16Bit(0xD8D8D8))
#define kCSYColorC55416 (kRGBColor16Bit(0xC55416))
#define kCSYColorFDB803 (kRGBColor16Bit(0xFDB803))
#define kCSYColorE6A000 (kRGBColor16Bit(0xE6A000))
#define kCSYColorFDB803 (kRGBColor16Bit(0xFDB803))
#define kCSYColorDCDCDC (kRGBColor16Bit(0xDCDCDC))
#define kCSYColorFFCCB1 (kRGBColor16Bit(0xFFCCB1))
#define kCSYColorFFFAF8 (kRGBColor16Bit(0xFFFAF8))
#define kCSYColor8A8A8A (kRGBColor16Bit(0x8A8A8A))
#define kCSYColor666666 (kRGBColor16Bit(0x666666))
#define kCSYColorD1D1D1 (kRGBColor16Bit(0xD1D1D1))




#define kCSYColorWhiteAlpha40 (kRGBColor16BitAlpha(0xffffff, 40))
#define kCSYColorBlackAlpha20 (kRGBColor16BitAlpha(0x000000, 20))
#define kCSYColor8A8A8AAlpha50 (kRGBColor16BitAlpha(0x8A8A8A, 50))



#define kCSYGradientColorToColotHeightWidth(c1, c2, width, height)\
({\
    CGSize size = CGSizeMake(width, height); \
    UIGraphicsBeginImageContextWithOptions(size, NO, 0); \
    CGContextRef context = UIGraphicsGetCurrentContext(); \
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB(); \
     \
    NSArray* colors = [NSArray arrayWithObjects:(id)c1.CGColor, (id)c2.CGColor, nil]; \
    CGGradientRef gradient = CGGradientCreateWithColors(colorspace, (__bridge CFArrayRef)colors, NULL); \
    CGContextDrawLinearGradient(context, gradient, CGPointMake(0, 0), CGPointMake(width, height), 0); \
     \
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext(); \
     \
    CGGradientRelease(gradient); \
    CGColorSpaceRelease(colorspace); \
    UIGraphicsEndImageContext(); \
    [UIColor colorWithPatternImage:image]; \
})


#endif /* ColorMacros_h */

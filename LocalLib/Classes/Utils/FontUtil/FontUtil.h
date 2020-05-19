//
//  FontUtil.h
//  OrangeCDSDesign
//
//  Created by nor on 2019/7/14.
//

#import <Foundation/Foundation.h>

@interface FontUtil : NSObject
/**
 *  计算文本尺寸
 *
 *  @param text 文本内容
 *  @param font 字体
 *  @param size 尺寸范围
 *
 *  @return 返回相应文本尺寸
 */
+ (CGSize) calTextSize:(NSString * ) text font:(UIFont *) font size:(CGSize) size;

/**
 *  计算标签高度
 *
 *  @param label 标签
 *  @param size  尺寸范围
 *
 *  @return 返回相应标签尺寸
 */
+ (CGSize) calLabelSize:(UILabel *) label size:(CGSize) size;

/**
 *  计算指定行数下所需文本内容
 *
 *  @param text 文本内容
 *  @param font 字体
 *  @param size 尺寸范围
 *  @param line 指定行数
 *
 *  @remark 若指定行数不能容纳所含文本，则截断并增加......后缀，若克容纳则完整显示。
 *
 *  @return 返回所需文本内容
 */
+ (NSString * ) calLineLabelText:(NSString * ) text font:(UIFont *) font size:(CGSize) size line:(NSUInteger) line;
/**
 *  计算文本尺寸
 *
 *  @param text           文本内容
 *  @param font           字体
 *  @param size           尺寸范围
 *  @param space          间距大小
 *
 *  @return 返回相应文本尺寸
 */
+ (CGSize) calTextSize:(NSString * ) text font:(UIFont *) font size:(CGSize) size space:(CGFloat)space;

/**
 *  富文本
 *
 *  @param text  文本内容
 *  @param font  字体
 *  @param size  尺寸范围
 *  @param space 间距大小
 *  @param size  控件尺寸
 *  @return 富文本
 */

+(NSAttributedString*)calTextAttributedString:(NSString*) text font:(UIFont *) font space:(CGFloat) space size:(CGSize)size;

/**
 *  计算文本尺寸
 *
 *  @param text 文本内容
 *  @param font 字体
 *  @param size 尺寸范围
 *  @param line 文本行数
 *
 *  @return 返回相应文本大小
 */
+ (CGSize) calTextSize:(NSString * ) text font:(UIFont *) font size:(CGSize) size line:(NSUInteger) line;
@end

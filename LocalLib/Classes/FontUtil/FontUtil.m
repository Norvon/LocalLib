//
//  FontUtil.m
//  OrangeCDSDesign
//
//  Created by nor on 2019/7/14.
//

#import "FontUtil.h"

@implementation FontUtil
+ (CGSize) calTextSize:(NSString * ) text font:(UIFont *) font size:(CGSize) size
{
    if (text == nil || font == nil)
    {
        return CGSizeZero;
    }
    
    NSDictionary *attribute = @{NSFontAttributeName: font};
    NSStringDrawingOptions options = NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    
    CGSize retSize = [text boundingRectWithSize:size options: options attributes:attribute context:nil].size;
    return retSize;
}

+ (CGSize) calLabelSize:(UILabel *) label size:(CGSize) size
{
    if (label == nil)
    {
        return CGSizeZero;
    }
    
    //    [self layoutConstriant];
    
    UIFont * font = label.font ? : [UIFont systemFontOfSize:14.0f];
    return [FontUtil calTextSize:label.text font:font size:size];
}

+ (NSString * ) calLineLabelText:(NSString * ) text font:(UIFont *) font size:(CGSize) size line:(NSUInteger) line
{
    if (text == nil || font == nil)
    {
        return @"";
    }
    
    if (([FontUtil calTextSize:text font:font size:size].height / font.lineHeight) <= line)
    {
        return text;
    }
    else
    {
        NSInteger index = 0;
        for (NSInteger i = text.length; i >= 0; --i)
        {
            NSString * s = [text substringToIndex:i];
            CGSize targetSize = [FontUtil calTextSize:s font:font size:size];
            if ((targetSize.height / font.lineHeight) <= line)
            {
                index = i;
                break;
            }
        }
        
        NSString * appendString = @"......";
        
        if (index >= appendString.length / 2)
        {
            text = [text substringToIndex:index - appendString.length / 2];
        }
        
        text = [text stringByAppendingString:appendString];
        
        return text;
    }
}


+ (CGSize) calTextSize:(NSString * ) text font:(UIFont *) font size:(CGSize) size space:(CGFloat)space
{
    if (text == nil || font == nil)
    {
        return CGSizeZero;
    }
    CGFloat textWidth = [text sizeWithAttributes:@{NSFontAttributeName : font}].width;
    NSMutableParagraphStyle* paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    
    if (textWidth > size.width)
    {
        [paragraphStyle setLineSpacing:space];
    }
    
    
    NSDictionary *attribute = @{NSFontAttributeName: font,NSParagraphStyleAttributeName : paragraphStyle.copy};
    NSStringDrawingOptions options = NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    
    NSMutableAttributedString *attrStrM = [[NSMutableAttributedString alloc] initWithString:text attributes:attribute];
    CGSize retSize = [attrStrM boundingRectWithSize:size options:options context:nil].size;
    
    return retSize;
}


+(NSAttributedString*)calTextAttributedString:(NSString*) text font:(UIFont *) font space:(CGFloat) space size:(CGSize)size
{
    CGFloat textWidth = [text sizeWithAttributes:@{NSFontAttributeName: font}].width;
    
    if (text > 0)
    {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        if (textWidth > size.width)
        {
            paragraphStyle.lineSpacing = space;
        }
        
        NSMutableDictionary *attrDic = [NSMutableDictionary dictionary];
        attrDic[NSParagraphStyleAttributeName] = paragraphStyle;
        
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text attributes:attrDic];
        
        return attributedString.copy;
    }
    
    return nil;
    
}

+(CGSize)calTextSize:(NSString *)text font:(UIFont *)font size:(CGSize)size line:(NSUInteger)line
{
    if (text == nil || font == nil)
    {
        return CGSizeZero;
    }
    
    NSDictionary *attribute = @{NSFontAttributeName: font};
    NSStringDrawingOptions options = NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    
    CGSize retSize = [text boundingRectWithSize:size options: options attributes:attribute context:nil].size;
    
    if (line>0 && (retSize.height / font.lineHeight) >= line)
    {
        retSize.height =font.lineHeight * line;
    }
    
    return retSize;
}

@end

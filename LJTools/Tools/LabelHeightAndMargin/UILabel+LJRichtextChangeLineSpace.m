//
//  UILabel+LJRichtextChangeLineSpace.m
//  LJTools
//
//  Created by liangju on 12/2/16.
//  Copyright © 2016 https://liuliangju.github.io. All rights reserved.
//

#import "UILabel+LJRichtextChangeLineSpace.h"
#import <CoreText/CoreText.h>

static const CGFloat kTextViewLinepace = 6.0f;                  //行间间距
static const CGFloat kTextViewkern = 0.5;                       //文字间距

@implementation UILabel (LJRichtextChangeLineSpace)

/**
 *  根据文字和字体，计算文字的特定高度SpecialWidth内的显示高度
 */
+ (CGFloat)initWithLabel:(UILabel *)label withSpecialWidth:(CGFloat)inWidth withFontSize:(CGFloat)fontSize {
    NSString *labelText = label.text;
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    /** 行高 */
    paraStyle.lineSpacing = kTextViewLinepace;
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    
    // NSKernAttributeName字体间距
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@(kTextViewkern)
                          };
    CGSize size = [labelText boundingRectWithSize:CGSizeMake(inWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    
    return size.height;
}

/**
 *  改变行间距
 */
+ (void)changeLineSpaceForLabel:(UILabel *)label withSpace:(CGFloat)space {
    
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    [attributedString addAttribute:NSParagraphStyleAttributeName
                             value:paragraphStyle
                             range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
}

/**
 *  改变字间距
 */
+ (void)changeWordSpaceForLabel:(UILabel *)label withSpace:(CGFloat)space {
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(space)}];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [attributedString addAttribute:NSParagraphStyleAttributeName
                             value:paragraphStyle
                             range:NSMakeRange(0, [labelText length])];
    
    label.attributedText = attributedString;
    [label sizeToFit];
}

/**
 *  改变行间距和字间距
 */
+ (void)changeSpaceForLabel:(UILabel *)label withLineSpace:(CGFloat)lineSpace wordSpace:(CGFloat)wordSpace {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:label.text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpace; // 调整行间距
    NSRange range = NSMakeRange(0, [attributedString length]);
    CFNumberRef num = CFNumberCreate(kCFAllocatorDefault,kCFNumberSInt8Type,&wordSpace);
    [attributedString addAttribute:(id)kCTKernAttributeName value:(__bridge id)num range:range];
    CFRelease(num);
    
    [attributedString addAttribute:NSParagraphStyleAttributeName
                             value:paragraphStyle
                             range:range];
    label.attributedText = attributedString;
    [label sizeToFit];
}

@end

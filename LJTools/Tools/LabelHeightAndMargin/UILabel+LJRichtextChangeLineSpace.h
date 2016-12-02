//
//  UILabel+LJRichtextChangeLineSpace.h
//  LJTools
//
//  Created by liangju on 12/2/16.
//  Copyright © 2016 https://liuliangju.github.io. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (LJRichtextChangeLineSpace)

/**
 *  根据文字和字体，计算文字的特定高度SpecialWidth内的显示高度
 */
+ (CGFloat)initWithLabel:(UILabel *)label withSpecialWidth:(CGFloat)inWidth withFontSize:(CGFloat)fontSize;

/**
 *  改变行间距
 */
+ (void)changeLineSpaceForLabel:(UILabel *)label WithSpace:(CGFloat)space;

/**
 *  改变字间距
 */
+ (void)changeWordSpaceForLabel:(UILabel *)label WithSpace:(CGFloat)space;

/**
 *  改变行间距和字间距
 */
+ (void)changeSpaceForLabel:(UILabel *)label withLineSpace:(CGFloat)lineSpace WordSpace:(CGFloat)wordSpace;

@end

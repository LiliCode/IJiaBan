//
//  UIColor+Extension.h
//  yuanquan
//
//  Created by 圈圈科技 on 15/12/28.
//  Copyright (c) 2015年 圈圈科技. All rights reserved.
//

#import <UIKit/UIKit.h>


#define C_999999                @"#999999"

@interface UIColor (Extension)

/**
 *  获取十六进制颜色
 */
+ (UIColor *)colorWithHexValue:(NSString*)hexValue alpha:(CGFloat)alpha;

/**
 *  三基色
 */
+ (UIColor *)colorWithR:(CGFloat)R G:(CGFloat)G B:(CGFloat)B alpha:(CGFloat)alpha;

@end

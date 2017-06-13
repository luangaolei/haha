//
//  UIColor+HexString.h
//  Electricity
//
//  Created by lgl on 2017/6/13.
//  Copyright © 2017年 lgl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HexString)

/**
 * @brief 根据十六进制获取颜色
 *
 * @param hexString 十六进制字符串. 例: #333333
 *
 * @return UIColor
 */
+ (UIColor *)colorFromHexString:(NSString *)hexString;


/**
 * @brief 根据颜色创建UIImage
 *
 * @@param color 颜色
 */
+ (UIImage *)createImageWithColor:(UIColor *)color;

@end

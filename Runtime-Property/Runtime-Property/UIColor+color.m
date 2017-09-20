//
//  UIColor+color.m
//  LocationDemo
//
//  Created by 黎明 on 2017/9/20.
//  Copyright © 2017年 黎明. All rights reserved.
//

#import "UIColor+color.h"
#import <objc/objc-runtime.h>

static NSString const *gold_color_key = @"gold_color_key";

@implementation UIColor (color)

+ (UIColor *)goldColor {
    UIColor *color = objc_getAssociatedObject(self, &gold_color_key);
    if (!color) {
        color = [UIColor colorWithRed:1 green:1 blue:0 alpha:1.0];
        objc_setAssociatedObject(self, &gold_color_key, color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return color;
}


@end

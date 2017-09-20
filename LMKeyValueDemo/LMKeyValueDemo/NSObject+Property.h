//
//  NSObject+Property.h
//  RunTimeDemo
//
//  Created by 黎明 on 2017/9/18.
//  Copyright © 2017年 黎明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Property)

+ (instancetype)valueFromKeyValue:(id)keyValue;
+ (NSMutableArray *)valueArrayFromArray:(NSArray *)array;

@end

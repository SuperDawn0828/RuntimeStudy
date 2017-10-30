//
//  NSObject+Property.m
//  Runtime-Property
//
//  Created by 黎明 on 2017/9/21.
//  Copyright © 2017年 黎明. All rights reserved.
//

#import "NSObject+Property.h"
#import <objc/runtime.h>

@implementation NSObject (Property)

+ (NSArray *)objectPropertyAndType
{
    unsigned int count = 0;
    objc_property_t *propertys = class_copyPropertyList([self class], &count);
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < count; i++) {
        objc_property_t property = propertys[i];
        NSString *propertyName = [NSString stringWithUTF8String:property_getName(property)];
        NSString *propertyAttri = [NSString stringWithUTF8String:property_getAttributes(property)];
        [array addObject:@{@"propertyName": propertyName, @"propertyAttri": propertyAttri}];
    }
    return [array copy];
}

@end

//
//  NSObject+Property.m
//  RunTimeDemo
//
//  Created by 黎明 on 2017/9/18.
//  Copyright © 2017年 黎明. All rights reserved.
//

#import "NSObject+Property.h"
#import <objc/runtime.h>
#import "LMProperty.h"

@implementation NSObject (Property)

+ (instancetype)valueFromKeyValue:(id)keyValue
{
    id objectClass = [[self alloc] init];
    NSArray *array = [self getObjectPropertyAndType];
    [objectClass setObjectPropertyList:array keyValue:keyValue];
    return objectClass;
}

+ (NSMutableArray *)valueArrayFromArray:(NSArray *)array
{
    __block NSMutableArray *valueArray = [NSMutableArray arrayWithCapacity:array.count];
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [valueArray addObject:[self valueFromKeyValue:obj]];
    }];
    return valueArray;
}

- (void)setObjectPropertyList:(NSArray *)array keyValue:(id)keyValue
{
    [array enumerateObjectsUsingBlock:^(LMProperty *property, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *name = property.name;
        LMPropertyType *type = property.type;
        id value = keyValue[name];
        
        if (!type.fromFoundation && type.typeClass) {
            if (value != nil) {
                value = [type.typeClass valueFromKeyValue:value];
            }
        } else if (type.typeClass == [NSString class]) {
            if ([value isKindOfClass:[NSNumber class]]) {
                value = [value absoluteString];
            } else if ([value isKindOfClass:[NSURL class]]) {
                value = [value absoluteString];
            }
        } else if ([value isKindOfClass:[NSString class]]) {
            if (type.typeClass == [NSURL class]) {
                value = [NSURL URLWithString:value];
            } else if (type.isNumberType) {
                if (type.isBoolType) {
                    if ([value isEqualToString:@"yes"] || [value isEqualToString:@"true"]) {
                        value = @YES;
                    } else {
                        value = @NO;
                    }
                } else {
                    value = [[[NSNumberFormatter alloc] init] numberFromString:value];
                }
            }
        } else if (type.isNumberType) {
            if (![value isKindOfClass:[NSNumber class]]) {
                value = @0;
            } else {
                if (type.isBoolType) {
                    if ([value isEqualToString:@"yes"] || [value isEqualToString:@"true"]) {
                        value = @YES;
                    } else {
                        value = @NO;
                    }
                }
            }
        }
        
        [self setValue:value forKey:name];
    }];
}

- (NSArray *)getObjectPropertyAndType
{
    unsigned int count = 0;
    objc_property_t *propertys = class_copyPropertyList([self class], &count);
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i < count; i++) {
        objc_property_t property = propertys[i];
        LMProperty *propertyKey = [LMProperty propertyKeyWithProperty:property];
        [array addObject:propertyKey];
    }
    return array;
}


@end

//
//  LMProperty.m
//  LMKeyValueDemo
//
//  Created by 黎明 on 2017/9/20.
//  Copyright © 2017年 黎明. All rights reserved.
//

#import "LMProperty.h"

@interface LMProperty ()

@property (nonatomic, strong, readwrite) NSString *name;

@property (nonatomic, strong, readwrite) LMPropertyType *type;

@end

@implementation LMProperty

+ (instancetype)propertyKeyWithProperty:(objc_property_t)property
{
    return [[self alloc] initWithProperty:property];
}

- (instancetype)initWithProperty:(objc_property_t)property
{
    self = [super init];
    if (self) {
        self.property = property;
        [self variableNameAndType:property];
    }
    return self;
}

- (void)variableNameAndType:(objc_property_t)property
{
    NSString *name = [NSString stringWithUTF8String:property_getName(property)];
    NSString *arrributes = [NSString stringWithUTF8String:property_getAttributes(property)];
    
    self.name = name;
    self.type = [LMPropertyType propertyTypeWithCode:arrributes];
}


@end

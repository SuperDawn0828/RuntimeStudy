//
//  LMProperty.h
//  LMKeyValueDemo
//
//  Created by 黎明 on 2017/9/20.
//  Copyright © 2017年 黎明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "LMPropertyType.h"

@interface LMProperty : NSObject

@property (nonatomic, assign) objc_property_t property;

@property (nonatomic, strong, readonly) NSString *name;

@property (nonatomic, strong, readonly) LMPropertyType *type;

+ (instancetype)propertyKeyWithProperty:(objc_property_t)property;

@end

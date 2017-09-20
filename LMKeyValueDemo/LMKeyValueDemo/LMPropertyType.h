//
//  LMPropertyType.h
//  LMKeyValueDemo
//
//  Created by 黎明 on 2017/9/20.
//  Copyright © 2017年 黎明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LMPropertyType : NSObject

@property (nonatomic, strong) NSString *type;

@property (nonatomic, strong) NSString *code;

@property (nonatomic, readonly, getter=isNumberType) BOOL numberType;

@property (nonatomic, readonly, getter=isBoolType) BOOL boolType;

@property (nonatomic, readonly, getter=isIdType) BOOL idType;

@property (nonatomic, readonly, getter=isFromFoundation) BOOL fromFoundation;

@property (nonatomic, readonly) Class typeClass;

+ (instancetype)propertyTypeWithCode:(NSString *)code;

@end

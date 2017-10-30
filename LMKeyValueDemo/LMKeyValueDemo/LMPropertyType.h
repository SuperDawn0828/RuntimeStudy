//
//  LMPropertyType.h
//  LMKeyValueDemo
//
//  Created by 黎明 on 2017/9/20.
//  Copyright © 2017年 黎明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LMPropertyType : NSObject
//属性类型
@property (nonatomic, strong) NSString *type;
//属性类型编码
@property (nonatomic, strong) NSString *code;
//是否是基本数据类型
@property (nonatomic, readonly, getter=isNumberType) BOOL numberType;
//是否是BOOL类型
@property (nonatomic, readonly, getter=isBoolType) BOOL boolType;
//是否是id类型
@property (nonatomic, readonly, getter=isIdType) BOOL idType;
//是否来自Foundation框架
@property (nonatomic, readonly, getter=isFromFoundation) BOOL fromFoundation;
//属性类型的类
@property (nonatomic, readonly) Class typeClass;

+ (instancetype)propertyTypeWithCode:(NSString *)code;

@end

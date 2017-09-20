//
//  LMPropertyType.m
//  LMKeyValueDemo
//
//  Created by 黎明 on 2017/9/20.
//  Copyright © 2017年 黎明. All rights reserved.
//

#import "LMPropertyType.h"

@interface LMPropertyType ()

@property (nonatomic, assign, readwrite) BOOL idType;

@property (nonatomic, assign, readwrite) BOOL boolType;

@property (nonatomic, assign, readwrite) BOOL numberType;

@property (nonatomic, assign, readwrite) BOOL fromFoundation;

@property (nonatomic, readwrite) Class typeClass;

@end

@implementation LMPropertyType

+ (instancetype)propertyTypeWithCode:(NSString *)code
{
    return [[self alloc] initWithCode:code];
}

- (instancetype)initWithCode:(NSString *)code
{
    if (self) {
        self.code = code;
        [self variableType:code];
    }
    return self;
}

- (void)variableType:(NSString *)arrributes
{
    NSUInteger dotLocation = [arrributes rangeOfString:@","].location;
    NSUInteger loaction = 1;
    NSString *variableType = [arrributes substringWithRange:NSMakeRange(loaction, dotLocation - 1)];
    
    if ([variableType isEqualToString:@"@"]) {
        self.type = @"id";
        self.idType = YES;
    } else if ([variableType containsString:@"@\""] && variableType.length > 3) {
        self.type = [variableType substringWithRange:NSMakeRange(2, variableType.length - 3)];
        self.typeClass = NSClassFromString(self.type);
        self.numberType = [self.typeClass isSubclassOfClass:[NSNumber class]];
        self.fromFoundation = [self classIsFromFoundation:self.typeClass];
    } else {
        self.type = [self getBasicDataType:variableType];
        self.numberType = YES;
        
        if ([self.type isEqualToString:@"BOOL"]) {
            self.boolType = YES;
        }
    }
}

- (NSString *)getBasicDataType:(NSString *)variableType
{
    NSDictionary *typeDict = @{@"B": @"BOOL", @"c": @"char", @"s": @"short", @"i": @"int", @"f": @"float", @"q": @"long", @"d": @"double"};
    return [typeDict objectForKey:variableType];
}

- (BOOL)classIsFromFoundation:(Class)cls
{
    NSSet *foundationClassSet = [NSSet setWithObjects:
                                 [NSURL class],
                                 [NSDate class],
                                 [NSValue class],
                                 [NSData class],
                                 [NSError class],
                                 [NSArray class],
                                 [NSDictionary class],
                                 [NSString class],
                                 [NSAttributedString class], nil];
    
    __block BOOL result = NO;
    [foundationClassSet enumerateObjectsUsingBlock:^(Class obj, BOOL *stop) {
        if ([cls isSubclassOfClass:obj]) {
            result = YES;
            *stop = YES;
        }
    }];
    
    return result;
}

@end

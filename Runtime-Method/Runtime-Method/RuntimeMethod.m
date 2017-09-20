//
//  RuntimeMethod.m
//  RunTimeDemo
//
//  Created by 黎明 on 2017/9/18.
//  Copyright © 2017年 黎明. All rights reserved.
//

#import "RuntimeMethod.h"
#import <objc/runtime.h>

void ReplaceMethod(Class originClass, SEL originSelector, Class targetClass, SEL targetSelector)
{
    Method targetMethod = class_getInstanceMethod(targetClass, targetSelector);
    class_replaceMethod(originClass, originSelector, method_getImplementation(targetMethod), method_getTypeEncoding(targetMethod));
}

void ExchangeInstanceMethod(Class firstClass, SEL firstSelector, Class secondClass, SEL secondSelector)
{
    Method firstMethod = class_getInstanceMethod(firstClass, firstSelector);
    Method secondMethod = class_getInstanceMethod(secondClass, secondSelector);
    method_exchangeImplementations(firstMethod, secondMethod);
}

void ExchangeClassMethod(Class firstClass, SEL firstSelector, Class secondClass, SEL secondSelector)
{
    Method firstMethod = class_getClassMethod(firstClass, firstSelector);
    Method secondMethod = class_getClassMethod(secondClass, secondSelector);
    method_exchangeImplementations(firstMethod, secondMethod);
}

void AddMethod(Class cls, SEL mSelector, Class lCls, SEL lSelector)
{
    Method lMethod = class_getInstanceMethod(lCls, lSelector);
    class_addMethod(cls, mSelector, method_getImplementation(lMethod), method_getTypeEncoding(lMethod));
}

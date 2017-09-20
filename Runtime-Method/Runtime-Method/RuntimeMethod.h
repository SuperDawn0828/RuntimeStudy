//
//  RuntimeMethod.h
//  RunTimeDemo
//
//  Created by 黎明 on 2017/9/18.
//  Copyright © 2017年 黎明. All rights reserved.
//

#import <Foundation/Foundation.h>

void ReplaceMethod(Class originClass, SEL originSelector, Class targetClass, SEL targetSelector);

void ExchangeInstanceMethod(Class firstClass, SEL firstSelector, Class secondClass, SEL secondSelector);

void ExchangeClassMethod(Class firstClass, SEL firstSelector, Class secondClass, SEL secondSelector);

void AddMethod(Class cls, SEL mSelector, Class lCls, SEL lSelector);

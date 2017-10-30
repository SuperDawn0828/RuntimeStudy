//
//  ViewController.m
//  Runtime-Property
//
//  Created by 黎明 on 2017/9/20.
//  Copyright © 2017年 黎明. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "MusicAlbum.h"
#import "UIColor+color.h"
#import "NSObject+Property.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor goldColor];
}

- (IBAction)buttonOneAction:(UIButton *)sender {
    
    unsigned int count = 0;
    objc_property_t *propertys = class_copyPropertyList([MusicAlbum class], &count);
    for (int i = 0; i < count; i++) {
        objc_property_t property = propertys[i];
        NSString *propertyName = [NSString stringWithUTF8String:property_getName(property)];
        NSString *attriableName = [NSString stringWithUTF8String:property_getAttributes(property)];
        NSLog(@"property name is: %@, -----> attriable is: %@", propertyName, attriableName);
    }
    
}

- (IBAction)buttonTwoAction:(UIButton *)sender {
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([MusicAlbum class], &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        NSString *ivarType = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        NSLog(@"ivar name is: %@,-----> type is: %@", ivarName, ivarType);
    }
}

- (IBAction)buttonThreeAction:(UIButton *)sender {
    NSArray *array = [MusicAlbum objectPropertyAndType];
    NSLog(@"array %@", array);
}


@end

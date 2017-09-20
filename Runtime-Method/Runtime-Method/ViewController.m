//
//  ViewController.m
//  Runtime-Method
//
//  Created by 黎明 on 2017/9/20.
//  Copyright © 2017年 黎明. All rights reserved.
//

#import "ViewController.h"
#import "RuntimeMethod.h"
#import "Dog.h"
#import "People.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
}

//请重新运行后进行点击
- (IBAction)buttonOneAction:(UIButton *)sender {
    ReplaceMethod([People class], @selector(eat), [Dog class], @selector(sleep));
    
    People *p = [[People alloc] init];
    [p eat];
    
    Dog *d = [[Dog alloc] init];
    [d sleep];
    
}

//请重新运行后进行点击
- (IBAction)buttonTwoAction:(UIButton *)sender {
    ExchangeInstanceMethod([People class], @selector(eat), [Dog class], @selector(sleep));
    
    People *p = [[People alloc] init];
    [p eat];
    
    Dog *d = [[Dog alloc] init];
    [d sleep];
}

//请重新运行后进行点击
- (IBAction)buttonThreeAction:(UIButton *)sender {
    AddMethod([People class], @selector(sleep), [Dog class], @selector(sleep));
    People *p = [[People alloc] init];
    [p performSelector:@selector(sleep)];
}


@end

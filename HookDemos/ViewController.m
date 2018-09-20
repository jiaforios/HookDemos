//
//  ViewController.m
//  HookDemos
//
//  Created by admin on 2018/9/20.
//  Copyright © 2018年 com. All rights reserved.
//

#import "ViewController.h"
#import "AViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.navigationController showViewController:[AViewController new] sender:nil];
}


@end

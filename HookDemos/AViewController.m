//
//  AViewController.m
//  HookDemos
//
//  Created by admin on 2018/9/20.
//  Copyright © 2018年 com. All rights reserved.
//

#import "AViewController.h"

#import <objc/runtime.h>

@interface AViewController ()
{
    NSTimer *_timer;
}
@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blackColor];
    _timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(timerActions) userInfo:nil repeats:YES];
    
}

- (void)timerActions{
    NSLog(@"time functions");
}

- (void)dealloc{
    [_timer invalidate];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  NSTimer+Safe.h
//  HookDemos
//
//  Created by admin on 2018/9/20.
//  Copyright © 2018年 com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (Safe)

@end

NS_ASSUME_NONNULL_END



@interface TimerProxy : NSProxy

@property(nonatomic, weak)id weakTarget;

+ (TimerProxy *)initWithTarget:(id)obj;

@end

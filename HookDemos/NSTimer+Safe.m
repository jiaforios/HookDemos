//
//  NSTimer+Safe.m
//  HookDemos
//
//  Created by admin on 2018/9/20.
//  Copyright © 2018年 com. All rights reserved.
//

#import "NSTimer+Safe.h"
#import <objc/runtime.h>
@implementation NSTimer (Safe)


// 对象方法的 -class 返回的是isa 指针指向 object_getClass
// 类方法的 + class 对象 返回的是当前class return self

+ (void)load{
    
    Method oldMethod = class_getClassMethod([self class], @selector(scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:));
    Method newMethod = class_getClassMethod([self class], @selector(_noCircle_ScheduledTimerWithTimeInterval:target:selector:userInfo:repeats:));
    method_exchangeImplementations(oldMethod, newMethod);
}


+ (NSTimer *)_noCircle_ScheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo{
    if (yesOrNo == NO) {
        return [self _noCircle_ScheduledTimerWithTimeInterval:ti target:aTarget selector:aSelector userInfo:userInfo repeats:yesOrNo];
    }else{
        TimerProxy *proxy = [TimerProxy initWithTarget:aTarget];
        return [self _noCircle_ScheduledTimerWithTimeInterval:ti target:proxy selector:aSelector userInfo:userInfo repeats:yesOrNo];
    }
}


@end

@implementation TimerProxy

+ (TimerProxy *)initWithTarget:(id)obj{
    TimerProxy *proxy = [TimerProxy alloc];
    proxy.weakTarget = obj;
    return proxy;
}

-(void)forwardInvocation:(NSInvocation *)invocation{
    
    SEL sel = [invocation selector];
    if ([self.weakTarget respondsToSelector:sel]) {
        [invocation invokeWithTarget:self.weakTarget];
    }
    
}

-(NSMethodSignature *)methodSignatureForSelector:(SEL)sel{
    return [self.weakTarget methodSignatureForSelector:sel];
}

@end

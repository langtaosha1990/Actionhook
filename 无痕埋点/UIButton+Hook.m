//
//  UIButton+Hook.m
//  无痕埋点
//
//  Created by Gpf on 2019/11/27.
//  Copyright © 2019 Gpf. All rights reserved.
//

#import "UIButton+Hook.h"
#import <objc/message.h>


@implementation UIButton (Hook)

+ (void)load
{
    Method oldObjectAtIndex =class_getInstanceMethod([UIButton class],@selector(sendAction:to:forEvent:));
    Method newObjectAtIndex =class_getInstanceMethod([UIButton class], @selector(custom_sendAction:to:forEvent:));
    method_exchangeImplementations(oldObjectAtIndex, newObjectAtIndex);
}

//- (void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
//    [super sendAction:action to:target forEvent:event];
//}

- (void)custom_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    NSLog(@"%@/%@", NSStringFromClass([target class]), NSStringFromSelector(action));
    [self custom_sendAction:action to:target forEvent:event];
    
}

@end

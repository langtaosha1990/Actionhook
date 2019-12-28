//
//  UIGestureRecognizer+Hook.m
//  无痕埋点
//
//  Created by Gpf on 2019/11/28.
//  Copyright © 2019 Gpf. All rights reserved.
//

#import "UIGestureRecognizer+Hook.h"
#import <objc/message.h>




@implementation UIGestureRecognizer (Hook)
+ (void)load
{
    Method oldObjectAtIndex =class_getInstanceMethod([self class],@selector(initWithTarget:action:));
    Method newObjectAtIndex =class_getInstanceMethod([self class], @selector(vi_initWithTarget:action:));
    method_exchangeImplementations(oldObjectAtIndex, newObjectAtIndex);
}

- (instancetype)vi_initWithTarget:(nullable id)target action:(nullable SEL)action
{
    UIGestureRecognizer *selfGestureRecognizer = [self vi_initWithTarget:target action:action];

    if (!target || !action) {
        return selfGestureRecognizer;
    }

    if ([target isKindOfClass:[UIScrollView class]]) {
        return selfGestureRecognizer;
    }

    Class class = [target class];

    SEL originalSEL = action;
    
    selfGestureRecognizer.methodName = NSStringFromSelector(action);

    NSString * sel_name = [NSString stringWithFormat:@"%s/%@", class_getName([target class]),NSStringFromSelector(action)];
    SEL swizzledSEL =  NSSelectorFromString(sel_name);

    BOOL isAddMethod = class_addMethod(class,
                                       swizzledSEL,
                                       method_getImplementation(class_getInstanceMethod([self class], @selector(responseUser_gesture:))),
                                       nil);

    if (isAddMethod) {
        Method method1 = class_getInstanceMethod(class, originalSEL);
        Method method2 = class_getInstanceMethod(class, swizzledSEL);
        method_exchangeImplementations(method1, method2);
    }

    return selfGestureRecognizer;
}

-(void)responseUser_gesture:(UIGestureRecognizer *)gesture
{
    NSString * identifier = [NSString stringWithFormat:@"%s/%@", class_getName([self class]), gesture.methodName];
    SEL sel = NSSelectorFromString(identifier);
    if ([self respondsToSelector:sel]) {
        IMP imp = [self methodForSelector:sel];
        void (*func)(id, SEL,id) = (void *)imp;
        func(self, sel,gesture);
    }

}


// 在category中添加属性
- (void)setMethodName:(NSString *)methodName
{
    objc_setAssociatedObject(self, @selector(methodName), methodName, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)methodName
{
    return objc_getAssociatedObject(self, _cmd);
}

@end

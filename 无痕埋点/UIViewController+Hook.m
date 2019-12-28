//
//  UIViewController+Hook.m
//  无痕埋点
//
//  Created by Gpf on 2019/11/29.
//  Copyright © 2019 Gpf. All rights reserved.
//

#import "UIViewController+Hook.h"
#import <objc/message.h>

@implementation UIViewController (Hook)

+ (void)load
{
    Method oldMethod = class_getInstanceMethod([UIViewController class],@selector(viewDidLoad));
    Method newMethod = class_getInstanceMethod([UIViewController class],@selector(my_viewDidLoad));
    method_exchangeImplementations(oldMethod, newMethod);
    
}

- (void)my_viewDidLoad
{
    [self my_viewDidLoad];
}

@end

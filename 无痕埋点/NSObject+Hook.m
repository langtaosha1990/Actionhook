//
//  NSObject+Hook.m
//  无痕埋点
//
//  Created by Gpf on 2019/11/29.
//  Copyright © 2019 Gpf. All rights reserved.
//

#import "NSObject+Hook.h"
#import "fishhook.h"

@implementation NSObject (Hook)
// + (void)load
//{
//    //rebinding结构体
//    struct rebinding nslog;
//    nslog.name = "NSLog";
//    nslog.replacement = myNslog;
//    nslog.replaced = (void *)&sys_nslog;
//    //rebinding结构体数组
//    struct rebinding rebs[1] = {nslog};
//    /**
//     * 存放rebinding结构体的数组
//     * 数组的长度
//     */
//    rebind_symbols(rebs, 1);
//}
//
////函数指针
//static void(*sys_nslog)(NSString * format,...);
////定义一个新的函数
//void myNslog(NSString * format,...){
//    format = [format stringByAppendingString:@"Hook！\n"];
//    //调用原始的
//    sys_nslog(format);
//}
@end

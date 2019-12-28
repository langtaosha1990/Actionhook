//
//  UIGestureRecognizer+Hook.h
//  无痕埋点
//
//  Created by Gpf on 2019/11/28.
//  Copyright © 2019 Gpf. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIGestureRecognizer (Hook)
@property (nonatomic, copy) NSString * methodName;
@end

NS_ASSUME_NONNULL_END

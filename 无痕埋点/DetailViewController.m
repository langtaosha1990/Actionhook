//
//  DetailViewController.m
//  无痕埋点
//
//  Created by Gpf on 2019/11/27.
//  Copyright © 2019 Gpf. All rights reserved.
//

#import "DetailViewController.h"
#import "UIButton+Hook.h"
#import "UIGestureRecognizer+Hook.h"
#import "UIViewController+Hook.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UIButton * testButton;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchAction:)];
    [self.view addGestureRecognizer:tap];
    
}

- (IBAction)testButtonAction:(id)sender
{
    NSLog(@"点击测试按钮");
}

- (void)touchAction:(id)sender
{
    NSLog(@"UITapGestureRecognizer事件");
}



@end

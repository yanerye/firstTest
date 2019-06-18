//
//  SecondViewController.m
//  test
//
//  Created by 脉络 on 2018/11/26.
//  Copyright © 2018 脉络. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    self.title = @"第二页面";
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 200, 100)];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(nextClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

- (void)nextClick{
    NSDictionary *dict =@{@"test":@"测试"};
    
    //创建通知
    
    NSNotification *notification =[NSNotification notificationWithName:@"tongzhi" object:nil userInfo:dict];
    
    //通过通知中心发送通知
    
    [[NSNotificationCenter defaultCenter] postNotification:notification];
    if (self.refreshBlock) {
        self.refreshBlock();
        
    }
    [self.navigationController popViewControllerAnimated:YES];
}

@end

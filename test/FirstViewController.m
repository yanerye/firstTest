//
//  FirstViewController.m
//  test
//
//  Created by 脉络 on 2018/11/26.
//  Copyright © 2018 脉络. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    self.title = @"第一页面";
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 200, 100)];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(nextClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

- (void)nextClick{
    SecondViewController *vc = [[SecondViewController alloc] init];
    vc.refreshBlock = ^{
        NSLog(@"刷新了页面");
    };
    [self.navigationController pushViewController:vc animated:YES];
}

@end

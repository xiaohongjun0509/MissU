//
//  MeViewController.m
//  MissU
//
//  Created by hongjunxiao on 16/1/29.
//  Copyright © 2016年 ihj. All rights reserved.
//

#import "MeViewController.h"

#import "XHJVerticalButton.h"

@interface MeViewController ()

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    XHJVerticalButton *button = [[XHJVerticalButton alloc] initWithFrame:CGRectMake(0, 100, 50, 80)];
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"微博" forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"login_QQ_icon"] forState:UIControlStateNormal];
//    [button setFont:[UIFont systemFontOfSize:12]];
    [self.view addSubview:button];
}

- (IBAction)login:(id)sender {
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self.navigationController pushViewController:[MeViewController new] animated:YES];
}

@end

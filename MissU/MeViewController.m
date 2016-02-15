//
//  MeViewController.m
//  MissU
//
//  Created by hongjunxiao on 16/1/29.
//  Copyright © 2016年 ihj. All rights reserved.
//

#import "MeViewController.h"

@interface MeViewController ()

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self.navigationController pushViewController:[MeViewController new] animated:YES];
}

@end

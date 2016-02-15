//
//  EssenceViewController.m
//  MissU
//
//  Created by hongjunxiao on 16/1/29.
//  Copyright © 2016年 ihj. All rights reserved.
//

#import "EssenceViewController.h"

@interface EssenceViewController ()

@property (nonatomic, strong) UITableView *tv;

@end

@implementation EssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationBar];
}


- (void)setupNavigationBar{
    UIImageView *barImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    barImage.frame = CGRectMake(0, 0, 107, 19);
    self.navigationItem.titleView = barImage;
    
    
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self.navigationController pushViewController:[EssenceViewController new] animated:YES];
}

@end

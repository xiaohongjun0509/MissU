//
//  AttentionViewController.m
//  MissU
//
//  Created by hongjunxiao on 16/1/29.
//  Copyright © 2016年 ihj. All rights reserved.
//

#import "AttentionViewController.h"
#import "XHJCatagoryViewController.h"
@interface AttentionViewController ()

@property (nonatomic, assign) NSInteger selectedIndex;

@end

@implementation AttentionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTopButton:@[@"关注",@"订阅"]];
    [self setupLeftButton];
}


- (void)setupTopButton:(NSArray *)titles{
    UIView *containView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, titles.count * 50, 40)];
    
    UIView *buttomLine = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 2)];
    buttomLine.backgroundColor = [UIColor redColor];
    [containView addSubview:buttomLine];
    buttomLine.y = containView.height - buttomLine.height;
    
    
    [titles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:obj forState:UIControlStateNormal];
        [button setTitleColor:RGB(100, 100, 100) forState:UIControlStateNormal];
        [button setTitleColor:RGB(50, 50, 50) forState:UIControlStateSelected];
        button.frame = CGRectMake(idx * 50, 0, 50, 38);
        [containView addSubview:button];
        [button sizeToFit];
        [button layoutIfNeeded];
        if (idx == self.selectedIndex) {
            buttomLine.centerX = button.titleLabel.centerX;
            
            buttomLine.width = button.titleLabel.width;
        }
    }];
    
    self.navigationItem.titleView = containView;
}


- (void)setupLeftButton{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"friendsRecommentIcon"] forState:UIControlStateNormal];
    leftButton.frame = CGRectMake(0, 0, 19, 17);
    [leftButton addTarget:self action:@selector(showCatagory) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    
}

- (void)showCatagory{
    XHJCatagoryViewController *controller= [XHJCatagoryViewController new];
    [self.navigationController pushViewController:controller animated:YES];
}
@end

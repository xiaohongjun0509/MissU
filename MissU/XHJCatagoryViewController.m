//
//  XHJCatagoryViewController.m
//  MissU
//
//  Created by hongjunxiao on 16/2/15.
//  Copyright © 2016年 ihj. All rights reserved.
//

#import "XHJCatagoryViewController.h"
#import "XHJLeftViewController.h"
#import "XHJRightViewController.h"

@interface XHJCatagoryViewController ()
@property (nonatomic, strong) XHJRightViewController *rightController;
@end

@implementation XHJCatagoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildControllers];
}

- (void)addChildControllers{
    XHJLeftViewController *leftController = [XHJLeftViewController new];
    
    [self addChildViewController:leftController];
    [self.view addSubview:leftController.view];
    leftController.view.frame = CGRectMake(0, 0, 0.25 * ScreenWidth, ScreenHeight - 64);
    
    
    
    XHJRightViewController *rightController = [XHJRightViewController new];
    [self addChildViewController:rightController];
    [self.view addSubview:rightController.view];
    rightController.view.frame = CGRectMake(0.25 * ScreenWidth, 64, 0.75 * ScreenWidth, ScreenHeight - 64);
    self.rightController = rightController;
    WEAKSELF
    leftController.clickBlock = ^(NSString *categoryId){
        [weakSelf.rightController requestWithCategoryId:categoryId];
    };
}

@end

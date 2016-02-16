//
//  NewestViewController.m
//  MissU
//
//  Created by hongjunxiao on 16/1/29.
//  Copyright © 2016年 ihj. All rights reserved.
//

#import "NewestViewController.h"
#import "XHJSegmentButton.h"
@interface NewestViewController ()
@property (nonatomic, strong) XHJSegmentButton *segmentButton;
@end

@implementation NewestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.segmentButton = [[XHJSegmentButton alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, 44)];
    self.segmentButton.titles = @[@"全部",@"视频",@"图片",@"段子",@"声音"];
    [self.view addSubview:self.segmentButton];
}


@end

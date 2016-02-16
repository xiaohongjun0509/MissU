//
//  NewestViewController.m
//  MissU
//
//  Created by hongjunxiao on 16/1/29.
//  Copyright © 2016年 ihj. All rights reserved.
//

#import "NewestViewController.h"
#import "XHJSegmentButton.h"
#import "XHJVideoController.h"
#import "XHJAllController.h"
#import "XHJPictureController.h"
#import "XHJWordController.h"

@interface NewestViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) XHJSegmentButton *segmentButton;
@property (nonatomic, strong) UIScrollView *sc;
@end

@implementation NewestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationBar];
    [self setupControllers];
    [self setupContentView];
    [self setupSegmentButton];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)setupSegmentButton{
    self.segmentButton = [[XHJSegmentButton alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, 44)];
    self.segmentButton.titles = @[@"全部",@"视频",@"图片",@"段子"];
    WEAKSELF
    self.segmentButton.buttonDidClickBlock = ^(NSInteger index){
        [weakSelf.sc setContentOffset:CGPointMake(index * ScreenWidth, 0) animated:YES];
    };
    [self.view addSubview:self.segmentButton];
}
- (void)setupNavigationBar{
    UIImageView *barImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    barImage.frame = CGRectMake(0, 0, 107, 19);
    self.navigationItem.titleView = barImage;
}

- (void)setupControllers{
    XHJAllController *allXController = [XHJAllController new];
    [self addChildViewController:allXController];
    
    XHJVideoController*videoController = [XHJVideoController new];
    [self addChildViewController:videoController];
    
    XHJPictureController *pictureController = [XHJPictureController new];
    [self addChildViewController:pictureController];
    
    XHJWordController *wordController = [XHJWordController new];
    [self addChildViewController:wordController];
    
}

-(void)setupContentView{
    self.sc= [[UIScrollView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.sc];
    self.sc.showsHorizontalScrollIndicator = NO;
    self.sc.showsVerticalScrollIndicator = YES;
    self.sc.alwaysBounceHorizontal = NO;
    self.sc.scrollEnabled = NO;
    self.sc.contentSize = CGSizeMake(self.childViewControllers.count * ScreenWidth, ScreenHeight);
    self.sc.pagingEnabled = YES;
    self.sc.delegate = self;
    UIViewController *controller = self.childViewControllers[0];
    [self.sc addSubview:controller.view];
    controller.view.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
//    这里不能这么写  这样写的话就会把所有的view都加在进来了。
//    [self.childViewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        [self.sc addSubview:obj.view];
//        obj.view.frame = CGRectMake(idx * ScreenWidth, 0, ScreenWidth, ScreenHeight);
//    }];
}



- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    NSInteger index = (NSInteger)(scrollView.contentOffset.x / ScreenWidth);
    UIViewController *controller = self.childViewControllers[index];
    if (!controller.view.superview) {
        [self.sc addSubview:controller.view];
        controller.view.frame = CGRectMake(index * ScreenWidth, 0, ScreenWidth, ScreenHeight);
    }
}
@end

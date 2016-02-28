//
//  XHJPicBrowserController.m
//  MissU
//
//  Created by hongjunxiao on 16/2/28.
//  Copyright © 2016年 ihj. All rights reserved.
//

#import "XHJPicBrowserController.h"

@interface XHJPicBrowserController ()

/**<##>*/
@property (nonatomic, strong)  UIScrollView *sc;
/** */
@property (nonatomic, strong)  UIImageView *iv;



@end

@implementation XHJPicBrowserController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self customSC];
    [self customOther];
}

- (void)customSC{
    _sc = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    _sc.contentSize = CGSizeMake(ScreenWidth, ScreenHeight);
    [self.view addSubview:_sc];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissSelf)];
    [_sc addGestureRecognizer:tap];
    self.iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    [self.sc addSubview:self.iv];
    
}
- (void)dismissSelf{
    [self dismissViewControllerAnimated:self completion:nil];
}
- (void)setModel:(XHJTopicModel *)model{
    NSLog(@"----%f",ScreenWidth);
    CGFloat radio = ScreenWidth / model.width;
    CGFloat height = model.height * radio;
    self.iv.frame = CGRectMake(0, 0, ScreenWidth, height);
    if (height < ScreenHeight) {
        self.iv.center = self.sc.center;
    }
    [self.iv sd_setImageWithURL:[NSURL URLWithString:model.image0]];
}

- (void)customOther{
    self.view.backgroundColor = [UIColor blackColor];
}

@end

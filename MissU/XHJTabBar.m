//
//  XHJTabBar.m
//  MissU
//
//  Created by hongjunxiao on 16/2/7.
//  Copyright © 2016年 ihj. All rights reserved.
//

#import "XHJTabBar.h"

@interface XHJTabBar ()

@property (nonatomic, strong) UIButton *plusButton;

@end

@implementation XHJTabBar

- (instancetype)initWithFrame:(CGRect)frame{
//  这里拿到的frame可能不是真的frame，所以要得到真的frame得话就要在layout里面进行获取。
    if (self = [super initWithFrame:frame]) {
        [self customPlusButton];
    }
    return self;
}


- (void)customPlusButton{
    self.plusButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *image = [UIImage imageNamed:@"tabBar_publish_icon"];
    [self.plusButton setImage:image forState:UIControlStateNormal];
    self.plusButton.bounds = CGRectMake(0, 0, image.size.width, image.size.height);
    [self addSubview:self.plusButton];
}


- (void)layoutSubviews{
    [super layoutSubviews];
//  这里UITabBar是有几个部分组成的。
    CGFloat width = ScreenWidth / 5;
    __block NSInteger index = 0;
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
//          这段代码非常的hack。
            obj.width = width;
//            if(index == 0){
//                obj.x = width * 1;
//            }else if(index == 1){
//                obj.x = width * 3;
//            }else if (index == 2){
//                obj.x = width * 4;
//            }else{
//                obj.x = width * 0;
//            }
            obj.x =width * (index < 2 ? index :index + 1);
            index++;
        }
    }];
    self.plusButton.center = CGPointMake(self.width * 0.5, self.height * 0.5);
}
@end

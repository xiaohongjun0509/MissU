//
//  XHJPublishView.m
//  MissU
//
//  Created by hongjunxiao on 16/2/19.
//  Copyright © 2016年 ihj. All rights reserved.
//

#import "XHJPublishView.h"
#import "XHJVerticalButton.h"
@interface XHJPublishView ()
@property (nonatomic, assign) BOOL menuHasShown;
@end

@implementation XHJPublishView


- (void)awakeFromNib{
    [super awakeFromNib];
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubViews];
        [self makeAnimation];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


- (void)addSubViews{
    [self setButtonWithImage:@"publish-picture" title:@"发图片"];
    [self setButtonWithImage:@"publish-picture" title:@"发图片"];
    [self setButtonWithImage:@"publish-picture" title:@"发图片"];
    [self setButtonWithImage:@"publish-picture" title:@"发图片"];
    [self setButtonWithImage:@"publish-picture" title:@"发图片"];
    [self setButtonWithImage:@"publish-picture" title:@"发图片"];
    [self setNeedsLayout];
    [self layoutIfNeeded];
}
- (void)makeAnimation{
    CGFloat startY = 150;
    CGFloat padding = 30;
    CGFloat width = (ScreenWidth - padding * 4) / 3;
    CGFloat height = 80;
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[XHJVerticalButton class]]) {
            [UIView animateWithDuration:0.25 delay:arc4random_uniform(1) usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                obj.y = startY + (int)(idx / 3) * (height + padding);
            } completion:^(BOOL finished) {
                self.menuHasShown = YES;
            }];
        }
    }];
    
   
}

- (void)setButtonWithImage:(NSString *)imageName title:(NSString *)title{
    XHJVerticalButton *button = [[XHJVerticalButton alloc] init];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:WORDCOLOR forState:UIControlStateNormal];
    [button setFont:[UIFont systemFontOfSize:13]];
    [self addSubview:button];
}


- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat padding = 30;
    CGFloat width = (ScreenWidth - padding * 4) / 3;
    CGFloat height = 80;
    
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[XHJVerticalButton class]]) {
            obj.x = (idx % 3) * width + padding * (idx % 3 + 1);
//            obj.y = startY + (int)(idx / 3) * (height + padding);
            obj.y = -100;
            obj.width = width;
            obj.height = height;
        }
    }];
}
- (void)appearButton:(UIButton *)button delay:(CGFloat)delay{
    [UIView animateWithDuration:0.4f delay:delay usingSpringWithDamping:0.5f initialSpringVelocity:0.1 options:UIViewAnimationOptionCurveEaseIn animations:^{
        button.y = button.y + 400;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)setupFrameAnimation:(UIButton *)button delay:(CGFloat)delay{
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"position"];
    anim.fillMode = kCAFillModeForwards;
    
    anim.removedOnCompletion = NO;
    
    anim.fromValue = [NSValue valueWithCGRect:CGRectMake(button.x, 0, button.width, button.height)];
    anim.toValue = [NSValue valueWithCGRect:CGRectMake(button.x, 200, button.width, button.height)];
    anim.duration = 2;
    
    button.layer.beginTime = CACurrentMediaTime() + delay;
    [button.layer addAnimation:anim forKey:@"move"];
}


- (void)dismissFrameAnimation:(UIButton *)button delay:(CGFloat)delay{
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"position"];
//  保存最后的状态
    anim.fillMode = kCAFillModeForwards;
//  动画结束后动画的状态不会被移除
    anim.removedOnCompletion = NO;
    
    anim.fromValue = [NSValue valueWithCGRect:CGRectMake(0, 200, button.width, button.height)];
    anim.toValue = [NSValue valueWithCGRect:CGRectMake(0, 568, button.width, button.height)];
    anim.duration = 2;
    [button.layer addAnimation:anim forKey:@"dismiss"];
}


- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (self.menuHasShown) {
        [self dismissMenu];
    }
}


- (void)dismissMenu{
    
}
@end

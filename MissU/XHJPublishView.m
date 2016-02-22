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
@property (weak, nonatomic) IBOutlet XHJVerticalButton *videoB;
@property (weak, nonatomic) IBOutlet XHJVerticalButton *pictureB;
@property (weak, nonatomic) IBOutlet XHJVerticalButton *wordB;
@property (weak, nonatomic) IBOutlet XHJVerticalButton *voiceB;
@property (weak, nonatomic) IBOutlet XHJVerticalButton *shenheB;
@property (weak, nonatomic) IBOutlet XHJVerticalButton *linkB;

@end

@implementation XHJPublishView
- (IBAction)click:(id)sender {
     [self setupFrameAnimation:self.videoB delay:0];
}

- (IBAction)dismiss:(id)sender {
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.y = - 200;
    }];
}



- (void)setupFrameAnimation:(UIButton *)button delay:(CGFloat)delay{
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"position"];
    anim.fillMode = kCAFillModeForwards;
    
    anim.removedOnCompletion = NO;
    
    anim.fromValue = [NSValue valueWithCGRect:CGRectMake(0, -200, button.width, button.height)];
    anim.toValue = [NSValue valueWithCGRect:CGRectMake(0, 200, button.width, button.height)];
    anim.duration = 2;
    
    
    [button.layer addAnimation:anim forKey:@"move"];
}

@end

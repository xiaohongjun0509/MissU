//
//  XHJSegmentButton.m
//  MissU
//
//  Created by hongjunxiao on 16/2/16.
//  Copyright © 2016年 ihj. All rights reserved.
//

#import "XHJSegmentButton.h"



@interface XHJSegmentButton ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *sc;
@property (nonatomic, strong) UIView *indicator;
@property (nonatomic, strong) UIButton *selectedButton;
@end

@implementation XHJSegmentButton

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        
        [self setupScrollView];
        [self setupIndicator];
    }
    return self;
}


- (void)setupScrollView{
    UIScrollView *sc= [[UIScrollView alloc] init];
    sc.contentOffset = CGPointMake(0, 0);
    sc.showsHorizontalScrollIndicator = NO;
    sc.backgroundColor = BGCOLOR;
    sc.delegate = self;
    [self addSubview:sc];
    self.sc = sc;
}

- (void)setupIndicator{
    self.indicator = [[UIView alloc] init];
    self.indicator.backgroundColor = REDCOLOR;
}
- (void)setTitles:(NSArray *)titles{
    _titles = titles;
    CGFloat width = 64;
    [titles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *title = obj;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:REDCOLOR forState:UIControlStateSelected];
        [btn setTitleColor:WORDCOLOR forState:UIControlStateNormal];
        btn.frame = CGRectMake(idx *width, 0, width, self.height);
        btn.tag = 1000 +  idx;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        if (idx == 0) {
            self.selectedButton = btn;
            self.selectedButton.selected = YES;
            self.selectedButton.userInteractionEnabled = NO;
            [btn addSubview:self.indicator];
        }
        
        [self.sc addSubview:btn];
        self.sc.contentSize = CGSizeMake(width * titles.count, self.height);
    }];
}

- (void)layoutSubviews{
    [super layoutSubviews];

    self.sc.frame = CGRectMake(0, 0, self.width, self.height);
    //  这里有一个问题，就是当UIScrollView在UINavigationController中时，由于automaticallyAdjustsScrollViewInsets = YES，会自动的将UIScrollView的contentInset便宜64.导致显示的问题。所以在控件的内部要设置回来
    self.sc.contentInset = UIEdgeInsetsZero;
    self.indicator.bounds = CGRectMake(0, 0, self.selectedButton.titleLabel.width, 2);
    self.indicator.y = self.height - 2;
    self.indicator.centerX = self.selectedButton.centerX;
}

- (void)btnClick:(UIButton *)sender{
//    id block = self.blockArray[sender.tag - 1000];
//    if (block) {
////        block();
//    }
    self.selectedButton.userInteractionEnabled = YES;
    self.selectedButton.selected = NO;
    self.selectedButton = sender;
    self.selectedButton.userInteractionEnabled = NO;
    self.selectedButton.selected = YES;
    sender.userInteractionEnabled = NO;
    [UIView animateWithDuration:0.2 animations:^{
        self.indicator.centerX = self.selectedButton.centerX;
    }];
    
}

@end

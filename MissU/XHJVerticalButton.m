//
//  XHJVerticalButton.m
//  MissU
//
//  Created by hongjunxiao on 16/2/18.
//  Copyright © 2016年 ihj. All rights reserved.
//

#import "XHJVerticalButton.h"

@implementation XHJVerticalButton

- (void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.y = 0;
    self.imageView.centerX = self.centerX;
    self.imageView.width = self.height > self.width ? self.width : self.height;
    self.imageView.height = self.imageView.width;
    
    self.titleLabel.y = CGRectGetMaxY(self.imageView.frame);
    self.titleLabel.width = self.width;
    self.titleLabel.x = 0;
//   将文字居中对齐,默认是左边对其的。
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.height = self.height - CGRectGetMaxY(self.imageView.frame);
}

@end

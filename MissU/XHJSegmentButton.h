//
//  XHJSegmentButton.h
//  MissU
//
//  Created by hongjunxiao on 16/2/16.
//  Copyright © 2016年 ihj. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface XHJSegmentButton : UIView

@property (nonatomic, copy) NSArray *titles;

@property (nonatomic, copy) void (^buttonDidClickBlock)(NSInteger);
@end

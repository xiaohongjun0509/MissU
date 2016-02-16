//
//  XHJLeftViewController.h
//  MissU
//
//  Created by hongjunxiao on 16/2/15.
//  Copyright © 2016年 ihj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XHJLeftViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, copy) void (^clickBlock)(NSString *) ;

@end

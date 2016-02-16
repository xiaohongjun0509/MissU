//
//  XHJRightViewController.h
//  MissU
//
//  Created by hongjunxiao on 16/2/15.
//  Copyright © 2016年 ihj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XHJRightViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

- (void)requestWithCategoryId:(NSString *)uid;

@end

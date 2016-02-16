//
//  XHJLeftCell.h
//  MissU
//
//  Created by hongjunxiao on 16/2/15.
//  Copyright © 2016年 ihj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XHJLeftCatagoryModel.h"
@interface XHJLeftCell : UITableViewCell

@property (nonatomic, strong)XHJLeftCatagoryModel *model;
+(CGFloat)height;
@end

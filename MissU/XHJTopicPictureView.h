//
//  XHJTopicPictureView.h
//  MissU
//
//  Created by hongjunxiao on 16/2/22.
//  Copyright © 2016年 ihj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DACircularProgressView.h"
@class XHJTopicModel;
@interface XHJTopicPictureView : UIView

- (void)setModel:(XHJTopicModel *)model;

/**<##>*/
@property (nonatomic, copy) void (^showPicBrowser)(XHJTopicModel *);

@end

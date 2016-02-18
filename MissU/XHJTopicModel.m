//
//  XHJTopicModel.m
//  MissU
//
//  Created by hongjunxiao on 16/2/18.
//  Copyright © 2016年 ihj. All rights reserved.
//

#import "XHJTopicModel.h"

@implementation XHJTopicModel


- (CGFloat)height{
    if (!_height) {
        if(self.type == TopicTypeWord){
            CGFloat textH = [self.text boundingRectWithSize:CGSizeMake(ScreenWidth - 2 * cellMarign, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName :[UIFont systemFontOfSize:13]} context:nil].size.height;
            _height = textH + CellHeaderH + CellButtomH + 4 * cellMarign;
            NSLog(@"%@",self.text);
        }
    }
    return _height;
}


@end

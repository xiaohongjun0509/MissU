//
//  XHJTopicModel.m
//  MissU
//
//  Created by hongjunxiao on 16/2/18.
//  Copyright © 2016年 ihj. All rights reserved.
//

#import "XHJTopicModel.h"

@implementation XHJTopicModel


- (CGFloat)rowHeight{
    if (!_rowHeight) {
        _rowHeight = 0;
        if(self.type == TopicTypeWord){
             CGFloat textH = [self.text boundingRectWithSize:CGSizeMake(ScreenWidth - 2 * cellMarign, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName :[UIFont systemFontOfSize:13]} context:nil].size.height;
//            _rowHeight = textH + CellHeaderH + CellButtomH + 4 * cellMarign;
            _rowHeight = CellHeaderH + textH + 4 * cellMarign + CellButtomH;
            NSLog(@"%@",self.text);
        }else if(self.type == TopicTypePicture){
             CGFloat textH = [self.text boundingRectWithSize:CGSizeMake(ScreenWidth - 2 * cellMarign, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName :[UIFont systemFontOfSize:13]} context:nil].size.height;
            _rowHeight = CellHeaderH + textH + cellMarign + cellMarign;
//            计算图片的宽和高
            CGFloat picW = ScreenWidth - 2 * cellMarign;
            CGFloat picH = self.width / picW * self.height;
            if (picH > MaxPictureH) {
                picH = FoldPictureH;
                _isBigPic = YES;
            }else{
                _isBigPic = NO;
            }
            CGFloat picStartY = _rowHeight;
            self.picF = CGRectMake(cellMarign, picStartY, picW, picH);
            _rowHeight += (picH + CellButtomH + 2 * cellMarign);
            
        }
    }
    return _rowHeight;
}

- (CGRect)picF{
    return _picF;
}

- (TopicType)topicType{
    switch (self.type) {
        case 41:
            return TopicTypeVideo;
        case 1:
            return TopicTypeAll;
        case 10:
            return TopicTypePicture;
        case 31:
            return TopicTypeAudio;
        case 29:
            return TopicTypeWord;
        default:
            return TopicTypeAll;
            break;
    }
    
}

@end

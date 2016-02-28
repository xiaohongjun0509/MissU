//
//  XHJTopicModel.h
//  MissU
//
//  Created by hongjunxiao on 16/2/18.
//  Copyright © 2016年 ihj. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface XHJTopicModel : NSObject{
    CGFloat _rowHeight;
}
/**头像*/
@property (nonatomic, copy) NSString *profile_image;

/**新浪V*/
@property (nonatomic, copy) NSString *sina_v;

/**正文*/
@property (nonatomic, copy) NSString *text;

/**创建时间*/
@property (nonatomic, copy) NSString *created_at;

/**name*/
@property (nonatomic, copy) NSString *screen_name;
/**顶*/
@property (nonatomic, copy) NSString *love;

/**踩*/
@property (nonatomic, copy) NSString *cai;

/**转发*/
@property (nonatomic, copy) NSString *repost;

/**评论*/
@property (nonatomic, copy) NSString *comment;
/*topic 的类型*/
@property (nonatomic, assign) TopicType topicType;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGFloat width;

/**图片的资源*/
@property (nonatomic, copy) NSString *image0;
@property (nonatomic, copy) NSString *image1;
@property (nonatomic, copy) NSString *image2;


/*辅助属性*/

@property (nonatomic, assign, readonly) CGFloat rowHeight;
/*图片的size*/
@property (nonatomic, assign) CGRect picF;
/*图片是否是大图*/
@property (nonatomic, assign) BOOL isBigPic;
//图片的记载的进度
@property (nonatomic, assign) CGFloat downloadProgress;

@end

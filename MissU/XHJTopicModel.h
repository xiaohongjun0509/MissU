//
//  XHJTopicModel.h
//  MissU
//
//  Created by hongjunxiao on 16/2/18.
//  Copyright © 2016年 ihj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XHJTopicModel : NSObject{
    CGFloat _height;
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
//@property (nonatomic, assign) TopicType topicType;

@property (nonatomic, assign) NSInteger type;


/*辅助属性*/

@property (nonatomic, assign, readonly) CGFloat height;

@end

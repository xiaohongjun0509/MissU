//
//  XHJTweetCell.m
//  MissU
//
//  Created by hongjunxiao on 16/2/18.
//  Copyright © 2016年 ihj. All rights reserved.
//

#import "XHJTweetCell.h"
#import "XHJTopicModel.h"
#import "XHJTopicPictureView.h"
#import "XHJPicBrowserController.h"
@interface XHJTweetCell ()
@property (weak, nonatomic) IBOutlet UIButton *dingButton;
@property (weak, nonatomic) IBOutlet UIButton *caiButton;
@property (weak, nonatomic) IBOutlet UIButton *zhuanfaButton;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *avator;
@property (weak, nonatomic) IBOutlet UILabel *textL;
/**图片显示*/
@property (nonatomic, strong)  XHJTopicPictureView *topicPicture;
/** */
@property (nonatomic, strong)  XHJPicBrowserController *picBrowser;
@end

@implementation XHJTweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = BGCOLOR;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.avator.layer.masksToBounds = YES;
    self.avator.layer.cornerRadius = self.avator.height * 0.5;
}


- (XHJTopicPictureView *)topicPicture{
    if (!_topicPicture) {
        WEAKSELF
        _topicPicture = [[[NSBundle mainBundle] loadNibNamed:@"XHJTopicPictureView" owner:nil options:nil] lastObject];
        _topicPicture.showPicBrowser = ^(XHJTopicModel *model){
            UIViewController *controller = [UIApplication sharedApplication].keyWindow.rootViewController;
            [controller presentModalViewController:weakSelf.picBrowser animated:YES];
            weakSelf.picBrowser.model = model;
            
        };
        [self.contentView addSubview:_topicPicture];
    }
    return _topicPicture;
}
- (void)setModel:(XHJTopicModel *)model{
//  设置头像
    [self.avator sd_setImageWithURL:[NSURL URLWithString:model.profile_image]];
    self.timeLabel.text = model.created_at;
    self.titleLabel.text = model.screen_name;
//    设置正文
    self.textL.text = model.text;
//    判断是否有图片，有的话现实
    if (model.topicType == TopicTypePicture) {
        [self.topicPicture setModel:model];
    }
    self.topicPicture.frame = model.picF;
//    设置tool bar
    [self.dingButton setTitle:model.love forState:UIControlStateNormal];
    [self.caiButton setTitle:model.cai forState:UIControlStateNormal];
    [self.zhuanfaButton setTitle:model.repost forState:UIControlStateNormal];
    [self.commentButton setTitle:model.comment forState:UIControlStateNormal];
}


- (void)setFrame:(CGRect)frame{
    frame.origin.y += cellMarign;
//    frame.origin.x += 10;
//    frame.size.width -= 20;
    frame.size.height -= cellMarign;
    [super setFrame:frame];
}



- (XHJPicBrowserController *)picBrowser{
    if (!_picBrowser) {
        _picBrowser = [[XHJPicBrowserController alloc] init];
        
    }
    return _picBrowser;
}
@end

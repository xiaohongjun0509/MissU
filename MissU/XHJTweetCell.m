//
//  XHJTweetCell.m
//  MissU
//
//  Created by hongjunxiao on 16/2/18.
//  Copyright © 2016年 ihj. All rights reserved.
//

#import "XHJTweetCell.h"
#import "XHJTopicModel.h"
@interface XHJTweetCell ()
@property (weak, nonatomic) IBOutlet UIButton *dingButton;
@property (weak, nonatomic) IBOutlet UIButton *caiButton;
@property (weak, nonatomic) IBOutlet UIButton *zhuanfaButton;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *avator;
@property (weak, nonatomic) IBOutlet UILabel *textL;

@end

@implementation XHJTweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = BGCOLOR;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.avator.layer.masksToBounds = YES;
    self.avator.layer.cornerRadius = self.avator.height * 0.5;
}

- (void)setModel:(XHJTopicModel *)model{
    [self.avator sd_setImageWithURL:[NSURL URLWithString:model.profile_image]];
    self.timeLabel.text = model.created_at;
    self.titleLabel.text = model.screen_name;
    self.textL.text = model.text;
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
@end

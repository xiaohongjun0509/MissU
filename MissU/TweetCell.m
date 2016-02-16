//
//  TweetCell.m
//  MissU
//
//  Created by hongjunxiao on 16/2/16.
//  Copyright © 2016年 ihj. All rights reserved.
//

#import "TweetCell.h"
#import "TweetLayout.h"

@interface TweetCell ()
//顶部
@property (nonatomic, strong) UIView *header;
@property (nonatomic, strong) UIImageView *avator;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIButton *actionButton;


//内容
@property (nonatomic, strong) UIView *body;

//底部
@property (nonatomic, strong) UIView *buttomView;
@end


@implementation TweetCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self setupHeader];
        [self setupBody];
        [self setupButtom];
    }
    return self;
}

- (void)setupHeader{
    self.header = [[UIView alloc] init];
    [self.contentView addSubview:self.header];
    
    self.avator = [[UIImageView alloc] init];
    [self.header addSubview:self.avator];
    
    self.titleLabel = [[UILabel alloc] init];
    [self.header addSubview:self.titleLabel];
    
    self.timeLabel = [UILabel new];
    [self.header addSubview:self.timeLabel];
    
}

- (void)setupBody{
    
}



- (void)setupButtom{
    self.buttomView = [UIView new];
    [self.contentView addSubview:self.buttomView];
}


- (void)setLayout:(TweetLayout *)layout{
    
}


- (void)layoutSubviews{
    [super layoutSubviews];
}

@end

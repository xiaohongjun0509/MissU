//
//  XHJLeftCell.m
//  MissU
//
//  Created by hongjunxiao on 16/2/15.
//  Copyright © 2016年 ihj. All rights reserved.
//

#import "XHJLeftCell.h"


@interface XHJLeftCell ()
@property (nonatomic, strong) UIView *indicatorView;
@end

@implementation XHJLeftCell

- (void)awakeFromNib {
    
}



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self addindicatorView];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.contentView.backgroundColor = BGCOLOR;
    }
    return self;
}

- (void)addindicatorView{
    UIView *indicatorView = [[UIView alloc] init];
    indicatorView.backgroundColor = [UIColor redColor];
    self.indicatorView = indicatorView;
    [self.contentView addSubview:indicatorView];
//    [self.contentView bringSubviewToFront:self.indicatorView];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.indicatorView.frame = CGRectMake(0, 0, 2, self.height);
    self.contentView.height = self.height - 2;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.indicatorView.hidden = !selected;
    self.textLabel.textColor = selected ? REDCOLOR : BLACKCOLOR;
}

- (void)setModel:(XHJLeftCatagoryModel *)model{
    _model = model;
    self.textLabel.text = model.name;
}

+ (CGFloat)height{
    return 44;
}
@end

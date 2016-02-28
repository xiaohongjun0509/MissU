//
//  XHJTopicPictureView.m
//  MissU
//
//  Created by hongjunxiao on 16/2/22.
//  Copyright © 2016年 ihj. All rights reserved.
//

#import "XHJTopicPictureView.h"
#import "XHJTopicModel.h"
@interface XHJTopicPictureView ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *gitIcon;
@property (weak, nonatomic) IBOutlet UIImageView *placeHolderImage;
@property (weak, nonatomic) IBOutlet UIButton *showBigBrowser;
@property (weak, nonatomic) IBOutlet DACircularProgressView *progressView;
/**<##>*/
@property (nonatomic, strong) XHJTopicModel *model;
@end

@implementation XHJTopicPictureView


- (void)awakeFromNib{
    [super awakeFromNib];
    
}

- (void)setModel:(XHJTopicModel *)model{
    _model = model;
    
//  1.下载图片
    [self.imageView sd_setImageWithPreviousCachedImageWithURL:[NSURL URLWithString:model.image0] placeholderImage:nil options:SDWebImageRetryFailed progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        [self.progressView setProgress:1.0 * receivedSize / expectedSize animated:YES];
        self.progressView.hidden = NO;
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.progressView.hidden = YES;
    }];
//    2.判断是不是gif
    if ([model.image0.pathExtension.uppercaseString isEqualToString:@"GIF"]){
        self.gitIcon.hidden = NO;
    }else{
        self.gitIcon.hidden = YES;
    }
//    3.是否显示查看大图的按钮，这里娶不到，所以放在外面做。
    self.showBigBrowser.hidden = model.isBigPic? NO : YES;
    if (model.isBigPic) {
        self.imageView.userInteractionEnabled = model.isBigPic;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showBigBrowserVC)];
        [self.imageView addGestureRecognizer:tap];
    }else{
        self.imageView.userInteractionEnabled = model.isBigPic;
    }
    
    
}

- (void)showBigBrowserVC{
    if (self.showPicBrowser) {
        self.showPicBrowser(self.model);
    }
}


- (IBAction)showBigPicBrowser:(id)sender {
}

@end

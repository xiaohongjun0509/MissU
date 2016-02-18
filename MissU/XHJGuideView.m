//
//  XHJGuideView.m
//  MissU
//
//  Created by hongjunxiao on 16/2/16.
//  Copyright © 2016年 ihj. All rights reserved.
//

#import "XHJGuideView.h"

@implementation XHJGuideView

+(void)show{
//    BOOL hasShown = NO;
    NSInteger savedVersion = [[[NSUserDefaults standardUserDefaults] valueForKey:@"version"] integerValue];
//     已经显示过了，需要重新判断版本号来决定是否升级了需要再次显示
        NSDictionary * info = [[NSBundle mainBundle] infoDictionary];
        NSString *version = [info valueForKey:@"CFBundleVersion"];
        if (savedVersion == 0 || version.integerValue > savedVersion) {
            UIView * guideView = [[[NSBundle mainBundle] loadNibNamed:@"XHJGuideView" owner:nil options:nil] firstObject];
            [[[UIApplication sharedApplication] keyWindow] addSubview:guideView];
            [[NSUserDefaults standardUserDefaults] setValue:version forKey:@"version"];
        }
}
- (IBAction)hide:(id)sender {
    [self removeFromSuperview];
}

@end

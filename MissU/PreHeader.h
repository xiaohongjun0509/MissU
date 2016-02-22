//
//  PreHeader.h
//  MissU
//
//  Created by hongjunxiao on 16/2/7.
//  Copyright © 2016年 ihj. All rights reserved.
//




#import "UIView+Extention.h"
#import "AFNetworking.h"
#import "MJExtension.h"
#import "XHJConst.h"
#import "MJRefresh.h"
#import "SVProgressHUD.h"
#import "XHJTopicViewController.h"
#import "NetworkManager.h"
#import "UIImageView+WebCache.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width

#define ScreenHeight [UIScreen mainScreen].bounds.size.height

#define RGB(a,b,c) [UIColor colorWithRed:a/255.0 green:b/255.0 blue:c/255.0 alpha:1]

#define REDCOLOR [UIColor colorWithRed:228 / 255.0 green:46 / 255.0 blue:21 / 255.0 alpha:1]
#define BLACKCOLOR [UIColor colorWithRed:51 / 255.0 green:51 / 255.0 blue:51 / 255.0 alpha:1]
#define BGCOLOR [UIColor colorWithRed:219 / 255.0 green:219 / 255.0 blue:219 / 255.0 alpha:1]
#define WORDCOLOR [UIColor colorWithRed:123 / 255.0 green:123 / 255.0 blue:123 / 255.0 alpha:1]
#define WEAKSELF   typeof(self)     __weak weakSelf = self;


#define API @"http://api.budejie.com/api/api_open.php"


/*定义用到的图片的类型*/
typedef NS_ENUM(NSInteger,TopicType){
    TopicTypeAll = 1,
    TopicTypePicture = 10,
    TopicTypeWord = 29,
    TopicTypeAudio = 31,
    TopicTypeVideo = 41
};
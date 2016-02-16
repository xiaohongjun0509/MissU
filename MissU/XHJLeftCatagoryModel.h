//
//  XHJLeftCatagoryModel.h
//  MissU
//
//  Created by hongjunxiao on 16/2/16.
//  Copyright © 2016年 ihj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XHJLeftCatagoryModel : NSObject
/*
 "theme_id": "163",
 "theme_name": "生活百科",
 "image_list": "http:%/%/img.spriteapp.cn%/ugc%/2015%/04%/23%/160559_24190.jpg",
 "sub_number": "36871",
 "is_sub": 0,
 "is_default": 0
 */

@property (nonatomic, copy) NSString *catagoryId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *count;

@end

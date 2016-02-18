//
//  NetworkManager.m
//  MissU
//
//  Created by hongjunxiao on 16/2/15.
//  Copyright © 2016年 ihj. All rights reserved.
//

#import "NetworkManager.h"
#import "AFNetworking.h"
@implementation NetworkManager

+(void)startRequest:(id)params success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nonnull))successBlock failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure{
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];
    [[AFHTTPSessionManager manager] GET:API parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        [SVProgressHUD dismiss];
        if (successBlock) {
            successBlock(task,responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(task,error);
        }
        [SVProgressHUD dismiss];
    }];
}


 
 



@end

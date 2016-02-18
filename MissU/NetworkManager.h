//
//  NetworkManager.h
//  MissU
//
//  Created by hongjunxiao on 16/2/15.
//  Copyright © 2016年 ihj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkManager : NSObject



+(void)startRequest:(nullable id)params
                    success:(nullable void (^)(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject))successBlock
                    failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure;



//- (nullable NSURLSessionDataTask *)GET:(NSString *)URLString
//                            parameters:(nullable id)parameters
//                               success:(nullable void (^)(NSURLSessionDataTask *task, id responseObject))success
//                               failure:(nullable void (^)(NSURLSessionDataTask * __nullable task, NSError *error))failure;
@end

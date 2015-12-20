//
//  BDTHttpClient.h
//  com.qunau.bandaoti
//
//  Created by cy on 15/12/15.
//  Copyright © 2015年 Qunau. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface BDTHttpClient : NSObject
/**
 *  @brief  网络请求实体
 *
 *  @return 网络请求实体
 */
+ (BDTHttpClient *)shareManager;

/**
 *  @brief  网络post请求
 *
 *  @param urlString     接口地址
 *  @param parameters    参数
 *  @param successBlock  请求成功返回
 *  @param failureBlock  请求失败返回
 */

- (void)httpClientPost:(NSString *)urlString
            withParams:(NSDictionary *)parameters
               success:(void(^)(NSURLSessionDataTask *task, id responseObject))successBlock
               failure:(void(^)(NSURLSessionDataTask *task, NSError *error))failureBlock;
@end

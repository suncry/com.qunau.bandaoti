//
//  BDTHttpClient.m
//  com.qunau.bandaoti
//
//  Created by cy on 15/12/15.
//  Copyright © 2015年 Qunau. All rights reserved.
//

#import "BDTHttpClient.h"
#import <SSKeychain.h>


#define DefaultBaseUrl @"http://123123123"
static BDTHttpClient *httpClient;

@interface BDTHttpClient()
@property (nonatomic, strong) AFHTTPSessionManager *manager;
@property (nonatomic, strong) NSString *baseUrl;
@end


@implementation BDTHttpClient
- (id)init {
    self = [super init];
    if (self) {
        _manager = [AFHTTPSessionManager manager];
        //设置超时时间 暂时默认20秒超时
        _manager.requestSerializer.timeoutInterval = 20;
    }
    return self;
}

+ (BDTHttpClient *)shareManager {
    if (!httpClient) {
        static dispatch_once_t predicate1;
        dispatch_once(&predicate1, ^{
            httpClient = [[self alloc] init];
        });
    }
    return httpClient;
}

- (NSString *)baseUrl {
    
    if (!_baseUrl)
    {
        _baseUrl = DefaultBaseUrl;
    }
    return _baseUrl;
}

- (void)httpClientPost:(NSString *)urlString
            withParams:(NSDictionary *)parameters
               success:(void(^)(NSURLSessionDataTask *task, id responseObject))successBlock
               failure:(void(^)(NSURLSessionDataTask *task, NSError *error))failureBlock{
    NSString *url = [self.baseUrl stringByAppendingString:urlString];
    NSMutableDictionary *mutParameters = [self addPublicParamWithDict:parameters urlString:urlString];

    [self.manager POST:url parameters:mutParameters progress:^(NSProgress * _Nonnull uploadProgress) {
        //进度
        NSLog(@"总进度 == %lld",uploadProgress.totalUnitCount);
        NSLog(@"已完成 == %lld",uploadProgress.completedUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock(task,responseObject);

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(task,error);
    }];
    

}

//添加公共参数 并对参数进行处理
- (NSMutableDictionary *)addPublicParamWithDict:(NSDictionary *)dict urlString:(NSString *)url {
    NSMutableDictionary *mutDict = [NSMutableDictionary dictionaryWithDictionary:dict];
    return mutDict;
}

@end

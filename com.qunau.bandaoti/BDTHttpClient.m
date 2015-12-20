//
//  BDTHttpClient.m
//  com.qunau.bandaoti
//
//  Created by cy on 15/12/15.
//  Copyright © 2015年 Qunau. All rights reserved.
//

#import "BDTHttpClient.h"
#import <SSKeychain.h>
#import "JoDes.h"


#define DefaultBaseUrl @"http://api.bdttrip.com"

//空字符串
#define     Des_Key           @"19880727"

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
        _manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
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
//    NSString *url = [self.baseUrl stringByAppendingString:urlString];
    NSString *url = self.baseUrl;

    NSMutableDictionary *mutParameters = [self addPublicParamWithDict:parameters urlString:urlString];
    
    NSString *parameterString = [self dictionaryToJson:mutParameters];
    
    NSString *encryptString = [JoDes encode:parameterString key:Des_Key];

    
    [self.manager POST:url parameters:encryptString progress:^(NSProgress * _Nonnull uploadProgress) {
        //Progress
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString *result = [[NSString alloc] initWithData:responseObject  encoding:NSUTF8StringEncoding];
        NSString *jsonString = [JoDes decode:result key:Des_Key];
        NSData* jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:nil];
        successBlock(task,resultDic);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(task,error);
    }];
    

}

//添加公共参数 并对参数进行处理
- (NSMutableDictionary *)addPublicParamWithDict:(NSDictionary *)dict urlString:(NSString *)url {
    /*  version string 当前使用的 API 版本号
    	service string 当前请求的API接口名称
    	app_type int app类型 1:导游端 2:游客端
    	os_type int  当前平台类型 1:iOS 2:Android
    	device_token string 设备唯一码
    	Token string 票据  若为空，只能方位 get_user、login
     */
    
    NSMutableDictionary *mutDict = [NSMutableDictionary dictionaryWithDictionary:dict];
    mutDict[@"version"] = @"1.0";
    mutDict[@"service"] = url;
    mutDict[@"app_type"] = @1;
    mutDict[@"os_type"] = @1;
    mutDict[@"device_token"] = @"1";
    mutDict[@"Token"] = @"451687895923006";

    return mutDict;
}

//字典转json格式字符串：

- (NSString*)dictionaryToJson:(NSDictionary *)dic

{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

@end

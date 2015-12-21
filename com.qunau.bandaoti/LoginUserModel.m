//
//  LoginUserModel.m
//  com.qunau.bandaoti
//
//  Created by cy on 15/12/21.
//  Copyright © 2015年 Qunau. All rights reserved.
//

#import "LoginUserModel.h"

@implementation LoginUserModel

+ (void)getUserWithSuccess:(void(^)(LoginUser *user))successBlock
                   failure:(void(^)(NSString *error))failureBlock{
    [[BDTHttpClient shareManager] httpClientPost:ACTION_OF_Get_User withParams:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        LoginUser *user = [LoginUser yy_modelWithDictionary:responseObject];
        successBlock(user);
    } failure:^(NSURLSessionDataTask *task, NSString *error) {
        failureBlock(error);
    }];
}

@end

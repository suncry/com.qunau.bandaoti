//
//  LoginUserModel.h
//  com.qunau.bandaoti
//
//  Created by cy on 15/12/21.
//  Copyright © 2015年 Qunau. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginUser.h"

@interface LoginUserModel : NSObject

/**
 *  @brief 获取登录用户
 */
+ (void)getUserWithSuccess:(void(^)(LoginUser *user))successBlock
                   failure:(void(^)(NSString *error))failureBlock;

@end

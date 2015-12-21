//
//  LoginUser.h
//  com.qunau.bandaoti
//
//  Created by cy on 15/12/21.
//  Copyright © 2015年 Qunau. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginUser : NSObject

@property (nonatomic,assign) NSInteger AccountType;
@property (nonatomic,assign) NSInteger AuditState;
@property (nonatomic,strong) NSString *BeInviteCode;
@property (nonatomic,strong) NSString *InviteCode;
@property (nonatomic,assign) NSInteger InviteTimes;

@end

//
//  JoDes.h
//  com.qunau.bandaoti
//
//  Created by cy on 15/12/21.
//  Copyright © 2015年 Qunau. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

@interface JoDes : NSObject

+ (NSString *) encode:(NSString *)str key:(NSString *)key;
+ (NSString *) decode:(NSString	*)str key:(NSString *)key;

@end

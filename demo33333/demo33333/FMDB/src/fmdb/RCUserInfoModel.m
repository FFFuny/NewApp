//
//  RCUserInfoModel.m
//  demo33333
//
//  Created by JianXin on 16/2/19.
//  Copyright © 2016年 JianXin. All rights reserved.
//

#import "RCUserInfoModel.h"

@implementation RCUserInfoModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

- (id)valueForUndefinedKey:(NSString *)key {
    return nil;
}


+ (RCUserInfoModel *)modelWithUserId:(NSString *)userId username:(NSString *)username imgStr:(NSString *)imgStr
{
    return [[RCUserInfoModel alloc] initWithUserId:userId username:username imgStr:imgStr];
}

- (id)initWithUserId:(NSString *)userId username:(NSString *)username imgStr:(NSString *)imgStr {
    if (self = [super init]) {
        
        self.userId = userId;
        self.username = username;
        self.imgStr = imgStr;
        
    }
    return self;
}

@end

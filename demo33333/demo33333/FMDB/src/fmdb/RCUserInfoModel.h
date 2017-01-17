//
//  RCUserInfoModel.h
//  demo33333
//
//  Created by JianXin on 16/2/19.
//  Copyright © 2016年 JianXin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RCUserInfoModel : NSObject

@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *imgStr;

+ (RCUserInfoModel *)modelWithUserId:(NSString *)userId username:(NSString *)username imgStr:(NSString *)imgStr;


@end

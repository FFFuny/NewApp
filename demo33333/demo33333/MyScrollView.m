//
//  MyScrollView.m
//  demo33333
//
//  Created by JianXin on 16/1/18.
//  Copyright © 2016年 JianXin. All rights reserved.
//

#import "MyScrollView.h"

@implementation MyScrollView

- (instancetype)init
{
    if (self = [super init]) {
        [self create];
    }
    return self;
}

- (void)create
{
    self.pagingEnabled = YES;
    self.contentSize = CGSizeMake(670, 0);
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

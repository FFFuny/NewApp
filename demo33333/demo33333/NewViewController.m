//
//  NewViewController.m
//  demo33333
//
//  Created by JianXin on 15/12/23.
//  Copyright © 2015年 JianXin. All rights reserved.
//

#import "NewViewController.h"
#import "FMDB.h"
#import "RCUserInfoModel.h"

#define docPath [[(NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)) lastObject] stringByAppendingPathComponent:userDatabaseName]
#define userDatabaseName @"user.sqlite"

@interface NewViewController ()

{
    FMDatabase *db;
}

@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    
    
    
    [self createUserTable];
    
    NSLog(@"path =%@", docPath);
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 667)];
    view1.backgroundColor = [UIColor blackColor];
    view1.alpha = 0.5;
    [[UIApplication sharedApplication].keyWindow addSubview:view1];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    [btn setTitle:@"+" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(add:) forControlEvents:UIControlEventTouchUpInside];
    [[UIApplication sharedApplication].keyWindow addSubview:btn];
}

- (void)add:(UIButton *)sender
{
    int a = [sender.titleLabel.text intValue];
    a ++;
    [sender setTitle:[NSString stringWithFormat:@"%d", a] forState:UIControlStateNormal];
}

- (IBAction)insert:(id)sender {
    
    if ([db open]) {
        
        if ([db executeUpdate:@"insert into user (userId, username, imgStr) values(?,?,?)", @"lining",@"你好", @"www.baidu.com"]) {
            NSLog(@"insert success");
            [db close];
        } else {
            NSLog(@"insert fail");
        }
    } else {
        NSLog(@"open fail");
    }
    

}

- (IBAction)update:(id)sender
{
    if ([db open]) {
        
        if ([db executeUpdate:@"update user set username=?,imgStr=? where userId='lining'", @"liu", @"www.sina.com"]) {
            NSLog(@"update success");
            [db close];
        } else {
            NSLog(@"update fail");
        }
        
    } else {
        NSLog(@"open fail");
    }
    
}

- (void)createUserTable
{
    db = [FMDatabase databaseWithPath:docPath];

    if ([db open]) {
        if (![db tableExists:@"user"]) {
            if ([db executeUpdate:@"create table user (userId text primary key,username text,imgStr text)"]) {
                
                [db close];
                NSLog(@"create success");
            } else {
                NSLog(@"create fail");
            }
        } else {
            NSLog(@"table exist");
        }
    } else {
        NSLog(@"open fail");
    }
}

- (IBAction)search:(id)sender {
    
    if ([db open]) {
        
        FMResultSet *resSet = [db executeQuery:@"select * from user"];
        
        NSMutableArray *userArr = [NSMutableArray array];
        
        while ([resSet next]) {
            
            NSString *userId = [resSet stringForColumn:@"userId"];
            NSString *username = [resSet stringForColumn:@"username"];
            NSString *imgStr = [resSet stringForColumn:@"imgStr"];
            
            RCUserInfoModel *model = [RCUserInfoModel modelWithUserId:userId username:username imgStr:imgStr];
            
            [userArr addObject:model];
        }
        
        [db close];

    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

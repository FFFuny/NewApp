//
//  AppDelegate.m
//  demo33333
//
//  Created by JianXin on 15/12/23.
//  Copyright © 2015年 JianXin. All rights reserved.
//

#import "AppDelegate.h"
#import "NewViewController.h"
#import "ViewController.h"
#import "SFHFKeychainUtils.h"

#import <AdSupport/AdSupport.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
//    NewViewController *newvc = [[NewViewController alloc] init];
    self.window.rootViewController = [[ViewController alloc] init];
//    self.window.rootViewController = [[NewViewController alloc] init];
    
    
    NSString *SERVICE_NAME = @"com.demo33333";//最好用程序的bundle id
    NSString * str =  [SFHFKeychainUtils getPasswordForUsername:@"UUID" andServiceName:SERVICE_NAME error:nil];  // 从keychain获取数据
    if ([str length]<=0)
    {
        str  = [[[UIDevice currentDevice] identifierForVendor] UUIDString];  // 保存UUID作为手机唯一标识符
        [SFHFKeychainUtils storeUsername:@"UUID"
                             andPassword:str
                          forServiceName:SERVICE_NAME
                          updateExisting:1
                                   error:nil];  // 往keychain添加数据
    }
    
    NSLog(@"str = %@", str);
    
    // EE15B0A0-8B0B-4191-999E-4E0034A39C23
    
    // 获取idfa
    NSString *stt = [AppDelegate idfa];
    
    NSLog(@"stttt = %@" , stt);
    
    
    return YES;
}

+ (NSString *)idfa
{
    NSString *adid = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    
    NSLog(@"adid = %@", adid);
    return adid;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

//
//  AppDelegate.m
//  LJhHorizontalRollController
//
//  Created by gaolijun on 15/8/11.
//  Copyright (c) 2015年 Lijun Gao. All rights reserved.
//

#import "AppDelegate.h"

#import "LJHorizontalRollController.h"
#import "LJOneTestViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    LJHorizontalRollController *lj = [[LJHorizontalRollController alloc] init];
    self.window.rootViewController = lj;
    
    LJOneTestViewController *test1 = [[LJOneTestViewController alloc] init];
    [lj setupVc:test1 title:@"test1"];
    
    LJOneTestViewController *test2 = [[LJOneTestViewController alloc] init];
    [lj setupVc:test2 title:@"test2"];
    
    LJOneTestViewController *test3 = [[LJOneTestViewController alloc] init];
    [lj setupVc:test3 title:@"test3"];
    
//    LJOneTestViewController *test4 = [[LJOneTestViewController alloc] init];
//    [lj setupVc:test4 title:@"test4"];
    
//    LJOneTestViewController *test5 = [[LJOneTestViewController alloc] init];
//    [lj setupVc:test5 title:@"test5"];
    
    lj.theShowNo = 1;
    
    [self.window makeKeyAndVisible];
    
    return YES;
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

//
//  AppDelegate.m
//  mmDrawerControlDemo
//
//  Created by IDSBG-00 on 2016/8/25.
//  Copyright © 2016年 IDSBG-00. All rights reserved.
//

#import "AppDelegate.h"
#import "MMDrawerController.h"
#import "aViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    aViewController *aController = [[aViewController alloc] init];
    UIViewController *bController = [[UIViewController alloc] init];
    UIViewController *cController = [[UIViewController alloc] init];
    aController.view.backgroundColor = [UIColor redColor];
    bController.view.backgroundColor = [UIColor yellowColor];
    cController.view.backgroundColor = [UIColor greenColor];
    
    UINavigationController *tfNav = [[UINavigationController alloc] initWithRootViewController:aController];
    UINavigationController *tfNav2 = [[UINavigationController alloc] initWithRootViewController:bController];
    UINavigationController *tfNav3 = [[UINavigationController alloc] initWithRootViewController:cController];
    
    tfNav.tabBarItem.title = @"a";
    tfNav2.tabBarItem.title = @"b";
    tfNav3.tabBarItem.title = @"c";
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[tfNav,tfNav2,tfNav3];
    
    //左边抽屉拉开的视图
    UIViewController *leftVC = [[UIViewController alloc] init];
    leftVC.view.backgroundColor = [UIColor whiteColor];
    
    //这里是初始化 中间视图，左边视图。
    MMDrawerController *drawerContrl = [[MMDrawerController alloc] initWithCenterViewController:tabBarController leftDrawerViewController:leftVC];
    //设置 打开 跟 关闭 的手势，一开始设置打开手势为None
    drawerContrl.openDrawerGestureModeMask = MMOpenDrawerGestureModeNone;
    drawerContrl.closeDrawerGestureModeMask =MMCloseDrawerGestureModeAll;
    drawerContrl.maximumLeftDrawerWidth = 200.0;
    
    
    
    self.window.rootViewController = drawerContrl;
    self.window.backgroundColor = [UIColor whiteColor];
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

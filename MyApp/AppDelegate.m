//
//  AppDelegate.m
//  MyApp
//
//  Created by TWTD on 2017/4/25.
//  Copyright © 2017年 TWTD. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
    
    [self setAppWindows];
    [self setRootViewController];
    Class debugCls = NSClassFromString(@"UIDebuggingInformationOverlay");
    [debugCls performSelector:NSSelectorFromString(@"prepareDebuggingOverlay")];
#if Textdemo == 0  // 测试

#else

#endif
    
    
    return YES;
}

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler{
    /*[注] 分享功能系统自带**/
    //判断先前我们设置的唯一标识
    if([shortcutItem.type isEqualToString:@"-11.UITouchText.share"]){
        NSArray *arr = @[@"hello 3D Touch"];
        UIActivityViewController *vc = [[UIActivityViewController alloc]initWithActivityItems:arr applicationActivities:nil];
        //设置当前的VC 为rootVC
        [self.window.rootViewController presentViewController:vc animated:YES completion:^{
            
        }];
    }
    
    //     [[NSNotificationCenter defaultCenter] postNotificationName:@"gotoshare" object:self userInfo:@{@"type":@"1"}];
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end

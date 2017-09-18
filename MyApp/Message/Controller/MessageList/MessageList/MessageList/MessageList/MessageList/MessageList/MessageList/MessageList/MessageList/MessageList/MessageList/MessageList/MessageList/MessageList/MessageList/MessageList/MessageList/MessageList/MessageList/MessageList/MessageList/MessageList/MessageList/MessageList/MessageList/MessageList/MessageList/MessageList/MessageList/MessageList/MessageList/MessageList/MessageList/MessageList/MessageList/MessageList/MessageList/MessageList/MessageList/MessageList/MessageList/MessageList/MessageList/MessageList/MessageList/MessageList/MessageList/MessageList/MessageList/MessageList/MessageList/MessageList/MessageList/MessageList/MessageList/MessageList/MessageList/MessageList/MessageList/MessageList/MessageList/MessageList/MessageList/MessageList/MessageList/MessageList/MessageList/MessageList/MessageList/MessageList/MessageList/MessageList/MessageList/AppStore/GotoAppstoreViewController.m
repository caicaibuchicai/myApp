//
//  GotoAppstoreViewController.m
//  MyApp
//
//  Created by TWTD on 2017/6/6.
//  Copyright © 2017年 TWTD. All rights reserved.
//

#import "GotoAppstoreViewController.h"
#import <StoreKit/StoreKit.h>

@interface GotoAppstoreViewController ()<SKStoreProductViewControllerDelegate>

@end

@implementation GotoAppstoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton * bt = [UIButton buttonWithType:UIButtonTypeSystem];
    bt.frame = CGRectMake(0, 0, 200, 200);
    [bt setTitle:@"跳转App Store应用" forState: (UIControlStateNormal)];
    [bt addTarget:self action:@selector(gotoAppStore) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:bt];

    
}

- (void)gotoAppStore{
        [self openAppWithIdentifier:@"1224871450"];
}



- (void)openAppWithIdentifier:(NSString*)appId{
    
    SKStoreProductViewController*storeProductVC =  [[SKStoreProductViewController alloc] init];
    
    storeProductVC.delegate=self;
    
    NSDictionary*dict = [NSDictionary dictionaryWithObject:appId forKey:SKStoreProductParameterITunesItemIdentifier];
    
  
    [storeProductVC loadProductWithParameters:dict completionBlock:^(BOOL result,NSError*error) {
        
        if(result) {
            
            [self presentViewController:storeProductVC animated:YES completion:nil];
            
        }
        
    }];
    
}

#pragma mark -协议方法

- (void)productViewControllerDidFinish:(SKStoreProductViewController*)viewController{
    
    NSLog(@"关闭界面");
    
    [viewController dismissViewControllerAnimated:YES completion:nil];
    
}




@end

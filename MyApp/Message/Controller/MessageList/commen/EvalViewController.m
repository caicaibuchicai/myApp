//
//  EvalViewController.m
//  MyApp
//
//  Created by TWTD on 2017/8/3.
//  Copyright © 2017年 TWTD. All rights reserved.
//

#import "EvalViewController.h"
#import <StoreKit/StoreKit.h>


@interface EvalViewController ()<SKStoreProductViewControllerDelegate>

@end

@implementation EvalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark SKStoreProductViewControllerDelegate
- (void)evaluate{
    static NSString *appId =@"1224871450";
    //初始化控制器
    SKStoreProductViewController *storeProductViewContorller = [[SKStoreProductViewController alloc] init];
    
    //设置代理请求为当前控制器本身
    storeProductViewContorller.delegate = self;
    
    //加载一个新的视图展示
    [storeProductViewContorller loadProductWithParameters:
     //appId唯一的
     @{SKStoreProductParameterITunesItemIdentifier : appId}
                                          completionBlock:^(BOOL result, NSError *error) {
                                              //block回调
                                              if(error){
                                                  NSLog(@"error %@ with userInfo %@",error,[error userInfo]);
                                              }else{
                                                  //模态弹出appstore
                                                  [self presentViewController:storeProductViewContorller animated:YES completion:^{
                                                      
                                                  }
                                                   ];
                                              }
                                          }];
}

//取消按钮监听
- (void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController{
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}
- (IBAction)commbt:(id)sender {
     [SKStoreReviewController requestReview];
}
- (IBAction)commbtforAppstore:(id)sender {
  
     [self evaluate];
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

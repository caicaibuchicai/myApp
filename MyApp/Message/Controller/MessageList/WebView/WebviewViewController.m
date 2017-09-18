//
//  WebviewViewController.m
//  MyApp
//
//  Created by TWTD on 2017/8/2.
//  Copyright © 2017年 TWTD. All rights reserved.
//

#import "WebviewViewController.h"

@interface WebviewViewController ()

@end

@implementation WebviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView * webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:webView];
    
    
//    NSURL  *url = [NSURL URLWithString:@"http://m.kuaidi100.com/result.jsp?nu=358672323847"];
    //    NSURL  *url = [NSURL URLWithString:str];
     NSURL  *url = [NSURL URLWithString:@"https://www.baidu.com"];
    NSURLRequest  *request = [NSURLRequest  requestWithURL:url];
    
    [webView  loadRequest:request];
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

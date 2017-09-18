//
//  XCApplicationViewController.m
//  MyApp
//
//  Created by TWTD on 2017/8/3.
//  Copyright © 2017年 TWTD. All rights reserved.
//

#import "XCApplicationViewController.h"

@interface XCApplicationViewController ()
{
    UIApplication * app;
}


@end

@implementation XCApplicationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    app = [UIApplication sharedApplication];
}
- (IBAction)printsome1:(id)sender {
    
}
- (IBAction)printsome2:(id)sender {
}
- (IBAction)printsome3:(id)sender {
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

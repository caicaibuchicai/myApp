//
//  SestermSettingviewController.m
//  MyApp
//
//  Created by TWTD on 2017/8/3.
//  Copyright © 2017年 TWTD. All rights reserved.
//

#import "SestermSettingviewController.h"

@interface SestermSettingviewController ()

@end

@implementation SestermSettingviewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.36 green:0.27 blue:0.14 alpha:1.00];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)locationset:(id)sender {
    
    NSURL *url= [NSURL URLWithString:@"prefs:root=LOCATION_SERVICES"];
    [self goby:url];
}
- (IBAction)systemset:(id)sender {
    NSURL *url= [NSURL URLWithString:@"Prefs:root=INTERNET_TETHERING"];
    [self goby:url];
}
- (IBAction)wifiset:(id)sender {
    NSURL *url= [NSURL URLWithString:@"Prefs:root=WIFI"];
    [self goby:url];
}
- (IBAction)bluset:(id)sender {
    NSURL *url= [NSURL URLWithString:@"prefs:root=Bluetooth"];
    [self goby:url];
}
- (IBAction)systemNotiset:(id)sender {
    NSURL *url= [NSURL URLWithString:@"Prefs:root=NOTIFICATIONS_ID"];
    [self goby:url];
}
- (IBAction)allset:(id)sender {
    NSURL *url= [NSURL URLWithString:@"Prefs:root=General"];
    [self goby:url];
}

- (void)goby:(NSURL*)url1{
    
        NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        [[UIApplication sharedApplication]openURL:url options:@{}completionHandler:^(BOOL  success) {
        }];

    
   
    
//    NSURL*url=[NSURL URLWithString:@"Prefs:root=General&path=About"];
//    Class LSApplicationWorkspace = NSClassFromString(@"LSApplicationWorkspace");
//    [[LSApplicationWorkspace performSelector:@selector(defaultWorkspace)] performSelector:@selector(openSensitiveURL:withOptions:) withObject:url withObject:nil];
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

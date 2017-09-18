//
//  NetWorkExchangeViewController.m
//  MyApp
//
//  Created by TWTD on 2017/5/12.
//  Copyright © 2017年 TWTD. All rights reserved.
//

#import "NetWorkExchangeViewController.h"
#import "Reachability.h"
#include <sys/param.h>
#include <sys/mount.h>
#import <sys/sysctl.h>
#import <mach/mach.h>


@interface NetWorkExchangeViewController ()
{
    UILabel * netlable;
}
@property (nonatomic,strong)Reachability * conn;

@end

@implementation NetWorkExchangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self freeDiskSpaceInBytes];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkStateChage) name:kReachabilityChangedNotification object:nil];
    self.conn = [Reachability reachabilityForInternetConnection];
    [self.conn startNotifier];
    
    NSString * str = [NSString stringWithFormat:@"%@",NULL];
    
    if(str==nil)
    {
        NSLog(@"KDA!");
    }
    
    if([str isEqual:[NSNull null]])
    {
        NSLog(@"KDA!");
    }
    
    netlable = [[UILabel alloc]initWithFrame:CGRectMake(0, 104, self.view.frame.size.width, 20)];
    netlable.backgroundColor = [UIColor redColor];
    [self.view addSubview:netlable];
    [self checkNetworkState];
    
}

- (NSString *)freeDiskSpaceInBytes{
    struct statfs buf;
    unsigned long long freeSpace = -1;
    if (statfs("/var", &buf) >= 0) {
        freeSpace = (unsigned long long)(buf.f_bsize * buf.f_bavail);
    }
    NSString *str = [NSString stringWithFormat:@"手机剩余存储空间为：%0.2lld GB",freeSpace/1024/1024/1024];
    UILabel * lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 74,self.view.frame.size.width, 20)];
    lable.backgroundColor = [UIColor redColor];
    lable.text = str;
    [self.view addSubview:lable];
    
    
    vm_statistics_data_t vmStats;
    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(),
                                               HOST_VM_INFO,
                                               (host_info_t)&vmStats,
                                               &infoCount);
    
    if (kernReturn != KERN_SUCCESS) {
        return nil;
    }
    NSString *str1 = [NSString stringWithFormat:@"手机剩余运行空间为：%0.2f MB", ((vm_page_size *vmStats.free_count) / 1024.0) / 1024.0/1024.0];
    UILabel * lable1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 154,self.view.frame.size.width, 20)];
    lable1.backgroundColor = [UIColor redColor];
    lable1.text = str1;
    [self.view addSubview:lable1];
   ;
    return str;
}

- (void)dealloc{
    [self.conn stopNotifier];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

- (void)networkStateChage{
    [self checkNetworkState];
}

- (void)checkNetworkState{
    
    
    
       // 1.检测手机是否能上网络(WIFI\3G\2.5G)
      Reachability *conn = [Reachability reachabilityForInternetConnection];
    
    // 2.判断网络状态
    switch ([conn currentReachabilityStatus]) {
        case NotReachable:
            NSLog(@"无网络");// 无网络
            netlable.text = @"无网络";
            break;
        case ReachableViaWiFi: // 使用wifi
            NSLog(@"使用wifi");
            netlable.text = @"使用wifi";
            break;
        case ReachableViaWWAN: // 使用自带网络
            NSLog(@"使用自带网络");
            netlable.text = @"使用自带网络";
            break;
            
        default:
              NSLog(@"无法识别的网络");
            netlable.text = @"无法识别的网络";
            break;
    }
//       if ([conn currentReachabilityStatus] != NotReachable) { // 有wifi
//           
//               NSLog(@"有wifi");
//        
//           } else if ([conn currentReachabilityStatus] != NotReachable) { // 没有使用wifi, 使用手机自带网络进行上网
//                    NSLog(@"使用手机自带网络进行上网");
//            
//                 } else { // 没有网络
//                       NSLog(@"没有网络");
//                    
//                    }

}


@end

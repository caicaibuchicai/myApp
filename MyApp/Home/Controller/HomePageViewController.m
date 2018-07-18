//
//  HomePageViewController.m
//  MyApp
//
//  Created by liaowentao on 17/3/22.
//  Copyright © 2017年 Haochuang. All rights reserved.
//

#import "HomePageViewController.h"
#import "LWTSegementViewController.h"
#import "NewsViewController.h"


@interface HomePageViewController ()

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
   
    [self buidUI];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(gotoTestVc) name:@"gotoshare" object:nil];
}



- (void)buidUI
{
    self.title = @"首页";
    self.view.backgroundColor = WHITCOLOR;
    
    UIButton *navButton = [[UIButton alloc] init];
    [navButton setTitle:@"看新闻吧" forState:UIControlStateNormal];
    [navButton addTarget:self action:@selector(pushTheNewsMainViewController:) forControlEvents:UIControlEventTouchUpInside];
    [navButton setTitleColor:MAIN_GROUNDCOLOR forState:UIControlStateNormal];
    [self.view addSubview:navButton];
    
    WeakSelf(self);
    [navButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakself.view);
        make.left.equalTo(weakself.view).offset(-10);
        make.right.equalTo(weakself.view).offset(-10);
        make.height.mas_equalTo(Button_Height);
    }];
    
    
    UIButton * _maskButton = [[UIButton alloc] init];
    [_maskButton setTitle:@"掏空按钮上面的一部分" forState:(UIControlStateNormal)];
    [_maskButton setFrame:CGRectMake(0, 0, SCREEN_WIDTH/2, SCREEN_HEIGHT/4)];
    [_maskButton setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.7]];
    [self.view addSubview:_maskButton];
    
    //create path
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, SCREEN_WIDTH/2, SCREEN_HEIGHT/4)];
    
    // MARK: circlePath
    [path appendPath:[UIBezierPath bezierPathWithArcCenter:CGPointMake(SCREEN_WIDTH / 4, 120) radius:20 startAngle:0 endAngle:2*M_PI clockwise:NO]];
    
    // MARK: roundRectanglePath
    [path appendPath:[[UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 100,SCREEN_WIDTH/2-20, 10) cornerRadius:15] bezierPathByReversingPath]];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    
    shapeLayer.path = path.CGPath;
    
    [_maskButton.layer setMask:shapeLayer];


}

- (void)gotoTestVc{
    //分享的标题
    NSString *textToShare = @"分享的标题。";
    //分享的图片
    UIImage *imageToShare = [UIImage imageNamed:@"111.jpg"];
    //分享的url
    NSURL *urlToShare = [NSURL URLWithString:@"https://www.baidu.com"];
    //在这里呢 如果想分享图片 就把图片添加进去  文字什么的通上
    NSArray *activityItems = @[textToShare,imageToShare, urlToShare];
    UIActivityViewController *activityVC = [[UIActivityViewController alloc]initWithActivityItems:activityItems applicationActivities:nil];
    //不出现在活动项目
    activityVC.excludedActivityTypes = @[UIActivityTypePrint, UIActivityTypeCopyToPasteboard,UIActivityTypeAssignToContact,UIActivityTypeSaveToCameraRoll];
    
    [self presentViewController:activityVC animated:YES completion:nil];
    // 分享之后的回调
    activityVC.completionWithItemsHandler = ^(UIActivityType  _Nullable activityType, BOOL completed, NSArray * _Nullable returnedItems, NSError * _Nullable activityError) {
        if (completed) {
            NSLog(@"completed");
            //分享 成功
        } else  {
            NSLog(@"cancled");
            //分享 取消
        }
    };

}


/**看新闻*/
- (void)pushTheNewsMainViewController:(UIButton *)button
{
    LWTSegementViewController *segVC = [[LWTSegementViewController alloc] init];
    segVC.titleArray = @[@"头条",@"生活",@"科技",@"社会",@"美女",@"汽车"];
    segVC.title = @"新闻事件";
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    for (NSString *titleStirng in segVC.titleArray) {
        NewsViewController *vc = [[NewsViewController alloc] init];
        vc.title = titleStirng;
        [array addObject:vc];
    }
    
    [self.navigationController pushViewController:segVC animated:YES];
    segVC.controllerArray = array;
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

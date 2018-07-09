//
//  MessageViewController.m
//  MyApp
//
//  Created by liaowentao on 17/3/29.
//  Copyright © 2017年 Haochuang. All rights reserved.
//

#import "MessageViewController.h"
#import <SafariServices/SafariServices.h>
#import "CalendarViewController.h"
#import "NetWorkExchangeViewController.h"
#import "YYTextViewController.h"
#import "XZChatViewController.h"
#import "GotoAppstoreViewController.h"
#import "CropViewController.h"
#import "CoreTextViewController.h"
#import "WebviewViewController.h"
#import "SestermSettingviewController.h"
#import "EvalViewController.h"

#import "ScrollViewViewController.h"

@interface MessageViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    BOOL height;
}
@property (nonatomic,strong)UITableView * tableview;
@property (nonatomic,strong)NSArray * listArr;

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    Class someClass = NSClassFromString(@"UIDebuggingInformationOverlay");
//    id obj = [someClass performSelector:NSSelectorFromString(@"overlay")];
//    [obj performSelector:NSSelectorFromString(@"toggleVisibility")];
    height = YES;
    self.title = @"动画";
    self.view.backgroundColor = WHITCOLOR;
    self.listArr = @[@"日历控件随便玩历控件随便玩历控件随便玩历控件随便玩历控件随便玩历控件随便玩历控件随便玩",@"网络监测,存储显示",@"YYtext",@"聊天",@"AppStore",@"切图",@"Coretext",@"webview",@"设置跳转",@"评论APP",@"swiftvc",@"轮播图",@"打卡"];
    [self initTableview];
    

}

- (void)initTableview{

    self.tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH, SCREEN_HEIGHT-49) style:(UITableViewStylePlain)];
    self.tableview.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    self.tableview.dataSource = self;
    self.tableview.delegate = self;
    [self.view addSubview:self.tableview];
}

#pragma mark tableview delegata

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (height && indexPath.row==0) {
        return 100;
    }else
    return 60;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellID = @"ListCellID";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = self.listArr[indexPath.row];
    if (height) {
        cell.textLabel.textColor = [UIColor redColor];
    }else{
          cell.textLabel.textColor = [UIColor blackColor];
    }
    cell.textLabel.numberOfLines = 0;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //取消选中某一行,让被选中行的高亮颜色消失(带动画效果)
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    height = !height;
    [tableView beginUpdates];
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [tableView endUpdates];
    
    
    switch (indexPath.row) {
        case 0:
        {
            CalendarViewController * cavc = [[CalendarViewController alloc]init];
            [self.navigationController pushViewController:cavc animated:YES];
        }
            break;
         case 1:
        {
            NetWorkExchangeViewController * netvc = [[NetWorkExchangeViewController alloc]init];
            [self.navigationController pushViewController:netvc animated:YES];
            
            break;
        }
        case 2:{
            
            YYTextViewController * netvc = [[YYTextViewController alloc]init];
            [self.navigationController pushViewController:netvc animated:YES];
            
            break;
        }
        case 3:{
        
        
            XZChatViewController * netvc = [[XZChatViewController alloc]init];
            [self.navigationController pushViewController:netvc animated:YES];
            
            break;
        }
        case 4:{
            
            
            GotoAppstoreViewController * netvc = [[GotoAppstoreViewController alloc]init];
            [self.navigationController pushViewController:netvc animated:YES];
            
            break;
        }
        case 5:{
            
            
            CropViewController * netvc = [[CropViewController alloc]init];
            [self.navigationController pushViewController:netvc animated:YES];
            
            break;
        }
        case 6:{
            
            
            CoreTextViewController * netvc = [[CoreTextViewController alloc]init];
            [self.navigationController pushViewController:netvc animated:YES];
            
            break;
        }
        case 7:{
            
            
            WebviewViewController * netvc = [[WebviewViewController alloc]init];
            [self.navigationController pushViewController:netvc animated:YES];
            
            break;
        }
        case 8:{
            
            
            SestermSettingviewController * netvc = [[SestermSettingviewController alloc]init];
            [self.navigationController pushViewController:netvc animated:YES];
            
            break;
        }
        case 9:{
            
            
            EvalViewController * netvc = [[EvalViewController alloc]init];
            [self.navigationController pushViewController:netvc animated:YES];
            
            break;
        }
        case 10:{
            
            
            SwiftTextViewController * netvc1 = [[SwiftTextViewController alloc]init];
            [self.navigationController pushViewController:netvc1 animated:YES];
            
            break;
        }
        case 11:{
            
            
            ScrollViewViewController * netvc1 = [[ScrollViewViewController alloc]init];
            [self.navigationController pushViewController:netvc1 animated:YES];
            
            break;
        }
        default:
            break;
    }
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end

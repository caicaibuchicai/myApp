//
//  CalendarViewController.m
//  MyApp
//
//  Created by TWTD on 2017/5/11.
//  Copyright © 2017年 TWTD. All rights reserved.
//

#import "CalendarViewController.h"
#import "FSCalendar.h"

@interface CalendarViewController ()<FSCalendarDelegate,FSCalendarDataSource>
@property (weak , nonatomic) FSCalendar *calendar;
@end

@implementation CalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    FSCalendar *calendar = [[FSCalendar alloc] initWithFrame:CGRectMake(0, 0, 320, 300)];
    calendar.dataSource = self;
    calendar.delegate = self;
    [self.view addSubview:calendar];
    self.calendar = calendar;
}





@end

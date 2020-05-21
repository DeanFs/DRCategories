//
//  DRViewController.m
//  DRCategories
//
//  Created by Dean_F on 07/14/2019.
//  Copyright (c) 2019 Dean_F. All rights reserved.
//

#import "DRViewController.h"
#import <DRCategories/DRCategories.h>
#import <DRMacroDefines/DRMacroDefines.h>

@interface DRViewController ()

@end

@implementation DRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
    kDR_LOG(@"date:%@", [[[NSDate date] firstLunarDayInThisYear] dateStringFromFormatterString:@"yyyyMMdd"]);
    
    NSLog(@"%@", [NSDateComponents componentsFromTimeInterval:87000]);
    NSLog(@"%@", [NSString descForTimeDuration:87000]);


    NSArray *datas = @[@(20), @(22), @(3), @(5), @(30), @(40), @(35)];
    kDR_LOG(@"开始：%@", datas);
    datas = [datas fbl_filter:^BOOL(NSNumber * _Nonnull value) {
        return value.intValue > 20;
    }];
    kDR_LOG(@"结束：%@", datas);
    
    kDR_LOG(@"%@", [@"67874738343" numberFormatWithMaxDecimalCount:2 isForce:YES]);
    kDR_LOG(@"%@", [@"526663.0" numberFormatWithMaxDecimalCount:2 isForce:NO]);
    kDR_LOG(@"%@", [@"63733649.888888" numberFormatWithMaxDecimalCount:2 isForce:NO]);
    kDR_LOG(@"%@", [@"-777888888888.25665673783" numberFormatWithMaxDecimalCount:5 isForce:NO]);
    
    // 1.Sun. 2.Mon. 3.Thes. 4.Wed. 5.Thur. 6.Fri. 7.Sat.
    [NSDate setCalendarWeekFirstday:7];
    NSDate *today = [NSDate date];
    
    NSLog(@"firstDay:%@", [today.firstDayInThisWeek dateStringFromFormatterString:@"yyyy-MM-dd"]);
    NSLog(@"week=%ld  weekIndex=%ld", [today weekday], [today weekdayIndex]);
    
    NSDate *date = [NSDate dateWithDateString:@"20200309" dateFormat:@"yyyyMMdd"];
    NSLog(@"是否周末：%d", [date isWeekend]);
    
    [NSDate getWeekDayOrderComplete:^(NSArray<NSNumber *> *numbers, NSArray<NSString *> *numberTitles, NSArray<NSString *> *weekTitles) {
        kDR_LOG(@"\n%@\n%@\n%@", numbers, numberTitles, weekTitles);
    }];
    
    [NSDate setCalendarWeekFirstday:6];
    NSInteger nextWeekDay = 1;
    kDR_LOG(@"下周%ld 日期：%@", nextWeekDay, [[[NSDate date] nextWeekDay:nextWeekDay] dateWithFormatterString:@"yyyyMMdd"]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

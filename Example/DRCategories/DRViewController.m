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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

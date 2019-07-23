//
//  NSDateComponents+DRExtension.m
//  DRCategories
//
//  Created by 冯生伟 on 2019/7/21.
//

#import "NSDateComponents+DRExtension.h"

@implementation NSDateComponents (DRExtension)

+ (instancetype)componentsFromTimeInterval:(int64_t)timeInterval {
    NSDateComponents *components = [NSDateComponents new];
    components.day = timeInterval / 86400;
    timeInterval %= 86400;
    
    components.hour = timeInterval / 3600;
    timeInterval %= 3600;
    
    components.minute = timeInterval / 60;
    components.second = timeInterval % 60;
    return components;
}

@end

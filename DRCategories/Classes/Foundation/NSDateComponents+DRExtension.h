//
//  NSDateComponents+DRExtension.h
//  DRCategories
//
//  Created by 冯生伟 on 2019/7/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDateComponents (DRExtension)

+ (instancetype)componentsFromTimeInterval:(int64_t)timeInterval;

@end

NS_ASSUME_NONNULL_END

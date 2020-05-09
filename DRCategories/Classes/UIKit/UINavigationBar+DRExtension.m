//
//  UINavigationBar+DRExtension.m
//  DRBasicKit
//
//  Created by 冯生伟 on 2019/3/15.
//

#import "UINavigationBar+DRExtension.h"
#import "UIView+DRExtension.h"

@implementation UINavigationBar (DRExtension)

+ (CGFloat)statusBarHeight {
    return CGRectGetHeight([[UIApplication sharedApplication] statusBarFrame]);
}

+ (CGFloat)navigationBarHeight {
    return [self statusBarHeight] + 44.0;
}

+ (CGFloat)navigationBarTopHeight {
    if ([self isIphoneXSeries]) {
        return 22.0;
    }
    return 0.0;
}

- (CGFloat)navigationBarHeight {
    return [UINavigationBar statusBarHeight] + self.height;
}

+ (BOOL )isIphoneXSeries {
    if (@available(iOS 11.0, *)) {
        return  [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;
    }else{
        return NO;
    }
}

@end

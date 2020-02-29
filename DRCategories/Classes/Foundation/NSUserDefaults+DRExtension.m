//
//  NSUserDefaults+DRExtension.m
//  DRBasicKit
//
//  Created by 冯生伟 on 2019/3/8.
//

#define kUserGroupNameKey @"kUserGroupNameKey"

#import "NSUserDefaults+DRExtension.h"

@implementation NSUserDefaults (DRExtension)

+ (nullable id)objectForKey:(NSString *)defaultName {
    return [[NSUserDefaults groupDefaults] objectForKey:defaultName];
}

+ (void)setObject:(nullable id)value forKey:(NSString *)defaultName {
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:defaultName];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [[NSUserDefaults groupDefaults] setObject:value forKey:defaultName];
    [[NSUserDefaults groupDefaults] synchronize];
}

+ (void)removeObjectForKey:(NSString *)defaultName {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:defaultName];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [[NSUserDefaults groupDefaults] removeObjectForKey:defaultName];
    [[NSUserDefaults groupDefaults] synchronize];
}

+ (nullable NSString *)stringForKey:(NSString *)defaultName {
    return [[NSUserDefaults standardUserDefaults] stringForKey:defaultName];
}

+ (nullable NSArray *)arrayForKey:(NSString *)defaultName {
    return [[NSUserDefaults standardUserDefaults] arrayForKey:defaultName];
}

+ (nullable NSDictionary<NSString *, id> *)dictionaryForKey:(NSString *)defaultName {
    return [[NSUserDefaults standardUserDefaults] dictionaryForKey:defaultName];
}

+ (nullable NSData *)dataForKey:(NSString *)defaultName {
    return [[NSUserDefaults standardUserDefaults] dataForKey:defaultName];
}

+ (nullable NSArray<NSString *> *)stringArrayForKey:(NSString *)defaultName {
    return [[NSUserDefaults standardUserDefaults] stringArrayForKey:defaultName];
}

+ (NSInteger)integerForKey:(NSString *)defaultName {
    return [[NSUserDefaults standardUserDefaults] integerForKey:defaultName];
}

+ (float)floatForKey:(NSString *)defaultName {
    return [[NSUserDefaults standardUserDefaults] floatForKey:defaultName];
}

+ (double)doubleForKey:(NSString *)defaultName {
    return [[NSUserDefaults standardUserDefaults] doubleForKey:defaultName];
}

+ (BOOL)boolForKey:(NSString *)defaultName {
    return [[NSUserDefaults standardUserDefaults] boolForKey:defaultName];
}

+ (void)setInteger:(NSInteger)value forKey:(NSString *)defaultName {
    [[NSUserDefaults standardUserDefaults] setInteger:value forKey:defaultName];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [[NSUserDefaults groupDefaults] setInteger:value forKey:defaultName];
    [[NSUserDefaults groupDefaults] synchronize];
}

+ (void)setFloat:(float)value forKey:(NSString *)defaultName {
    [[NSUserDefaults standardUserDefaults] setFloat:value forKey:defaultName];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [[NSUserDefaults groupDefaults] setFloat:value forKey:defaultName];
    [[NSUserDefaults groupDefaults] synchronize];
}

+ (void)setDouble:(double)value forKey:(NSString *)defaultName {
    [[NSUserDefaults standardUserDefaults] setDouble:value forKey:defaultName];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [[NSUserDefaults groupDefaults] setDouble:value forKey:defaultName];
    [[NSUserDefaults groupDefaults] synchronize];
}

+ (void)setBool:(BOOL)value forKey:(NSString *)defaultName {
    [[NSUserDefaults standardUserDefaults] setBool:value forKey:defaultName];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [[NSUserDefaults groupDefaults] setBool:value forKey:defaultName];
    [[NSUserDefaults groupDefaults] synchronize];
}

#pragma mark - 自定义组设置
+ (void)setUserDefaultGoupKey:(NSString *)groupKey {
    [[NSUserDefaults standardUserDefaults] setObject:groupKey forKey:kUserGroupNameKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSUserDefaults *)groupDefaults {
    NSString *groupName = [[NSUserDefaults standardUserDefaults] objectForKey:kUserGroupNameKey];
    if (groupName.length == 0) {
        return nil;
    }
    return [[NSUserDefaults alloc] initWithSuiteName:groupName];
}

+ (void)clean {
    NSString *groupName = [[NSUserDefaults standardUserDefaults] objectForKey:kUserGroupNameKey];
    if (groupName.length > 0) {
        NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:groupName];
        [userDefaults removePersistentDomainForName:groupName];
        [userDefaults synchronize];
    }
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end

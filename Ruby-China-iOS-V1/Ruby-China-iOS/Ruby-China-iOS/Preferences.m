//
//  Preferences.m
//  Ruby-China-iOS
//
//  Created by Liang Huang on 11/19/13.
//  Copyright (c) 2013 Vincent. All rights reserved.
//

#import "Preferences.h"

@interface Preferences()

+ (NSUserDefaults *)userDefaults;
+ (void)setValue:(id)value forKey:(NSString *)key;

@end

@implementation Preferences

+ (NSString *)privateToken {
    return [[self userDefaults] stringForKey:@"private_token"];
}
+ (void)setPrivateToken:(NSString *)value {
    [self setValue:value forKey:@"private_token"];
}

+ (NSString *)avatarUrl {
    return [[self userDefaults] stringForKey:@"avatar_url"];
}
+ (void)setAvatarUrl:(NSString *)value {
    [self setValue:value forKey:@"avatar_url"];
}

+ (NSString *)login {
    return [[self userDefaults] stringForKey:@"login"];
}
+ (void)setLogin:(NSString *)value {
    [self setValue:value forKey:@"login"];
}

+ (NSString *)password {
    return [[self userDefaults] stringForKey:@"password"];
}
+ (void)setPassword:(NSString *)value {
    [self setValue:value forKey:@"password"];
}

#pragma mark - Private
+ (NSUserDefaults *)userDefaults {
    return [NSUserDefaults standardUserDefaults];
}

+ (void)setValue:(id)value forKey:(NSString *)key {
    [[self userDefaults] setValue:value forKey:key];
    [[self userDefaults] synchronize];
}


@end

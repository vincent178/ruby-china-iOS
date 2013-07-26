//
//  Preference.m
//  RubyChina-for-IOS
//
//  Created by Vincent on 13-7-26.
//  Copyright (c) 2013年 Vincent. All rights reserved.
//

#import "Preference.h"

@implementation Preference

+ (NSString *) privateToken {
}
+ (void) setPrivateToken:(NSString *)value {
    [self setValue:value forKey:@"private_token"];
}

+ (NSString *) avatarUrl {
}
+ (void) setAvatarUrl:(NSString *)value {
    [self setValue:value forKey:@"avatar_url"];
}

+ (void) setLogin:(NSString *)value {
    [self setValue:value forKey:@"login"];
}

@end

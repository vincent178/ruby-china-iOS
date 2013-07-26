//
//  Preference.h
//  RubyChina-for-IOS
//
//  Created by Vincent on 13-7-26.
//  Copyright (c) 2013年 Vincent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Preference : NSObject

+ (NSString *) privateToken;
+ (void) setPrivateToken:(NSString *)value;

+ (NSString *) login;
+ (void) setLogin:(NSString *)value;

+ (NSString *) avatarUrl;
+ (void) setAvatarUrl:(NSString *)value;

@end

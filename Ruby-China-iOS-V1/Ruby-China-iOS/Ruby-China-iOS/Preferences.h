//
//  Preferences.h
//  Ruby-China-iOS
//
//  Created by Liang Huang on 11/19/13.
//  Copyright (c) 2013 Vincent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Preferences : NSObject

+ (NSString *)privateToken;
+ (void)setPrivateToken:(NSString *)value;

+ (NSString *)avatarUrl;
+ (void)setAvatarUrl:(NSString *)value;

+ (NSString *)login;
+ (void)setLogin:(NSString *)value;

+ (NSString *)password;
+ (void)setPassword:(NSString *)value;

@end

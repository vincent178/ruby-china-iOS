//
//  User.m
//  RubyChina-for-IOS
//
//  Created by Vincent on 13-7-22.
//  Copyright (c) 2013年 Vincent. All rights reserved.
//

#import "User.h"

static UIImage *defaultAvatarImage;

@implementation User

@synthesize email, name, twitter, location, bio, website, avatarUrl, githubUrl, tagline, login;

static User *_currentUser;

+(User *) initWithDictionary:(NSDictionary *)obj {
    User *user = [[User alloc] init];
    
    user.login = [obj objectForKey:@"login"];
}

@end

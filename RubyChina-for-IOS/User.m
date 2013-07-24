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
    
    user.avatarUrl = [obj objectForKey:@"avatar_url"];
    user.login     = [obj objectForKey:@"login"];
    user.name      = [obj objectForKey:@"name"];
    user.email     = [obj objectForKey:@"email"];
    user.githubUrl = [obj objectForKey:@"github_url"];
    user.bio       = [obj objectForKey:@"bio"];
    
    return user;
}

+(User *) currentUser {
    return _currentUser;
}

@end

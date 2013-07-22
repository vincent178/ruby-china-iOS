//
//  User.h
//  RubyChina-for-IOS
//
//  Created by Vincent on 13-7-22.
//  Copyright (c) 2013年 Vincent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
@property (nonatomic, strong) NSString *login, *email, *name, *location, *company, *twitter, *bio, *website, *githubUrl, *avatarUrl, *tagline;
@property (nonatomic, assign) BOOL emailPublic;

+ (UIImage *) defaultAvatarImage;
+ (BOOL) authorize: (NSString *)login password: (NSString *)password;
+ (User *) currentUser;
+ (void) checkLogin;
+ (User *) initWithDictionary:(NSDictionary *)dict;

@end

//
//  User.h
//  RubyChina-for-IOS
//
//  Created by Vincent on 13-7-22.
//  Copyright (c) 2013年 Vincent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, strong) NSString *login, *email, *name, *bio, *avatarUrl;

+ (User *) currentUser;
+ (User *) initWithDictionary:(NSDictionary *)dict;

@end

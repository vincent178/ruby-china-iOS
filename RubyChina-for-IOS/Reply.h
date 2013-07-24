//
//  Reply.h
//  RubyChina-for-IOS
//
//  Created by Vincent on 13-7-24.
//  Copyright (c) 2013年 Vincent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Topic.h"

@interface Reply : NSObject

@property (nonatomic, strong) User *user;
@property (nonatomic, strong) NSString *body, *bodyHtml;
@property (nonatomic, strong) NSNumber *topicId;
@property (nonatomic, strong) NSNumber *ID;
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, strong) NSString *creatorAvatar;
@property (nonatomic, strong) NSString *creatorLogin;

+ (Reply *) initWithDictionary:(NSDictionary *)dict;
@end

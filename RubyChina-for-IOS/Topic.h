//
//  Topic.h
//  RubyChina-for-IOS
//
//  Created by Vincent on 13-7-23.
//  Copyright (c) 2013年 Vincent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"


@interface Topic : NSObject

@property (nonatomic, strong) NSNumber *ID;
@property (nonatomic, copy) NSString *title, *body, *bodyHtml, *nodeName, *lastReplyUserLogin;
@property (nonatomic, copy) NSNumber *repliesCount, *lastReplyUserId, *nodeId, *hits;
@property (nonatomic, strong) NSMutableArray *replies;
@property (nonatomic, strong) User *creator;
@property (nonatomic, strong) NSDate *repliedAt;
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, strong) NSString *creatorAvatar;
@property (nonatomic, strong) NSString *creatorLogin;

+(Topic *) initWithDictionary: (NSDictionary *)dict;

@end

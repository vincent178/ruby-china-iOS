//
//  Topic.h
//  RubyChina-for-IOS
//
//  Created by Vincent on 13-7-23.
//  Copyright (c) 2013年 Vincent. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

@interface Topic : NSObject

@property (nonatomic, strong) NSNumber *ID;
@property (nonatomic, copy) NSString *title, *body, *bodyHtml, *nodeName;
@property (nonatomic, copy) NSNumber *repliesCount, *nodeId;
@property (nonatomic, strong) NSMutableArray *replies;
@property (nonatomic, strong) User *creator;
@property (nonatomic, strong) NSDate *repliedAt, *createdAt;
@property (nonatomic, strong) NSString *creatorAvatar, *creatorLogin;

+ (Topic *) initWithDictionary: (NSDictionary *)dict;

@end

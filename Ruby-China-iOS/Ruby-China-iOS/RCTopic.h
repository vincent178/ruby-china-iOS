//
//  RCTopic.h
//  Ruby-China-iOS
//
//  Created by Liang Huang on 10/21/13.
//  Copyright (c) 2013 Vincent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@class RCUser;
@class RCNode;
@class RCReply;

@interface RCTopic : NSObject

@property (nonatomic, strong) RCUser *user;
@property (nonatomic, strong) RCNode *node;
@property (nonatomic, strong) NSMutableArray *replies;
@property (nonatomic, strong) NSString *title, *body, *bodyHtml, *nodeName, *lastReplyUserLogin;
@property (nonatomic, strong) NSNumber *repliesCount, *lastReplyUserId, *nodeId, *hits;
@property (nonatomic, strong) NSDate *repliedAt;

+ (void)findWithPage:(int)page perPage:(int)perPage async: (void (^)(NSArray *objects, NSError *error)) async;


@end

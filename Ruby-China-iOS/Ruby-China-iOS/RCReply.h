//
//  RCReply.h
//  Ruby-China-iOS
//
//  Created by Liang Huang on 10/21/13.
//  Copyright (c) 2013 Vincent. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RCUser;
@class RCTopic;

@interface RCReply : NSObject

@property (nonatomic, strong) RCUser *user;
@property (nonatomic, strong) NSString *body, *bodyHtml;
@property (nonatomic, strong) NSNumber *topicId;

@end

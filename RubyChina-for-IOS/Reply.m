//
//  Reply.m
//  RubyChina-for-IOS
//
//  Created by Vincent on 13-7-24.
//  Copyright (c) 2013年 Vincent. All rights reserved.
//

#import "Reply.h"
#import "User.h"
#import "Topic.h"

@implementation Reply
@synthesize user, topicId, body, bodyHtml, creatorAvatar, creatorLogin;

+ (Reply *) initWithDictionary:(NSDictionary *)obj {
    Reply *reply = [[Reply alloc] init];
    
    reply.ID = [obj objectForKey:@"id"];
    reply.bodyHtml = [obj objectForKey:@"body_html"];
    
    NSString *dateStr = [obj objectForKey:@"created_at"];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'+08:00'"];
    reply.createdAt = [dateFormatter dateFromString:dateStr];
    
    reply.creatorAvatar = [[obj objectForKey:@"user"] objectForKey:@"avatar_url"];
    reply.creatorLogin = [[obj objectForKey:@"user"] objectForKey:@"login"];
    
    return reply;
}

@end

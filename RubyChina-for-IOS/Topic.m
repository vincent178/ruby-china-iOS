//
//  Topic.m
//  RubyChina-for-IOS
//
//  Created by Vincent on 13-7-23.
//  Copyright (c) 2013年 Vincent. All rights reserved.
//

#import "Topic.h"
#import "User.h"

@implementation Topic

+ (Topic *) initWithDictionary: (NSDictionary *)obj {
    Topic *topic = [[Topic alloc] init];
    
    topic.ID           = [obj objectForKey:@"id"];
    topic.bodyHtml     = [obj objectForKey:@"body_html"];
    topic.title        = [obj objectForKey:@"title"];
    topic.repliesCount = [obj objectForKey:@"replies_count"];
    
    NSString *dateStr = [obj objectForKey:@"created_at"];
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    [dateFormater setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'+08:00'"];
    topic.createdAt = [dateFormater dateFromString:dateStr];
    
    topic.creatorAvatar = [[obj objectForKey:@"user"] objectForKey:@"avatar_url"];
    topic.creatorLogin  = [[obj objectForKey:@"user"] objectForKey:@"login"];
    
    return topic;
}
@end

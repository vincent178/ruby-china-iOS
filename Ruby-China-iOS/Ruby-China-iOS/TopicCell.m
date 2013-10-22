//
//  TopicCell.m
//  Ruby-China-iOS
//
//  Created by Liang Huang on 10/22/13.
//  Copyright (c) 2013 Vincent. All rights reserved.
//

#import "TopicCell.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"

@implementation TopicCell

- (void)setupWithTopic:(NSDictionary *)topic {
    
    // Avatar Image View
    avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5.0f, 15.0f, 35.0f, 35.0f)];
    CALayer * l = [avatarImageView layer];
    [l setMasksToBounds:YES];
    [l setCornerRadius:4.0];
    NSURL *url = [NSURL URLWithString:[[topic objectForKey:@"user"] objectForKey:@"avatar_url"]];
    [avatarImageView setImageWithURL:url];
    [self addSubview:avatarImageView];
    
    // User NickName Label
    NSString *userNickName = [[topic objectForKey:@"user"] objectForKey:@"login"];
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:13.0f]};
    CGSize userNickSize = [userNickName sizeWithAttributes:attributes];
    userNickNameLabel = [[UILabel alloc]
                         initWithFrame:CGRectMake(avatarImageView.frame.origin.x + avatarImageView.frame.size.width + 10, avatarImageView.frame.origin.y, userNickSize.width, 10.0f)];
    userNickNameLabel.text = userNickName;
    userNickNameLabel.font = [UIFont systemFontOfSize:13.0f];
    [userNickNameLabel sizeToFit];
    [self addSubview:userNickNameLabel];
    
    // Topic Created at
    NSString *rawDate = [topic objectForKey:@"created_at"];
    NSString *formatDate = [self setTimeFormat:rawDate];
    

}

- (NSString *)setTimeFormat:(NSString *)rawDate {
    NSString *result = nil;
    
    NSArray *components = [rawDate componentsSeparatedByString:@"T"];
    
    NSString *createdDateString = [components objectAtIndex:0];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSDate *createdDate = [dateFormatter dateFromString:createdDateString];
    
    NSDate *currentDate = [NSDate date];
    
    if ([currentDate isEqualToDate:createdDate]) {
        result = @"今天";
    } else {
        result = createdDateString;
    }
    
    return result;
}

@end

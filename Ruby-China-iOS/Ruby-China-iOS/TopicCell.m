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
#import "DateFormat.h"

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
    userNickNameLabel.font = [UIFont systemFontOfSize:11.0f];
    userNickNameLabel.textColor = [UIColor grayColor];
    [userNickNameLabel sizeToFit];
    [self addSubview:userNickNameLabel];
    
    // Topic Created at
    NSString *rawDate = [topic objectForKey:@"created_at"];
    DateFormat *formatter = [[DateFormat alloc] init];
    NSString *formatDate = [formatter setTimeFormat:rawDate];
    CGSize formatDateSize = [formatDate sizeWithAttributes:attributes];
    topicCreatedAtLabel = [[UILabel alloc]
                           initWithFrame:CGRectMake(userNickNameLabel.frame.origin.x + userNickNameLabel.frame.size.width + 5, avatarImageView.frame.origin.y, formatDateSize.width, 10.0f)];
    topicCreatedAtLabel.text = formatDate;
    topicCreatedAtLabel.font = [UIFont systemFontOfSize:11.0f];
    topicCreatedAtLabel.textColor = [UIColor grayColor];
    [topicCreatedAtLabel sizeToFit];
    [self addSubview:topicCreatedAtLabel];
    
    // Topic Title
    topicTitle = [[UILabel alloc]
                  initWithFrame:CGRectMake(userNickNameLabel.frame.origin.x, userNickNameLabel.frame.origin.y + userNickNameLabel.frame.size.height + 5.0f, 215.0f, 35.0f)];
    topicTitle.lineBreakMode = NSLineBreakByWordWrapping;
    topicTitle.numberOfLines = 2;
    topicTitle.text = [topic objectForKey:@"title"];
    topicTitle.font = [UIFont systemFontOfSize:13.0f];
    topicTitle.textAlignment = NSTextAlignmentLeft;
    [topicTitle sizeToFit];
    [self addSubview:topicTitle];
    
    // Verticle Line Split Topic info and Reply info
    UIView *verticleLine = [[UIView alloc] initWithFrame:CGRectMake(275.0f, 15.0f, 1, 50)];
    verticleLine.backgroundColor = [UIColor grayColor];
    verticleLine.alpha = 0.3f;
    [self addSubview:verticleLine];
    
    // Reply Dialog Picture
    replyImageView = [[UIImageView alloc] initWithFrame:CGRectMake(292.0f, 23.0f, 11.0f, 11.0f)];
    replyImageView.image = [UIImage imageNamed:@"reply.png"];
    [self addSubview:replyImageView];

    // Reply Count
    replyCountLabel = [[UILabel alloc]
                       initWithFrame:CGRectMake(verticleLine.frame.origin.x, 35.0f, self.frame.size.width - verticleLine.frame.origin.x, 20.0f)];
    replyCountLabel.font = [UIFont systemFontOfSize:16.0f];
    replyCountLabel.text = [[topic objectForKey:@"replies_count"] stringValue];
    replyCountLabel.textColor = [UIColor grayColor];
    replyCountLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:replyCountLabel];
}

@end

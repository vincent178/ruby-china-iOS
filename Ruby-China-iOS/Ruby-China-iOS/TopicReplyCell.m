//
//  TopicReplyCell.m
//  Ruby-China-iOS
//
//  Created by Liang Huang on 10/31/13.
//  Copyright (c) 2013 Vincent. All rights reserved.
//

#import "TopicReplyCell.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
#import "DateFormat.h"
#import "DTAttributedTextContentView.h"
#import "DTAttributedTextView.h"
#import "DTHTMLAttributedStringBuilder.h"
#import "DTCoreTextConstants.h"
#import "DTCSSStylesheet.h"
#import "DTLinkButton.h"

@implementation TopicReplyCell

- (void)setupWithTopicReply:(NSDictionary *)reply {
    // Setup all the content just like topic cell
    
    // Avatar Image View
    avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5.0f, 15.0f, 35.0f, 35.0f)];
    CALayer * l = [avatarImageView layer];
    [l setMasksToBounds:YES];
    [l setCornerRadius:4.0];
    NSURL *url = [NSURL URLWithString:[[reply objectForKey:@"user"] objectForKey:@"avatar_url"]];
    [avatarImageView setImageWithURL:url];
    [self addSubview:avatarImageView];
    
    // User NickName Label
    NSString *userNickName = [[reply objectForKey:@"user"] objectForKey:@"login"];
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:11.0f]};
    CGSize userNickSize = [userNickName sizeWithAttributes:attributes];
    userNickNameLabel = [[UILabel alloc]
                         initWithFrame:CGRectMake(avatarImageView.frame.origin.x + avatarImageView.frame.size.width + 10, avatarImageView.frame.origin.y, userNickSize.width, 10.0f)];
    userNickNameLabel.text = userNickName;
    userNickNameLabel.font = [UIFont systemFontOfSize:11.0f];
    userNickNameLabel.textColor = [UIColor grayColor];
    [userNickNameLabel sizeToFit];
    [self addSubview:userNickNameLabel];
    
    // Topic Created at
    NSLog(@"The reply content is: %@", reply);
    NSString *rawDate = [reply objectForKey:@"created_at"];
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
    
    NSString *rawHtml = [reply objectForKey:@"body_html"];
    
}

@end

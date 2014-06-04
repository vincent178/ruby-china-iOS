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
    NSString *rawDate = [reply objectForKey:@"created_at"];
    NSString *formatDate = [DateFormat setTimeFormat:rawDate];
    CGSize formatDateSize = [formatDate sizeWithAttributes:attributes];
    topicCreatedAtLabel = [[UILabel alloc]
                           initWithFrame:CGRectMake(userNickNameLabel.frame.origin.x + userNickNameLabel.frame.size.width + 5, avatarImageView.frame.origin.y, formatDateSize.width, 10.0f)];
    topicCreatedAtLabel.text = formatDate;
    topicCreatedAtLabel.font = [UIFont systemFontOfSize:11.0f];
    topicCreatedAtLabel.textColor = [UIColor grayColor];
    [topicCreatedAtLabel sizeToFit];
    [self addSubview:topicCreatedAtLabel];
    
    /* load reply content into NSData */
    NSString *rawHtml = [reply objectForKey:@"body_html"];
    NSString *handleHTML = [[rawHtml stringByReplacingOccurrencesOfString:@" " withString:@"&nbsp;"]
                            stringByReplacingOccurrencesOfString:@"\n" withString:@"<br />"];
    NSData *htmlData = [handleHTML dataUsingEncoding:NSUTF8StringEncoding];
    
    /* load css file
     * default_css.css */
    NSString *defaultCSSFilePath = [[NSBundle mainBundle] pathForResource:@"default_css" ofType:@"css"];
    NSString *defaultCSS = [NSString stringWithContentsOfFile:defaultCSSFilePath encoding:NSUTF8StringEncoding error:nil];
    DTCSSStylesheet *defaultDTCSSStylesheet = [[DTCSSStylesheet alloc] initWithStyleBlock:defaultCSS];
    NSDictionary *builderOptions = @{DTDefaultFontFamily: @"Helvetica",
                                     DTDefaultLinkDecoration: @"none",
                                     DTDefaultFontSize: @"12",
                                     DTDefaultStyleSheet: defaultDTCSSStylesheet};
    
    /* change html data into attributed string */
    DTHTMLAttributedStringBuilder *stringBuilder = [[DTHTMLAttributedStringBuilder alloc]
                                                    initWithHTML:htmlData options:builderOptions documentAttributes:nil];
    
    replyContentView = [[DTAttributedTextContentView alloc] initWithFrame:CGRectZero];
    replyContentView.attributedString = [stringBuilder generatedAttributedString];
    
    CGSize size = [replyContentView suggestedFrameSizeToFitEntireStringConstraintedToWidth:265.0f];
    replyContentView.frame = CGRectMake(userNickNameLabel.frame.origin.x, userNickNameLabel.frame.origin.y + userNickNameLabel.frame.size.height + 5, size.width, size.height);
    [self addSubview:replyContentView];
}

@end

//
//  TopicCellWithWebView.m
//  Ruby-China-iOS
//
//  Created by Liang Huang on 10/23/13.
//  Copyright (c) 2013 Vincent. All rights reserved.
//

#import "TopicDetailCell.h"
#import "UIImageView+WebCache.h"
#import "DateFormat.h"
#import "WebViewHelper.h"

@implementation TopicDetailCell

- (void)setupWithTopicDetail:(NSDictionary *)topicDetail {
    
    // Topic Title Label
    NSString *topicTitle = [topicDetail objectForKey:@"title"];
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:16.0f]};
    CGSize topicTitleSize = [topicTitle sizeWithAttributes:attributes];
    topicTitleLabel = [[UILabel alloc]
                         initWithFrame:CGRectMake(15.0f, 15.0f, 230.0f, topicTitleSize.height)];
    topicTitleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    topicTitleLabel.numberOfLines = 0;
    topicTitleLabel.text = topicTitle;
    topicTitleLabel.font = [UIFont boldSystemFontOfSize:16.0f];
    [topicTitleLabel sizeToFit];
    [self addSubview:topicTitleLabel];
    
    // Avatar Image View
    avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(270.0f, 15.0f, 35.0f, 35.0f)];
    CALayer * l = [avatarImageView layer];
    [l setMasksToBounds:YES];
    [l setCornerRadius:4.0];
    NSURL *url = [NSURL URLWithString:[[topicDetail objectForKey:@"user"] objectForKey:@"avatar_url"]];
    [avatarImageView setImageWithURL:url];
    [self addSubview:avatarImageView];
    
    // User NickName Label
    NSString *userNickName = [[topicDetail objectForKey:@"user"] objectForKey:@"login"];
    NSDictionary *attributesSmall = @{NSFontAttributeName: [UIFont systemFontOfSize:11.0f]};
    CGSize userNickSize = [userNickName sizeWithAttributes:attributesSmall];
    userNickNameLabel = [[UILabel alloc]
                         initWithFrame:CGRectMake(15.0f, topicTitleLabel.frame.origin.x + topicTitleLabel.frame.size.height + 5, userNickSize.width, 10.0f)];
    userNickNameLabel.text = userNickName;
    userNickNameLabel.font = [UIFont systemFontOfSize:11.0f];
    userNickNameLabel.textColor = [UIColor grayColor];
    [userNickNameLabel sizeToFit];
    [self addSubview:userNickNameLabel];
    
    // Topic Created at
    NSString *rawDate = [topicDetail objectForKey:@"created_at"];
    DateFormat *formatter = [[DateFormat alloc] init];
    NSString *formatDate = [formatter setTimeFormat:rawDate];
    CGSize formatDateSize = [formatDate sizeWithAttributes:attributesSmall];
    topicCreatedAtLabel = [[UILabel alloc]
                           initWithFrame:CGRectMake(userNickNameLabel.frame.origin.x + userNickNameLabel.frame.size.width + 2, userNickNameLabel.frame.origin.y, formatDateSize.width, 10.0f)];
    topicCreatedAtLabel.text = [NSString stringWithFormat:@"于%@发布", formatDate];
    topicCreatedAtLabel.font = [UIFont systemFontOfSize:11.0f];
    topicCreatedAtLabel.textColor = [UIColor grayColor];
    [topicCreatedAtLabel sizeToFit];
    [self addSubview:topicCreatedAtLabel];
    
    // Verticle Line Split Topic info and Reply info
    UIView *horizontalLine = [[UIView alloc] initWithFrame:CGRectMake(15.0f, userNickNameLabel.frame.origin.y + userNickNameLabel.frame.size.height + 5, 290.0f, 1)];
    horizontalLine.backgroundColor = [UIColor grayColor];
    horizontalLine.alpha = 0.3f;
    [self addSubview:horizontalLine];
    
    // Topic Detail Web View
    NSString *rawHtml = [topicDetail objectForKey:@"body_html"];
    NSLog(@"HTML is: %@", rawHtml);
//    NSData *htmlData = [rawHtml dataUsingEncoding:NSUTF8StringEncoding];
    
    // Load css file
//    NSString *defaultCSSFilePath = [[NSBundle mainBundle] pathForResource:@"default_css" ofType:@"css"];
//    NSString *defaultCSS = [NSString stringWithContentsOfFile:defaultCSSFilePath encoding:NSUTF8StringEncoding error:nil];
    
    topicDetailWebView = [[UIWebView alloc] init];
    topicDetailWebView.delegate = self;
    topicDetailWebView.frame = CGRectMake(15.0f, horizontalLine.frame.origin.y + 5, 290.0f, 1);
    [topicDetailWebView loadHTMLString:rawHtml baseURL:nil];
    [self addSubview:topicDetailWebView];
}

- (void)webViewDidFinishLoad:(UIWebView *)aWebView {
    
    aWebView.scrollView.scrollEnabled = NO;
    
    CGRect frame = aWebView.frame;
    frame.size.height = 1;
    aWebView.frame = frame;
    CGSize fittingSize = [aWebView sizeThatFits:CGSizeZero];
    frame.size = fittingSize;
    aWebView.frame = frame;
    self.cellHeight = frame.size.height;
    NSLog(@"height is %f", self.cellHeight);
    
    UIView *v = self;
    while (v && ![v isKindOfClass:[UITableView class]]) v = v.superview;
    UITableView *tableView = (UITableView *)v;
    
    [tableView beginUpdates];
    [tableView endUpdates];
}

@end

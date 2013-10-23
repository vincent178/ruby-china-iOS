//
//  TopicCellWithWebView.m
//  Ruby-China-iOS
//
//  Created by Liang Huang on 10/23/13.
//  Copyright (c) 2013 Vincent. All rights reserved.
//

#import "TopicCellWithWebView.h"
#import "UIImageView+WebCache.h"
#import "DateFormat.h"

@implementation TopicCellWithWebView

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
    
}

@end

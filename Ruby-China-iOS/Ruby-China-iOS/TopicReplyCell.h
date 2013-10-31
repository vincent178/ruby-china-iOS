//
//  TopicReplyCell.h
//  Ruby-China-iOS
//
//  Created by Liang Huang on 10/31/13.
//  Copyright (c) 2013 Vincent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopicReplyCell : UITableViewCell <UIWebViewDelegate> {
    UIImageView *avatarImageView;
    UIImageView *replyImageView;
    UILabel *userNickNameLabel;
    UILabel *topicCreatedAtLabel;
    UIWebView *replyWebView;
}

@property (nonatomic, assign) CGFloat replyHeight;

- (void)setupWithTopicReply:(NSDictionary *)topicDetail;

@end

//
//  TopicReplyCell.h
//  Ruby-China-iOS
//
//  Created by Liang Huang on 10/31/13.
//  Copyright (c) 2013 Vincent. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTAttributedTextView.h"
#import "DTAttributedTextContentView.h"

@interface TopicReplyCell : UITableViewCell <UIWebViewDelegate> {
    UIImageView *avatarImageView;
    UIImageView *replyImageView;
    UILabel *userNickNameLabel;
    UILabel *topicCreatedAtLabel;
}

@property (nonatomic, assign) CGFloat replyHeight;
@property (nonatomic, strong) DTAttributedTextContentView *replyContentView;

- (void)setupWithTopicReply:(NSDictionary *)reply;

@end

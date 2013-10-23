//
//  TopicCell.h
//  Ruby-China-iOS
//
//  Created by Liang Huang on 10/22/13.
//  Copyright (c) 2013 Vincent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopicCell : UITableViewCell {
    UIImageView *avatarImageView;
    UIImageView *replyImageView;
    UILabel *userNickNameLabel;
    UILabel *topicCreatedAtLabel;
    UILabel *topicTitle;
    UILabel *replyCountLabel;
}

- (void)setupWithTopic:(NSDictionary *)topic;

@end

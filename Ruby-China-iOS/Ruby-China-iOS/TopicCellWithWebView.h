//
//  TopicCellWithWebView.h
//  Ruby-China-iOS
//
//  Created by Liang Huang on 10/23/13.
//  Copyright (c) 2013 Vincent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopicCellWithWebView : UITableViewCell {
    UIImageView *avatarImageView;
    UIWebView *webContent;
    UILabel *userNickNameLabel;
    UILabel *topicCreatedAtLabel;
    UILabel *topicTitleLabel;
}

- (void)setupWithTopicDetail:(NSDictionary *)topicDetail;


@end

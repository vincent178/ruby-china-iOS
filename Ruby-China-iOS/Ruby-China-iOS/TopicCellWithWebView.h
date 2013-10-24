//
//  TopicCellWithWebView.h
//  Ruby-China-iOS
//
//  Created by Liang Huang on 10/23/13.
//  Copyright (c) 2013 Vincent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopicCellWithWebView : UITableViewCell <UIWebViewDelegate> {
    UIImageView *avatarImageView;
    UIWebView *topicDetailWebView;
    UILabel *userNickNameLabel;
    UILabel *topicCreatedAtLabel;
    UILabel *topicTitleLabel;
}

@property (nonatomic, assign) CGFloat webViewHeight;
@property (nonatomic, assign) CGFloat cellHeight;

- (void)setupWithTopicDetail:(NSDictionary *)topicDetail;

@end

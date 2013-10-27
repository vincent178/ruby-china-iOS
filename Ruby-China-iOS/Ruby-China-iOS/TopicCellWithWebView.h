//
//  TopicCellWithWebView.h
//  Ruby-China-iOS
//
//  Created by Liang Huang on 10/23/13.
//  Copyright (c) 2013 Vincent. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTAttributedTextView.h"

@interface TopicCellWithWebView : UITableViewCell <UIWebViewDelegate, DTAttributedTextContentViewDelegate> {
    UIImageView *avatarImageView;
    UIWebView *topicDetailWebView;
    UILabel *userNickNameLabel;
    UILabel *topicCreatedAtLabel;
    UILabel *topicTitleLabel;
}

@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, strong) UIWebView *webView;
@property (weak, nonatomic) IBOutlet DTAttributedTextView *textView;


- (void)setupWithTopicDetail:(NSDictionary *)topicDetail;

@end

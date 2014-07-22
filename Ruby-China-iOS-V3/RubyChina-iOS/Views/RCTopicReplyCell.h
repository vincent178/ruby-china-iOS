//
//  RCTopicReplyCell.h
//  RubyChina-iOS
//
//  Created by Liang Huang on 7/12/14.
//  Copyright (c) 2014 vincent178. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCTopicReplyCell : UITableViewCell <UIWebViewDelegate>

@property (nonatomic, strong) NSString *avatarURL;
@property (nonatomic, strong) NSString *replyBody;
@property (nonatomic, strong) NSNumber *replyID;
@property (nonatomic, strong) NSString *replyDateString;
@property (nonatomic, strong) NSNumber *userID;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, assign) NSInteger indexPathRow;

- (void)updateContent;

@end

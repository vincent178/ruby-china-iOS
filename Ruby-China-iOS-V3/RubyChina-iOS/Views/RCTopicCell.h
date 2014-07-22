//
//  RCTopicCell.h
//  RubyChina-iOS
//
//  Created by Liang Huang on 6/28/14.
//  Copyright (c) 2014 vincent178. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCTopicCell : UITableViewCell

@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat titleHeight;

@property (nonatomic, strong) NSString *avatarURL;
@property (nonatomic, strong) NSString *replyNumber;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *topicTitle;
@property (nonatomic, strong) NSString *nodeName;
@property (nonatomic, strong) NSString *lastRepliedDate;
@property (nonatomic, strong) NSString *lastRepliedUsername;

- (void)setup;

@end

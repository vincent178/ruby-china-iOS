//
//  RCTopicDetailCell.h
//  RubyChina-iOS
//
//  Created by Liang Huang on 7/12/14.
//  Copyright (c) 2014 vincent178. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCTopicDetailCell : UITableViewCell <UIWebViewDelegate>

@property (nonatomic, strong) NSString *createdDateString;
@property (nonatomic, strong) NSString *nodeName;
@property (nonatomic, strong) NSString *authorName;
@property (nonatomic, strong) NSString *topicDetailBody;
@property (nonatomic, strong) NSString *topicID;

- (void)setup;

@end

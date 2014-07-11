//
//  RCTopicDetail.h
//  RubyChina-iOS
//
//  Created by Liang Huang on 7/4/14.
//  Copyright (c) 2014 vincent178. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTAttributedTextContentView.h"

@protocol RCImageDelegate <NSObject>

- (void)didFinishDownloadImage;

@end

@interface RCTopicDetail : UITableViewCell <DTAttributedTextContentViewDelegate>

@property (nonatomic, weak) id<RCImageDelegate> delegate;


@property (nonatomic, assign) CGFloat cellHeight;

@property (nonatomic, strong) NSString *timeAgoString;
@property (nonatomic, strong) NSString *nodeName;
@property (nonatomic, strong) NSString *topicTitle;
@property (nonatomic, strong) NSString *topicHTMLString;
@property (nonatomic, strong) NSString *topicAuthor;


- (void)setup;

@end

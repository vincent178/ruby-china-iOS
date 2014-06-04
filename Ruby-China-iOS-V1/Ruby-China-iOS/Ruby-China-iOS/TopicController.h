//
//  TopicController.h
//  Ruby-China-iOS
//
//  Created by Liang Huang on 10/23/13.
//  Copyright (c) 2013 Vincent. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TopicDetailCell;
@class TopicReplyCell;

@interface TopicController : UITableViewController <UITableViewDataSource, UITableViewDelegate> {
    NSDictionary *topicDetail;
    NSArray *replies;
}

@property (nonatomic, strong) NSNumber *topicId;
@property (nonatomic, strong) TopicDetailCell *topicDetailCell;
@property (nonatomic, strong) TopicReplyCell *topicReplyCell;

@end

//
//  RCTopicDetailController1.h
//  RubyChina-iOS
//
//  Created by Liang Huang on 7/12/14.
//  Copyright (c) 2014 vincent178. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RCTopicTableView;

@interface RCTopicDetailController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, assign) NSInteger topicID;


@property (weak, nonatomic) IBOutlet RCTopicTableView *tableView;

@end

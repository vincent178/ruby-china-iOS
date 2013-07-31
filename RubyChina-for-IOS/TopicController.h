//
//  TopicController.h
//  RubyChina-for-IOS
//
//  Created by Vincent on 13-7-31.
//  Copyright (c) 2013年 Vincent. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Topic;

@interface TopicController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

{
    UIView *containerView;
}

@property (nonatomic, strong) Topic *topic;
@property (nonatomic, copy, readwrite) NSMutableArray *replies;

@end

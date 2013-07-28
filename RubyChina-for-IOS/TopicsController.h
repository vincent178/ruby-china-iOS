//
//  TopicsController.h
//  RubyChina-for-IOS
//
//  Created by Vincent on 13-7-28.
//  Copyright (c) 2013年 Vincent. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Node;

@interface TopicsController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, copy, readwrite) NSMutableArray *topics;
@property (nonatomic, copy) NSNumber *currentPage;
@property (nonatomic, strong) Node *node;

@end

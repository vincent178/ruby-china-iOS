//
//  RCTopicDetailController.h
//  RubyChina-iOS
//
//  Created by Liang Huang on 7/3/14.
//  Copyright (c) 2014 vincent178. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCTopicDetail.h"


@interface RCTopicDetailController : UIViewController <UITableViewDelegate, UITableViewDataSource>


@property (nonatomic, assign) NSInteger topicID;
@property (nonatomic, strong) NSString *topicTitle;
@property (nonatomic, strong) NSString *topicAuthor;

@property (weak, nonatomic) IBOutlet UITableView *tableView;


- (IBAction)replyButtonTapped:(id)sender;

@end

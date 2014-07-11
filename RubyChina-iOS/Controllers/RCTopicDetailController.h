//
//  RCTopicDetailController.h
//  RubyChina-iOS
//
//  Created by Liang Huang on 7/3/14.
//  Copyright (c) 2014 vincent178. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCTopicDetail.h"


@interface RCTopicDetailController : UIViewController <UITableViewDelegate, UITableViewDataSource, DTAttributedTextContentViewDelegate>


@property (nonatomic, assign) NSInteger topicID;



@property (nonatomic, strong) NSString *topicTitle;
@property (nonatomic, strong) NSString *topicAuthor;
@property (nonatomic, strong) NSString *authorPostedTimeAgo;
@property (nonatomic, strong) NSAttributedString *attributedTopicDetail;

@property (weak, nonatomic) IBOutlet UITableView *tableView;


- (IBAction)replyButtonTapped:(id)sender;

@end

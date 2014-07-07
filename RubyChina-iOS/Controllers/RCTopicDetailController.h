//
//  RCTopicDetailController.h
//  RubyChina-iOS
//
//  Created by Liang Huang on 7/3/14.
//  Copyright (c) 2014 vincent178. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCTopicDetailController : UIViewController <UITableViewDelegate, UITableViewDataSource>


@property (nonatomic, assign) NSInteger topicID;
@property (nonatomic, strong) NSString *topicTitle;





@property (weak, nonatomic) IBOutlet UITableView *tableView;




- (IBAction)replyButtonTapped:(id)sender;

@end

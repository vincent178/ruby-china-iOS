//
//  RCTopicDetailController1.m
//  RubyChina-iOS
//
//  Created by Liang Huang on 7/12/14.
//  Copyright (c) 2014 vincent178. All rights reserved.
//

#import "RCTopicDetailController.h"
#import "RCTopicDetailCell.h"
#import "RCTopicReplyCell.h"
#import "RCTopicTableView.h"

#import "RCAPIManager.h"

@interface RCTopicDetailController ()

@property (nonatomic, strong) NSDictionary *topicDetailData;
@property (nonatomic, strong) NSArray *topicRepliesData;
@end

@implementation RCTopicDetailController

- (void)setup {
    
    self.topicDetailData = [[NSDictionary alloc] init];
    self.topicRepliesData = [[NSArray alloc] init];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
    
    
    [self fetchTopicDetail];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)fetchTopicDetail {
    
    RCAPIManager *apiManager = [RCAPIManager shareAPIManager];
    [apiManager fetchTopicDetail:self.topicID withHandler:^(NSDictionary *topicDetail, NSError *error) {
        
        self.topicDetailData = topicDetail;
        self.topicRepliesData = topicDetail[@"replies"];

        [self.tableView reloadData];
    }];
}

#pragma mark UITableViewDataSource


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    return self.topicRepliesData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        static NSString *TopicDetailCellIdentifier = @"TopicDetailCellIdentifier";
        
        RCTopicDetailCell *topicDetailCell = [tableView dequeueReusableCellWithIdentifier:TopicDetailCellIdentifier];
        NSLog(@"dequeueReusableCellWithIdentifier");
        
        if (topicDetailCell == nil) {
            topicDetailCell = [[RCTopicDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TopicDetailCellIdentifier];
            NSLog(@"initWithStyle");
        }
        
        topicDetailCell.createdDateString = self.topicDetailData[@"created_at"];
        NSLog(@"topicDetailCell.createdDateString: %@", topicDetailCell.createdDateString);
        
        topicDetailCell.nodeName = self.topicDetailData[@"node_name"];
        NSLog(@"topicDetailCell.nodeName: %@", topicDetailCell.nodeName);
        
        topicDetailCell.authorName = self.topicAuthorName;
        NSLog(@"topicDetailCell.authorName: %@", topicDetailCell.authorName);
        
        topicDetailCell.topicTitle = self.topicTitle;
        NSLog(@"topicDetailCell.topicTitle: %@", topicDetailCell.topicTitle);
        
        topicDetailCell.topicDetailBody = self.topicDetailData[@"body_html"];
        topicDetailCell.topicID = [NSString stringWithFormat:@"%ld", (long)self.topicID ];
        
       [topicDetailCell setup];
            
        
        return topicDetailCell;
        
        
    } else if(indexPath.section == 1) {
        
        static NSString *TopicReplyCellIdentifier = @"TopicReplyCellIdentifier";
        
        RCTopicReplyCell *topicReplyCell = [tableView dequeueReusableCellWithIdentifier:TopicReplyCellIdentifier];
        
        if (topicReplyCell == nil) {
            topicReplyCell = [[RCTopicReplyCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TopicReplyCellIdentifier];
        }
        
        NSDictionary *topicReplyData = self.topicRepliesData[indexPath.row];
        
        
        topicReplyCell.replyBody = topicReplyData[@"body_html"];
        topicReplyCell.replyID = topicReplyData[@"id"];
        topicReplyCell.replyDateString = topicReplyData[@"created_at"];
        topicReplyCell.avatarURL = topicReplyData[@"user"][@"avatar_url"];
        topicReplyCell.username = topicReplyData[@"user"][@"login"];
        topicReplyCell.userID = topicReplyData[@"user"][@"id"];
        topicReplyCell.indexPathRow = indexPath.row;
        
        [topicReplyCell updateContent];
        
        return topicReplyCell;
    }
    
    return nil;
}

#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        return self.tableView.topicDetailHeight;
    }
    
    if (indexPath.section == 1) {
        
//        if (self.tableView.topicReplyHeights.count > 0) {
//            NSLog(@"cellHeight: %f", [self.tableView.topicReplyHeights[indexPath.row] floatValue]);
//            return [self.tableView.topicReplyHeights[indexPath.row] floatValue];
//        }
        
        if (indexPath.row >= self.tableView.topicReplyHeights.count) {
            for (int i = 0; i < 10; i++) {
                [self.tableView.topicReplyHeights addObject:[NSNull null]];
            }
        }
        
        if ([self.tableView.topicReplyHeights[indexPath.row] respondsToSelector:@selector(floatValue)]) {
            NSLog(@"cellHeight: %f", [self.tableView.topicReplyHeights[indexPath.row] floatValue]);
            return [self.tableView.topicReplyHeights[indexPath.row] floatValue];
        }
    }
    
    return 44;
}


@end

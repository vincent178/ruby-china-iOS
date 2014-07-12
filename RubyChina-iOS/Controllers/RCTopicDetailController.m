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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.topicDetailData = [[NSDictionary alloc] init];
    
    [self getTopicDetail];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)getTopicDetail {
    
    RCAPIManager *apiManager = [RCAPIManager shareAPIManager];
    [apiManager fetchTopicDetail:self.topicID withHandler:^(NSDictionary *topicDetail, NSError *error) {
        
        self.topicDetailData = topicDetail;
        
        
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
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        RCTopicDetailCell *topicDetailCell = [tableView dequeueReusableCellWithIdentifier:nil];
        
        if (topicDetailCell == nil) {
            topicDetailCell = [[RCTopicDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        }
        
        if (self.topicDetailData && self.topicDetailData.count > 0) {
            topicDetailCell.topicDetailBody = self.topicDetailData[@"body_html"];
            topicDetailCell.topicID = [NSString stringWithFormat:@"%ld", (long)self.topicID ];
            
            [topicDetailCell setup];
        }

        
        return topicDetailCell;
        
        
    } else if(indexPath.section == 1) {
        
        static NSString *identifier = @"TopicReplyCellIdentifier";
        
        RCTopicDetailCell *topicDetailCell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (topicDetailCell == nil) {
            topicDetailCell = [[RCTopicDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            
        } else {
            
            while ([topicDetailCell.contentView.subviews lastObject] != nil) {
                [(UIView *)[topicDetailCell.contentView.subviews lastObject] removeFromSuperview];
            }
        }
        
        if (self.topicDetailData && self.topicDetailData.count > 0) {
            topicDetailCell.topicDetailBody = self.topicDetailData[@"body_html"];
            topicDetailCell.topicID = [NSString stringWithFormat:@"%ld", (long)self.topicID ];
            
            [topicDetailCell setup];
        }
        
        
        return topicDetailCell;
    
    }
    
    return nil;
}

#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    if (indexPath.section == 0) {
    
        return self.tableView.topicDetailHeight;
//    }
    
//    return 44;
}


@end

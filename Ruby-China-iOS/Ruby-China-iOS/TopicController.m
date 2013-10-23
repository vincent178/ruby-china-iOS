//
//  TopicController.m
//  Ruby-China-iOS
//
//  Created by Liang Huang on 10/23/13.
//  Copyright (c) 2013 Vincent. All rights reserved.
//

#import "TopicController.h"
#import "AFNetworking.h"
#import "TopicCellWithWebView.h"

@implementation TopicController {
    NSDictionary *topicDetail;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSLog(@"%@", self.topicId);
    
    [self refresh];
}

- (void)refresh {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *url = [NSString stringWithFormat:@"http://ruby-china.org/api/v2/topics/%@.json", self.topicId];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        topicDetail = responseObject;
        [self.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ((section == 0) ? 1 : 3);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        TopicCellWithWebView *topicDetailCell = [[TopicCellWithWebView alloc] init];
        [topicDetailCell setupWithTopicDetail:topicDetail];
        return topicDetailCell;
    } else if (indexPath.section == 1) {
        
        static NSString *CellIdentifier = @"TopicsCell";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        
        cell.textLabel.text = [NSString stringWithFormat:@"%d", indexPath.row];
        return cell;
    }
    
    return nil;
}

@end

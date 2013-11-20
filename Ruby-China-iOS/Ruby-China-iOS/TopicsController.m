//
//  TopicsController.m
//  Ruby-China-iOS
//
//  Created by Vincent on 13-10-12.
//  Copyright (c) 2013年 Vincent. All rights reserved.
//

#import "TopicsController.h"
#import "AFNetworking.h"
#import "TopicCell.h"
#import "NewTopicController.h"
#import "TopicController.h"

@interface TopicsController ()

@end

@implementation TopicsController

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}



- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.navigationItem.title = @"Ruby China";
    
    // Navigation Bar Item Button
    UIBarButtonItem *newTopicButton = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemCompose
                                       target:self action:@selector(newTopicButtonClicked)];
    self.navigationItem.rightBarButtonItem = newTopicButton;

    [self refresh];
}

- (void)refresh {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *url = @"http://ruby-china.org/api/v2/topics.json";
    NSDictionary *params = @{@"page": @1, @"per_page": @10};
    [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        topics = responseObject;
        
        [self.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"TopicsController is %@", error);
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [topics count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *CellIdentifier = @"TopicsCell";
    
    TopicCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[TopicCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    [cell setupWithTopic:[topics objectAtIndex:indexPath.row]];
    
    return cell;
}

#pragma mark -
#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   
    TopicController *topicController = [[TopicController alloc] init];
    topicController.topicId = [[topics objectAtIndex:indexPath.row] objectForKey:@"id"];
    [self.navigationController pushViewController: topicController animated:YES];
}


#pragma mark -
#pragma mark - Table view navigation

- (void)newTopicButtonClicked {
    NewTopicController *newTopicController = [[NewTopicController alloc] init];
    [self.navigationController pushViewController:newTopicController animated:YES];
}

@end

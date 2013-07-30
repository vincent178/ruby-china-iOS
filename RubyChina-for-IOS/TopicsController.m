//
//  TopicsController.m
//  RubyChina-for-IOS
//
//  Created by Vincent on 13-7-28.
//  Copyright (c) 2013年 Vincent. All rights reserved.
//

#import "TopicsController.h"
#import "Node.h"
#import "RemoteEngine.h"
#import "TopicsCell.h"
#import "TopicController.h"
#import "Topic.h"

@interface TopicsController ()

@end

@implementation TopicsController

- (void) setTopics:(NSMutableArray *)topics {
    if (_topics != topics) _topics = [topics mutableCopy];
    [self.tableView reloadData];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"社区";
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self getRemoteData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (void)getRemoteData {
    RemoteEngine *remoteEngine = [[RemoteEngine alloc] initWithHostName:BaseAPIURL];
    [remoteEngine getTopicsWithPage:1 conCompletion:^(MKNetworkOperation *completedOperation) {
        NSMutableArray *response = [completedOperation responseJSON];
        [self setTopics:response];
    } onError:^(MKNetworkOperation *completedOperation, NSError *error) {
        self.topics = nil;
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSLog(@"%d", self.topics.count);
    return self.topics.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    TopicsCell *cell = (TopicsCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[TopicsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *cellContent = [self.topics objectAtIndex:indexPath.row];
    [cell setTopicsCell:cellContent];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Get string data
    NSDictionary *cellContent = [self.topics objectAtIndex:indexPath.row];
    NSString *topicTitle = [cellContent objectForKey:@"title"];
    
    // Make Height Dynamic
    CGSize maximumLabelSize = CGSizeMake(260, FLT_MAX);
    CGSize expectedLabelSize = [topicTitle sizeWithFont:[UIFont systemFontOfSize:13.0f]
                                           constrainedToSize:maximumLabelSize
                                               lineBreakMode:NSLineBreakByWordWrapping];
    return 40 + expectedLabelSize.height;
}

#pragma mark - Table view delegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Topic *topic = [self.topics objectAtIndex:indexPath.row];
    TopicController *topicController = [[TopicController alloc] init];
    topicController.topic = topic;
    [self.navigationController pushViewController:topicController animated:YES];
}

@end

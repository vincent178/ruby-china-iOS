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
#import <SVPullToRefresh.h>

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
    
    if (!self.topics) {
        [self getRemoteData:[NSNumber numberWithInt:1]];
    }
    
    self.currentPage = [NSNumber numberWithInt:1];
    NSLog(@"%@", self.currentPage);
    
    // Avoid retain cycle
    __weak TopicsController *weakSelf = self;
    
    [self.tableView addPullToRefreshWithActionHandler:^{
        
        // Use GCD to execute async task
        double delayInSeconds = 2.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [weakSelf getRemoteData:[NSNumber numberWithInt:1]];
            [weakSelf.tableView.pullToRefreshView stopAnimating];
        });
    }];
    
    [self.tableView addInfiniteScrollingWithActionHandler:^{
        
        // Use GCD to execute async task
        double delayInSeconds = 2.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [weakSelf getRemoteData:[NSNumber numberWithInt:[weakSelf.currentPage intValue] + 1]];
            [weakSelf.tableView.infiniteScrollingView stopAnimating];
            weakSelf.currentPage = [NSNumber numberWithInt:[weakSelf.currentPage intValue] + 1];
        });
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (void)getRemoteData:(NSNumber *)pageNumber {
    RemoteEngine *remoteEngine = [[RemoteEngine alloc] initWithHostName:BaseAPIURL];
    [remoteEngine getTopicsWithPage:[pageNumber intValue] conCompletion:^(MKNetworkOperation *completedOperation) {
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
    return self.topics.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"topicsCell";
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
    CGSize expectedLabelSize = [topicTitle sizeWithFont:MiddleFont
                                           constrainedToSize:maximumLabelSize
                                               lineBreakMode:NSLineBreakByWordWrapping];
    return 40 + expectedLabelSize.height;
}

//- (void)setTitle:(NSString *)title forState:(SVPullToRefreshState)state {
//    if (state == SVPullToRefreshStateAll) {
//        self.title = @"yes";
//    }
//    [self.tableView setNeedsDisplay];
//}

#pragma mark - Table view delegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Topic *topic = [self.topics objectAtIndex:indexPath.row];
    TopicController *topicController = [[TopicController alloc] init];
    topicController.topic = topic;
    [self.navigationController pushViewController:topicController animated:YES];
}

@end

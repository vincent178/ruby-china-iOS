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
#import "SVProgressHUD.h"
#import "SVPullToRefresh.h"
#import "SWRevealViewController.h"

@interface TopicsController ()

@end

@implementation TopicsController {
    int currentPageNumber;
}

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}



- (void)viewDidLoad {
    
    [super viewDidLoad];
    currentPageNumber = 1;
    self.navigationItem.title = @"活跃帖子";
    
    
    // Navigation Bar Item Button
    UIBarButtonItem *newTopicButton = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemCompose
                                       target:self action:@selector(newTopicButtonClicked)];
    
    UIBarButtonItem *sideBarButton  = [[UIBarButtonItem alloc]
                                       initWithImage:[UIImage imageNamed:@"align_justify.png"]
                                       style:UIBarButtonItemStylePlain
                                       target:self action:@selector(sideBarButtonClicked)];
                                       
    self.navigationItem.leftBarButtonItem  = sideBarButton;
    self.navigationItem.rightBarButtonItem = newTopicButton;
    
    // Handle Gesture in revealController
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    // Setup basic data
    [SVProgressHUD show];
    [self fetchBasicData];
    [SVProgressHUD dismiss];
    
    
    __weak TopicsController *weakSelf = self;
    
    // setup pull-to-refresh
    [self.tableView addPullToRefreshWithActionHandler:^{
        [weakSelf fetchBasicData];
    }];
    
    // setup infinite scrolling
    [self.tableView addInfiniteScrollingWithActionHandler:^{
        [weakSelf insertRowAtBottom];
    }];
    
}


- (void)insertRowAtBottom {
    __weak TopicsController *weakSelf = self;
    
    currentPageNumber += 1;
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *url = @"http://ruby-china.org/api/v2/topics.json";
    NSDictionary *params = @{@"page": [NSNumber numberWithInt:(currentPageNumber+1)], @"per_page": @20};
    [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        [weakSelf.tableView beginUpdates];
        
        int oldTopicsNumber = [topics count];
        NSArray *oldArray = [topics copy];
        NSArray *moreTopics = responseObject;
        NSIndexSet *indexs = [[NSIndexSet alloc]
                              initWithIndexesInRange:NSMakeRange(oldTopicsNumber, 20)];
        
        NSLog(@"old topics are %d", oldTopicsNumber);
        NSLog(@"more topics are %d", moreTopics.count);
        
        NSLog(@"index set are %@", indexs);
        
        [topics insertObjects:moreTopics atIndexes:indexs];
        NSLog(@"topics are %d", topics.count);
        
        NSArray *paths = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:[oldArray count]-1 inSection:0]];
        NSLog(@"paths is %@", paths);
        
        [weakSelf.tableView insertRowsAtIndexPaths:paths
                                  withRowAnimation:UITableViewRowAnimationTop];
        
        [weakSelf.tableView endUpdates];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"TopicsController is %@", error);
    }];
    
   
    [weakSelf.tableView.infiniteScrollingView stopAnimating];
}


- (void)fetchBasicData {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *url = @"http://ruby-china.org/api/v2/topics.json";
    NSDictionary *params = @{@"page": @1, @"per_page": @20};
    [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        topics = [[NSMutableArray alloc] initWithArray:responseObject];
        
        [self.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"TopicsController is %@", error);
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)backButtonPressed {
    [self.navigationController popViewControllerAnimated:YES];
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

- (void)sideBarButtonClicked {
    NSLog(@"side bar button clicked");
}


@end



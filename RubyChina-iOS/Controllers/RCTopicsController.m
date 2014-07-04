//
//  RCTopicsController.m
//  RubyChina-iOS
//
//  Created by Liang Huang on 6/28/14.
//  Copyright (c) 2014 vincent178. All rights reserved.
//

// View Controllers
#import "RCTopicsController.h"
#import "RCLoadingController.h"

// Views
#import "RCPaginationView.h"
#import "RCTopicCell.h"

// Data Service
#import "RCAPIManager.h"

// Helpers
#import "NSString+DynamicHeight.h"



@interface RCTopicsController ()

@property (nonatomic, strong) NSMutableArray *topics;
@property (nonatomic, strong) NSMutableArray *heights;

@property (nonatomic, strong) RCLoadingController *loadingController;

@end

@implementation RCTopicsController



#pragma mark -
#pragma mark - View LifeCycle

- (void)setup {
    
    self.heights = [[NSMutableArray alloc] init];
    self.topics = [[NSMutableArray alloc] init];
    
    
    self.paginationView.minPageNumber = 1;
    self.paginationView.maxPageNumber = 100;
    self.paginationView.selectedBackgroundImage = [UIImage imageNamed:@"pagination_selected.png"];
    [self.paginationView reloadData];
    
    self.loadingController = [self.storyboard instantiateViewControllerWithIdentifier:@"LoadingController"];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
    
    [self prepareForLoadingData];
    [self getTopics];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark - IBAction

- (IBAction)previousTapped:(id)sender {
    NSLog(@"RCTopicsController #previousTapped: ");
    if (self.paginationView.currentIndex > 1) {
        [self.paginationView selectIndex:self.paginationView.currentIndex-1];
        [self prepareForLoadingData];
        [self getTopics];
    }
}

- (IBAction)nextTapped:(id)sender {
    NSLog(@"RCTopicsController #nextTapped: ");
    if (self.paginationView.currentIndex < 99) {
        [self.paginationView selectIndex:self.paginationView.currentIndex+1];
        [self prepareForLoadingData];
        [self getTopics];
    }
}

#pragma mark -
#pragma mark - Data Service

- (void)prepareForLoadingData {
    
    [self addChildViewController:self.loadingController];
    [self.view addSubview:self.loadingController.view];
    [self.loadingController start];
    
}

- (void)didLoadedData {
    
    [self.loadingController dismiss];
    [self.loadingController.view removeFromSuperview];
    [self.loadingController removeFromParentViewController];
    
    [self.tableView scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:YES];
}

- (void)getTopics {
    
    RCAPIManager *apiManager = [RCAPIManager shareAPIManager];
    
    [apiManager fetchTopicsListPageNumber:self.paginationView.currentIndex
                              withPerPage:15
                                 withType:@"default"
                              withHandler:^(NSArray *resultsArray, NSError *error) {
                                  
                                  [self.topics removeAllObjects];
                                  [self.topics addObjectsFromArray:resultsArray];
                                  
                                  [self.heights removeAllObjects];
                                  for (NSDictionary *topic in self.topics) {
                                      NSLog(@"topic title: %@", topic[@"title"]);
                                      UIFont *font = [UIFont fontWithName:@"Helvetica Neue" size:14];
                                      CGSize size = [(NSString *)topic[@"title"] sizeOfMultiLineLabelwithWidth:302.5 font:font];
                                      [self.heights addObject:@(size.height)];
                                  }
                                  
                                  [self.tableView reloadData];
                                  [self didLoadedData];
                                  
                              }];
    
}

#pragma mark -
#pragma mark - TableView Data Source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.topics.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"TopicCell";
    RCTopicCell *topicCell = [[RCTopicCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
    if (!topicCell) {
        topicCell = [[RCTopicCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    //TODO: setup topic cell
    NSDictionary *topic = [[NSDictionary alloc] init];
    topic = self.topics[indexPath.row];
    
    CGFloat height = [self.heights[indexPath.row] floatValue];
    topicCell.titleHeight = height;
    topicCell.size= CGSizeMake(320, height + 105.5 - 35);
    
    topicCell.replyNumber =[topic[@"replies_count"] stringValue];
    topicCell.username = topic[@"user"][@"login"];
    topicCell.topicTitle = topic[@"title"];
    
    [topicCell setup];
    
    return topicCell;
}

#pragma mark -
#pragma mark - TableView Delegate


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat height = [self.heights[indexPath.row] floatValue];
    
    return height + 70.5;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self performSegueWithIdentifier:@"YourSegueIdentifier" sender:nil];
}

#pragma mark -
#pragma mark - Segue

- (void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    UIViewController *topicDetailController = [self.storyboard instantiateViewControllerWithIdentifier:@"TopicDetailController"];
    [self.navigationController pushViewController:topicDetailController animated:YES];
}



@end

//
//  RCTopicsController.m
//  RubyChina-iOS
//
//  Created by Liang Huang on 6/28/14.
//  Copyright (c) 2014 vincent178. All rights reserved.
//

#import "RCTopicsController.h"
#import "RCPaginationView.h"
#import "RCTopicCell.h"

#import "RCAPIManager.h"


#import "NSString+DynamicHeight.h"



@interface RCTopicsController ()

@property (nonatomic, strong) NSMutableArray *topics;
@property (nonatomic, strong) NSMutableArray *heights;
@property (nonatomic, assign) NSInteger currentPage;

@end

@implementation RCTopicsController

#pragma mark -
#pragma mark - Data Service

//TODO: prepare data for table view cell

- (void)getTopics {
    
    RCAPIManager *apiManager = [RCAPIManager shareAPIManager];
    
    [apiManager fetchTopicsListPageNumber:1
                              withPerPage:15
                                 withType:@"default"
                              withHandler:^(NSArray *resultsArray, NSError *error) {
                                  
                                  [self.topics addObjectsFromArray:resultsArray];
                                  for (NSDictionary *topic in self.topics) {
                                      NSLog(@"topic title: %@", topic[@"title"]);
                                      UIFont *font = [UIFont fontWithName:@"Helvetica Neue" size:14];
                                      CGSize size = [(NSString *)topic[@"title"] sizeOfMultiLineLabelwithWidth:302.5 font:font];
                                      [self.heights addObject:@(size.height)];
                                  }
                                  
                                  NSLog(@"self.heights: %@", self.heights);
                                  
                                  [self.tableView reloadData];
    }];
    
}

#pragma mark -
#pragma mark - View LifeCycle

- (void)setup {
    
    self.heights = [[NSMutableArray alloc] init];
    self.topics = [[NSMutableArray alloc] init];
    self.currentPage = 1;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
    
    self.paginationView.minPageNumber = 1;
    self.paginationView.maxPageNumber = 100;
    self.paginationView.selectedBackgroundImage = [UIImage imageNamed:@"pagination_selected.png"];
    [self.paginationView reloadData];
    
    [self getTopics];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark - IBAction

- (IBAction)previousTapped:(id)sender {
    NSLog(@"RCTopicsController #previousTapped: ");
    [self.paginationView selectIndex:self.paginationView.currentIndex-1];
}

- (IBAction)nextTapped:(id)sender {
    NSLog(@"RCTopicsController #nextTapped: ");
    [self.paginationView selectIndex:self.paginationView.currentIndex+1];
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
    
    NSLog(@"RCTopicsController #topic.Cell.frame: %@", NSStringFromCGRect(topicCell.frame));
    
    return topicCell;
}

#pragma mark -
#pragma mark - TableView Delegate


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat height = [self.heights[indexPath.row] floatValue];
    
    return height + 70.5;
}

@end

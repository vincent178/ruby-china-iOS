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

@interface RCTopicsController ()

@property (nonatomic, strong) NSArray *topics;

@end

@implementation RCTopicsController

#pragma mark -
#pragma mark - View LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.paginationView.minPageNumber = 1;
    self.paginationView.maxPageNumber = 100;
    self.paginationView.selectedBackgroundImage = [UIImage imageNamed:@"pagination_selected.png"];
    [self.paginationView reloadData];
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
    
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"TopicCell";
    RCTopicCell *topicCell = [[RCTopicCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
    if (!topicCell) {
        topicCell = [[RCTopicCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    CGSize size = CGSizeMake(320, 105.5);
    topicCell.size = size;
    
    [topicCell setup];
    
    NSLog(@"RCTopicsController #topic.Cell.frame: %@", NSStringFromCGRect(topicCell.frame));
    
    return topicCell;
}

#pragma mark -
#pragma mark - TableView Delegate


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 105.5;
}

@end

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
    NSLog(@"previousTapped: ");
    [self.paginationView selectIndex:self.paginationView.currentIndex-1];
}

- (IBAction)nextTapped:(id)sender {
    NSLog(@"nextTapped: ");
    [self.paginationView selectIndex:self.paginationView.currentIndex+1];
}

#pragma mark -
#pragma mark - TableView Data Source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    RCTopicCell *topicCell = [[RCTopicCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    return topicCell;
}

#pragma mark -
#pragma mark - TableView Delegate

@end

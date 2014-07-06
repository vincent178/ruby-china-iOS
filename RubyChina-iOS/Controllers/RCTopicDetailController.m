//
//  RCTopicDetailController.m
//  RubyChina-iOS
//
//  Created by Liang Huang on 7/3/14.
//  Copyright (c) 2014 vincent178. All rights reserved.
//

#import "RCTopicDetailController.h"
#import "RCLoadingController.h"

#import "RCAPIManager.h"

#import "RCTopicDetail.h"
#import "RCReplyCell.h"

@interface RCTopicDetailController ()

@property (nonatomic, strong) RCLoadingController *loadingController;

@end

@implementation RCTopicDetailController

#pragma mark -
#pragma mark - View Life Cycle


- (void)setup {
    
    // Left NavigationBar Button
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back.png"] style:UIBarButtonItemStylePlain target:self action:@selector(returnBack)];
    self.navigationItem.leftBarButtonItem = backButton;
    
    
    // Right NavigationBar Button
    UIBarButtonItem *shareButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(shareTo)];
    self.navigationItem.rightBarButtonItem = shareButton;
    
    self.loadingController = [[RCLoadingController alloc] init];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
    
    [self prepareForLoadingData];
    
    [self getTopicDetail];
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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

- (void)getTopicDetail {
    
    RCAPIManager *apiManager = [RCAPIManager shareAPIManager];
    [apiManager fetchTopicDetail:self.topicID withHandler:^(NSArray *topicDetail, NSError *error) {
        
        
        
        
    }];
}

#pragma mark -
#pragma mark - IBAction

- (void)shareTo {
    NSLog(@"shareTo: ");
}

- (void)returnBack {
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)replyButtonTapped:(id)sender {
    
    NSLog(@"replyButtonTapped");
    
}

#pragma mark - 
#pragma mark - UITableView DataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        return 1;
    } else {
        return 10;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell;
    
    
    if (indexPath.section == 0) {
        cell = [[RCTopicDetail alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    } else {
        static NSString *identifier = @"ReplyCell";
        
        cell = [[RCReplyCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    return cell;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

#pragma mark - 
#pragma mark - UITableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 176.5;
    }
    
    return 110;
}

@end

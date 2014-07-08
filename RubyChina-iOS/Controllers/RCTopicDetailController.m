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

#import "RCNodesList.h"


#import "RCTopicDetail.h"
#import "RCReplyCell.h"

#import "NSDate+DateTools.h"

@interface RCTopicDetailController ()

@property (nonatomic, strong) RCLoadingController *loadingController;
@property (nonatomic, strong) NSDateFormatter *dateFormatter;

@property (nonatomic, strong) RCNodesList *nodesList;

@property (nonatomic, strong) NSDictionary *topicDetailInfo;

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
    
    // Add Loading Controller
    self.loadingController = [self.storyboard instantiateViewControllerWithIdentifier:@"LoadingController"];
    
    
    // NSDateFormatter 
    self.dateFormatter = [[NSDateFormatter alloc] init];
    self.dateFormatter.dateFormat = @"yyyy'-'MM'-'dd'T'HH':'mm':'ss.SSSZZZ";
    
    
    // RCNodesList
    self.nodesList = [[RCNodesList alloc] init];
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
    [apiManager fetchTopicDetail:self.topicID withHandler:^(NSDictionary *topicDetail, NSError *error) {
        
        
        NSLog(@"topicDetail: %@", topicDetail);
        self.topicDetailInfo = [[NSDictionary alloc] init];
        self.topicDetailInfo = topicDetail;
        
        [self.tableView reloadData];
        
        [self didLoadedData];
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
    
    static NSString *identifier = @"ReplyCell";
    
    if (indexPath.section == 0) {
        
        RCTopicDetail *topicDetailCell = [[RCTopicDetail alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        
        // time ago string
        NSString *createdDateString = self.topicDetailInfo[@"created_at"];
        NSDate *createdDate = [[NSDate alloc] init];
        createdDate = [self.dateFormatter dateFromString:createdDateString];
        topicDetailCell.timeAgoString = [createdDate timeAgoSinceNow];
        NSLog(@"topicDetailCell.timeAgoString: %@", topicDetailCell.timeAgoString);
        
        
        // category name
        NSString *nodeName = self.topicDetailInfo[@"node_name"];
        topicDetailCell.nodeName = nodeName;
        NSLog(@"topicDetailCell.nodeName: %@", topicDetailCell.nodeName);
        
        
        // topic title
        topicDetailCell.topicTitle = self.topicTitle;
        NSLog(@"topicDetailCell.topicTitle: %@", topicDetailCell.topicTitle);
        
        
        // topic body html string
        NSString *topicHTMLString = self.topicDetailInfo[@"body_html"];
        topicDetailCell.topicHTMLString = topicHTMLString;
        NSLog(@"topicDetailCell.topicHTMLString: %@", topicDetailCell.topicHTMLString);
        
        
        // topic author
        topicDetailCell.topicAuthor = self.topicAuthor;
        NSLog(@"topicDetailCell.topicAuthor: %@", topicDetailCell.topicAuthor);
        
        [topicDetailCell setup];
        
        topicDetailCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return topicDetailCell;
        
    } else {
        
        RCReplyCell *replyCell = [[RCReplyCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        
        return replyCell;
    }
    
    return nil;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

#pragma mark - 
#pragma mark - UITableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 1000;
    }
    
    return 110;
}

@end

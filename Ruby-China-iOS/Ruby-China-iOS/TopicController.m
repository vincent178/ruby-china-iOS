//
//  TopicController.m
//  Ruby-China-iOS
//
//  Created by Liang Huang on 10/23/13.
//  Copyright (c) 2013 Vincent. All rights reserved.
//

#import "TopicController.h"
#import "AFNetworking.h"
#import "TopicCellWithWebView.h"
#import "WebViewHelper.h"
#import "DTHTMLAttributedStringBuilder.h"

@implementation TopicController 

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self refresh];
}

- (void)refresh {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *url = [NSString stringWithFormat:@"http://ruby-china.org/api/v2/topics/%@.json", self.topicId];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        topicDetail = responseObject;
        replies = [topicDetail objectForKey:@"replies"];
        
        [self.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ((section == 0) ? 1 : [replies count]);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        self.topicDetailCell = [[TopicCellWithWebView alloc] init];
        [self.topicDetailCell setupWithTopicDetail:topicDetail];
        
        return self.topicDetailCell;
    } else if (indexPath.section == 1) {
        
        static NSString *CellIdentifier = @"TopicsCell";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        
        cell.textLabel.text = [NSString stringWithFormat:@"%d", indexPath.row];
        return cell;
    }
    
    return nil;
}

#pragma mark - Table View delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        
        // Get topic title height
        NSString *topicTitle = [topicDetail objectForKey:@"title"];
        NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:16.0f]};
        CGSize topicTitleSize = [topicTitle sizeWithAttributes:attributes];
        UILabel *topicTitleLabel = [[UILabel alloc]
                           initWithFrame:CGRectMake(15.0f, 15.0f, 230.0f, topicTitleSize.height)];
        topicTitleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        topicTitleLabel.numberOfLines = 0;
        topicTitleLabel.text = topicTitle;
        topicTitleLabel.font = [UIFont boldSystemFontOfSize:16.0f];
        [topicTitleLabel sizeToFit];
        
        // Get the nickname label height
        NSString *userNickName = [[topicDetail objectForKey:@"user"] objectForKey:@"login"];
        NSDictionary *attributesSmall = @{NSFontAttributeName: [UIFont systemFontOfSize:11.0f]};
        CGSize userNickSize = [userNickName sizeWithAttributes:attributesSmall];
        
        // Get the detail html content view height
        NSString *rawHtml = [topicDetail objectForKey:@"body_html"];
        NSData *htmlData = [rawHtml dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *builderOptions = @{DTDefaultFontFamily: @"Helvetica",
                                         DTDefaultLinkDecoration: @"none",
                                         DTDefaultFontSize: @"12"};
        
        DTHTMLAttributedStringBuilder *stringBuilder = [[DTHTMLAttributedStringBuilder alloc]
                                                        initWithHTML:htmlData options:builderOptions documentAttributes:nil];
       
        DTAttributedTextContentView *htmlTopicDetailView = [[DTAttributedTextContentView alloc] initWithFrame:CGRectZero];
        htmlTopicDetailView.attributedString = [stringBuilder generatedAttributedString];
        CGSize size = [htmlTopicDetailView suggestedFrameSizeToFitEntireStringConstraintedToWidth:290.0f];
        
        // Calculate the height
        // 上边缘高度 + topicTitleLabel + 和nicknamelabel间距 + nicknamelabel + 和horizonline间距 +
        // 和htmlcontentview间距 + htmlcontentview + 下边缘高度
        CGFloat height = 15 + topicTitleLabel.frame.size.height + 5 + userNickSize.height + 5 + 5 + size.height + 5;
       
        return height;
    } else {
        return 40;
    }
}


@end

//
//  TopicController.m
//  Ruby-China-iOS
//
//  Created by Liang Huang on 10/23/13.
//  Copyright (c) 2013 Vincent. All rights reserved.
//

#import "TopicController.h"
#import "AFNetworking.h"
#import "TopicDetailCell.h"
#import "TopicReplyCell.h"
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
        NSLog(@"Get Topic List Error is: %@", error);
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
        
        self.topicDetailCell = [[TopicDetailCell alloc] init];
        [self.topicDetailCell setupWithTopicDetail:topicDetail];
        
        return self.topicDetailCell;
    } else if (indexPath.section == 1) {
        
        static NSString *CellIdentifier = @"TopicReplyCell";
        
        self.topicReplyCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (self.topicReplyCell == nil) {
            self.topicReplyCell = [[TopicReplyCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        
//        cell.textLabel.text = [[replies objectAtIndex:indexPath.row] objectForKey:@"body"];
        [self.topicReplyCell setupWithTopicReply:[replies objectAtIndex:indexPath.row]];
        return self.topicReplyCell;
    }
    
    return nil;
}

#pragma mark - Table View delegate


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        // load webview here --
        // add as the controller property
        
        
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
        NSDictionary *builderOptions = @{DTDefaultFontFamily: @"Helvetica, 宋体",
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
        NSDictionary *reply = [replies objectAtIndex:indexPath.row];
        NSString *userNickName = [[reply objectForKey:@"user"] objectForKey:@"login"];
        NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:11.0f]};
        CGSize userNickSize = [userNickName sizeWithAttributes:attributes];
        
        NSString *rawHtml = [reply objectForKey:@"body_html"];
        NSData *htmlData = [rawHtml dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *builderOptions = @{DTDefaultFontFamily: @"Helvetica, 宋体",
                                         DTDefaultFontSize: @"12",
                                         DTDefaultLinkDecoration: @"none"};
        
        DTHTMLAttributedStringBuilder *stringBuilder = [[DTHTMLAttributedStringBuilder alloc]
                                                        initWithHTML:htmlData options:builderOptions documentAttributes:nil];
        DTAttributedTextContentView *replyContentView = [[DTAttributedTextContentView alloc] initWithFrame:CGRectZero];
        replyContentView.attributedString = [stringBuilder generatedAttributedString];
        CGSize size = [replyContentView suggestedFrameSizeToFitEntireStringConstraintedToWidth:265.0f];
        
         /* Calculate the height
         * 上边缘高度 + userNickNameLabel+ 和replycontentview间距 + replycontentview + 下边缘高度
         */
        
        CGFloat height = 15 + userNickSize.height + 5 + size.height + 5;
        
        return height;
    }
}


@end

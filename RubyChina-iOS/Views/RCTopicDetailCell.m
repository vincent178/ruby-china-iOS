//
//  RCTopicDetailCell.m
//  RubyChina-iOS
//
//  Created by Liang Huang on 7/12/14.
//  Copyright (c) 2014 vincent178. All rights reserved.
//

#import "RCTopicDetailCell.h"
#import "NSDate+DateTools.h"
#import "RCTopicTableView.h"
#import "UIView+findSuperView.h"

@interface RCTopicDetailCell()

@property (nonatomic, strong) NSDateFormatter *dateFormatter;
@property (nonatomic, strong) NSString *htmlTemplate;




@property (nonatomic, strong) UIWebView *webView;



@end

@implementation RCTopicDetailCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.layer.opacity = 1;
        
        // NSDateFormatter
        self.dateFormatter = [[NSDateFormatter alloc] init];
        self.dateFormatter.dateFormat = @"yyyy'-'MM'-'dd'T'HH':'mm':'ss.SSSZZZ";
        
        
        // time ago string
        NSDate *createdDate = [[NSDate alloc] init];
        createdDate = [self.dateFormatter dateFromString:self.createdDateString];
        NSString *timeAgoString = [createdDate timeAgoSinceNow];
        
        // authorPostedTimeAgo
        NSString *authorPostedTimeAgo = [[NSString alloc] init];
        if (self.authorName && self.nodeName && timeAgoString) {
            authorPostedTimeAgo = [NSString stringWithFormat:@"%@ posted at %@ %@", self.authorName, self.nodeName, timeAgoString];
        }
        
        // author posted in category time ago
        UILabel *authorPostedTimeAgoLabel = [[UILabel alloc] init];
        authorPostedTimeAgoLabel.frame = CGRectMake(5, 1, 0, 11);
        authorPostedTimeAgoLabel.font = [UIFont systemFontOfSize:9];
        authorPostedTimeAgoLabel.text = authorPostedTimeAgo;
        [authorPostedTimeAgoLabel sizeToFit];
        authorPostedTimeAgoLabel.layer.opacity = 1;
        [self addSubview:authorPostedTimeAgoLabel];
        
        // horizontal line
        UIImageView *horizontalLine = [[UIImageView alloc] initWithFrame:CGRectMake(5, 12.5, 310, 1)];
        horizontalLine.image = [UIImage imageNamed:@"horizontal_line.png"];
        horizontalLine.layer.opacity = 1;
        [self addSubview:horizontalLine];
        
        self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(8, 20.5, self.frame.size.width, 10)];
        self.webView.layer.opacity = 1.0;
        self.webView.delegate = self;
        self.webView.autoresizingMask = UIViewAutoresizingNone;
        self.webView.scrollView.scrollEnabled = NO;
        self.webView.scrollView.scrollsToTop = NO;
        [self addSubview:self.webView];
        
        
        NSString  *path = [[NSBundle mainBundle] pathForResource:@"index" ofType: @"html"];
        NSError *error = nil;
        self.htmlTemplate = [NSString stringWithContentsOfFile:path
                                                      encoding: NSUTF8StringEncoding
                                                         error: &error];
        
   
        
    }
    
    return self;
}

- (void)setup {
    
    if (self.topicDetailBody) {
        
        NSString *template = [self.htmlTemplate stringByReplacingOccurrencesOfString:@"[[content_body]]"
                                                                          withString:self.topicDetailBody];
        [self.webView loadHTMLString:template baseURL:nil];
    }
}

- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

#pragma mark UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"webViewDidStartLoad");
    webView.alpha = 1.f;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    webView.alpha = 1.f;
    
    NSLog(@"webViewDidFinishLoad");
    
    RCTopicTableView *tableView = (RCTopicTableView *)[self findSuperViewWithClass:[RCTopicTableView class]];
    CGSize realSize = self.webView.scrollView.contentSize;
    
    self.webView.frame = CGRectMake(0, 20.5, self.frame.size.width, realSize.height);
    
    CGFloat totalHeight = realSize.height + 20.5 + 4;
    tableView.topicDetailHeight = totalHeight;
    self.frame = CGRectMake(0, 0, self.frame.size.width, totalHeight);
    
    [tableView beginUpdates];
    [tableView endUpdates];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    return YES;
    
}



@end

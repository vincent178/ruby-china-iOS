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
        
        
        self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(8, 20.5, self.frame.size.width, 0)];
        self.webView.delegate = self;
        self.webView.autoresizingMask = UIViewAutoresizingNone;
        self.webView.scrollView.scrollEnabled = NO;
        self.webView.scrollView.scrollsToTop = NO;
        [self addSubview:self.webView];
        
    }
    
    return self;
}

- (void)setup {

    
    NSString  *path = [[NSBundle mainBundle] pathForResource:@"index" ofType: @"html"];
    NSError *error = nil;
    NSString *template = [NSString stringWithContentsOfFile:path
                                                 encoding: NSUTF8StringEncoding
                                                    error: &error];
    
//    template = [template stringByReplacingOccurrencesOfString:@"[[content_id]]"
//                                                   withString:self.topicID];
    
    template = [template stringByReplacingOccurrencesOfString:@"[[content_body]]"
                                                   withString:self.topicDetailBody];
    
    NSLog(@"template: %@", template);
    
    // Finally, load the content
    [self.webView loadHTMLString:template
                         baseURL:[[NSBundle mainBundle] bundleURL]];

    
}

- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"webViewDidStartLoad");
    webView.alpha = 0.f;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    webView.alpha = 1.f;
    
    NSLog(@"webViewDidFinishLoad");
    
    RCTopicTableView *tableView = (RCTopicTableView *)[self findSuperViewWithClass:[RCTopicTableView class]];
    
    
    NSString *result = [webView stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight;"];
    CGFloat height = [result floatValue];
    CGFloat totalHeight = height + 20.5;
    NSLog(@"totalHeight: %ld",(long)totalHeight);
    
    
    tableView.topicDetailHeight = totalHeight;
    self.frame = CGRectMake(0, 0, self.frame.size.width, totalHeight);
    self.webView.frame = CGRectMake(8, 20.5, self.frame.size.width, height);
    
    [tableView beginUpdates];
    [tableView endUpdates];
    
    NSLog(@"result: %@", result);
    
    
    
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    
//    NSLog(@"shouldStartLoadWithRequest");
//    
//    NSURL *url = [request URL];
//    
//    NSLog(@"url: %@", url);
//    
//    NSString *scheme = [url scheme];
//    
//    NSLog(@"scheme: %@", scheme);
//    
//    if ([scheme isEqualToString:@"ready"]) {
//        
//        // URLs look like ready://content/12345/232
//        //                     content id --^    ^---- document height
//        
//        
//        NSString *topicID = [[url pathComponents] objectAtIndex:1];
//        
//        if (![self.topicID isEqualToString:topicID]) { // sanity check
//            return NO;
//        }
//        
//        RCTopicTableView *tableView = (RCTopicTableView *)[self findSuperViewWithClass:[RCTopicTableView class]];
//        
//        
//        NSInteger height = [[[url pathComponents] objectAtIndex:2] integerValue];
//        NSInteger totalHeight = height + 20.5;
//        NSLog(@"totalHeight: %ld",(long)totalHeight);
//        
//        if (totalHeight != tableView.topicDetailHeight) {
//            
//            tableView.topicDetailHeight = totalHeight;
//            self.frame = CGRectMake(0, 0, self.frame.size.width, totalHeight);
//            self.webView.frame = CGRectMake(0, 20.5, self.frame.size.width, height);
//            
//            NSLog(@"self.frame: %@", NSStringFromCGRect(self.frame));
//            NSLog(@"self.webView.frame: %@", NSStringFromCGRect(self.webView.frame));
//            
//            [tableView beginUpdates];
//            [tableView endUpdates];
//        }
//        
//        return NO;
//    }
//    
    return YES;
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect r = self.webView.frame;
    r.origin = CGPointMake(0, 20.5);
    r.size = CGSizeMake(self.frame.size.width, 10);
    self.webView.frame = r;
}

@end

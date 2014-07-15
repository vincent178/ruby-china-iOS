//
//  RCTopicReplyCell.m
//  RubyChina-iOS
//
//  Created by Liang Huang on 7/12/14.
//  Copyright (c) 2014 vincent178. All rights reserved.
//

#import "RCTopicReplyCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "RCTopicTableView.h"
#import "UIView+findSuperView.h"
#import "NSDate+DateTools.h"

@interface RCTopicReplyCell()

@property (nonatomic, strong) NSDateFormatter *dateFormatter;
@property (nonatomic, strong) NSString *htmlTemplate;
@property (nonatomic, strong) NSString *repliedTimeAgo;


@property (nonatomic, strong) UIImageView *avatarView;
@property (nonatomic, strong) UIWebView *webView;

@end

@implementation RCTopicReplyCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.dateFormatter = [[NSDateFormatter alloc] init];
        self.dateFormatter.dateFormat = @"yyyy'-'MM'-'dd'T'HH':'mm':'ss.SSSZZZ";
        self.repliedTimeAgo = [[NSString alloc] init];
        
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.layer.opacity = 1;
        
        
        // 1. avatar image view
        self.avatarView = [[UIImageView alloc] initWithFrame:CGRectMake(8, 18.5, 30, 30)];
        self.avatarView.layer.opacity = 1.0;
        self.avatarView.layer.cornerRadius = 5.0;
        self.avatarView.clipsToBounds = YES;
        [self addSubview:self.avatarView];
        
        


    }
    
    return self;
}

- (void)updateContent {
    
    if (self.replyDateString) {
        self.repliedTimeAgo = [[self.dateFormatter dateFromString:self.replyDateString] timeAgoSinceNow];
    }
    
    if (self.avatarURL) {
        [self.avatarView setImageWithURL:[NSURL URLWithString:self.avatarURL]
                        placeholderImage:[UIImage imageNamed:@"nobody.png"]];
    }
    
    if (self.username && self.repliedTimeAgo && self.replyBody) {
        
        // 2. web view for reply content
        // web view
        self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(48, 13, 262, 10)];
        self.webView.layer.opacity = 1.0;
        self.webView.delegate = self;
        self.webView.autoresizingMask = UIViewAutoresizingNone;
        self.webView.scrollView.scrollEnabled = NO;
        self.webView.scrollView.scrollsToTop = NO;
        [self addSubview:self.webView];
        
        
        NSString  *path = [[NSBundle mainBundle] pathForResource:@"reply" ofType: @"html"];
        NSError *error = nil;
        self.htmlTemplate = [NSString stringWithContentsOfFile:path
                                                      encoding: NSUTF8StringEncoding
                                                         error: &error];
        
        NSLog(@"self.replyBody: %@", self.replyBody);
        
        NSString *template = [[[self.htmlTemplate stringByReplacingOccurrencesOfString:@"[[content_body]]" withString:self.replyBody]
                               stringByReplacingOccurrencesOfString:@"[[content_user]]" withString:self.username]
                              stringByReplacingOccurrencesOfString:@"[[content_replied_at]]" withString:self.repliedTimeAgo];;
        
        [self.webView loadHTMLString:template baseURL:nil];       
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];

}

#pragma mark - UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"webViewDidStartLoad");
    webView.alpha = 1.f;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    webView.alpha = 1.f;
    
    NSLog(@"webViewDidFinishLoad");
    
    RCTopicTableView *tableView = (RCTopicTableView *)[self findSuperViewWithClass:[RCTopicTableView class]];
    CGSize realSize = self.webView.scrollView.contentSize;
    
    CGRect oldFrame = self.webView.frame;
    self.webView.frame = CGRectMake(oldFrame.origin.x, oldFrame.origin.y, oldFrame.size.width, realSize.height);
    
    
    CGFloat totalHeight = realSize.height + 20.5 + 4;
    [tableView.topicReplyHeights insertObject:@(totalHeight) atIndex:self.indexPathRow];
    NSLog(@"self.indexPathRow: %ld", self.indexPathRow);
    NSLog(@"totalHeight: %f", totalHeight);
    
    self.frame = CGRectMake(0, 0, self.frame.size.width, totalHeight);
    
    [tableView beginUpdates];
    [tableView endUpdates];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    return YES;
    
}



@end

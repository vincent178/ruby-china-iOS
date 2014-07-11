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
#import "NSDate+DateTools.h"
#import "RCNodesList.h"
#import "NSString+DynamicHeight.h"
#import "RCReplyCell.h"
#import <DTCoreText/DTCoreText.h>
#import "DTTiledLayerWithoutFade.h"
#import <SDWebImage/UIImageView+WebCache.h>

@import QuartzCore;


@interface RCTopicDetailController ()

@property (nonatomic, strong) RCLoadingController *loadingController;
@property (nonatomic, strong) NSDateFormatter *dateFormatter;
@property (nonatomic, strong) RCNodesList *nodesList;
@property (nonatomic, strong) NSDictionary *topicDetailInfo;
@property (nonatomic, strong) DTAttributedTextContentView *topicDetailView;
@property (nonatomic, assign) CGFloat topicDetailCellHeight;
@property (nonatomic, strong) NSMutableDictionary *heights;


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
    
    
    // heights
    self.heights = [[NSMutableDictionary alloc] init];
    
    
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
        
        [self caculateHeight];
        [self.tableView reloadData];
        NSLog(@"reloadData");
        
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
    
    static NSString *replyIdentifier = @"ReplyCell";
    static NSString *detailIdentifier = @"Detail";
    
    if (indexPath.section == 0) {
        
        UITableViewCell *topicDetailCell = [tableView dequeueReusableCellWithIdentifier:detailIdentifier];
        
        if (topicDetailCell == nil) {
            
            topicDetailCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:detailIdentifier];
        }
        
        
        /*
         *******************************************
         Data Prepare
         */
        
        // time ago string
        NSString *createdDateString = self.topicDetailInfo[@"created_at"];
        NSDate *createdDate = [[NSDate alloc] init];
        createdDate = [self.dateFormatter dateFromString:createdDateString];
        NSString *timeAgoString = [createdDate timeAgoSinceNow];
        
        // category name
        NSString *nodeName = self.topicDetailInfo[@"node_name"];
        
        
        // topic title
        NSString *topicTitle = self.topicTitle;
        
        
        // topic body html string
        NSString *topicHTMLString = self.topicDetailInfo[@"body_html"];
        
        
        // topic author
        NSString *topicAuthor = self.topicAuthor;
        
        /*
         Data Prepare Ends
         *******************************************
         */
        
        
        
        
        /*
         *******************************************
         View Prepare
         */
        
        
        // author node and time ago label
        NSString *authorPostedTimeAgo = nil;
        if (topicAuthor && nodeName && timeAgoString) {
            authorPostedTimeAgo = [NSString stringWithFormat:@"%@ posted in %@ %@", topicAuthor, nodeName, timeAgoString];
        }
        
        // author posted in category time ago
        UILabel *authorPostedTimeAgoLabel = [[UILabel alloc] init];
        authorPostedTimeAgoLabel.frame = CGRectMake(5, 1, 0, 11);
        authorPostedTimeAgoLabel.font = [UIFont systemFontOfSize:9];
        authorPostedTimeAgoLabel.text = authorPostedTimeAgo;
        [authorPostedTimeAgoLabel sizeToFit];
        [topicDetailCell addSubview:authorPostedTimeAgoLabel];
        
        // horizontal line
        UIImageView *horizontalLine = [[UIImageView alloc] initWithFrame:CGRectMake(5, 12.5, 310, 1)];
        horizontalLine.image = [UIImage imageNamed:@"horizontal_line.png"];
        [topicDetailCell addSubview:horizontalLine];
        
        // topic title label
        UIFont *font = [UIFont fontWithName:@"Helvetica Neue" size:14];
        CGSize topicTitleLabelSize = [topicTitle sizeOfMultiLineLabelwithWidth:302.5 font:font];
        
        UILabel *topicTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 20.5, topicTitleLabelSize.width, topicTitleLabelSize.height)];
        topicTitleLabel.font = font;
        topicTitleLabel.text = self.topicTitle;
        topicTitleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        topicTitleLabel.numberOfLines = 0;
        topicTitleLabel.textAlignment = NSTextAlignmentLeft;
        [topicDetailCell addSubview:topicTitleLabel];
        
        // topic content view
        // 1. get the attributed string
        NSData *htmlData = [topicHTMLString dataUsingEncoding:NSUTF8StringEncoding];
        NSAttributedString *topicAttributedString = [[NSAttributedString alloc] initWithHTMLData:htmlData documentAttributes:nil];
        
        // 2. caculate the frame for the label
        DTCoreTextLayouter *layouter = [[DTCoreTextLayouter alloc] initWithAttributedString:topicAttributedString];
        CGRect maxRect = CGRectMake(8, topicTitleLabel.frame.origin.y + topicTitleLabel.frame.size.height + 4, 302.5, CGFLOAT_HEIGHT_UNKNOWN);
        NSRange entireString = NSMakeRange(0, [topicAttributedString length]);
        DTCoreTextLayoutFrame *layoutFrame = [layouter layoutFrameWithRect:maxRect range:entireString];
        
        // 3. initialize label
        self.topicDetailView = [[DTAttributedTextContentView alloc] initWithFrame:layoutFrame.frame];
        [DTAttributedTextContentView setLayerClass:[DTTiledLayerWithoutFade class]];
        self.topicDetailView.delegate = self;
        NSLog(@"layoutFrame.frame: %@", NSStringFromCGRect(layoutFrame.frame));
        self.topicDetailView.attributedString = topicAttributedString;
        
        // 4. add to superview
        [topicDetailCell addSubview:self.topicDetailView];
        
        
        /*
         View Prepare Ends
         *******************************************
         */
        
        
        return topicDetailCell;
        
    } else {
        
        RCReplyCell *replyCell = [tableView dequeueReusableCellWithIdentifier:replyIdentifier];
        
        if (!replyCell) {
            replyCell = [[RCReplyCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:replyIdentifier];
        }
        
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
        
        CGFloat totalHeight = 0;
        for (NSString *key in self.heights) {
            totalHeight += [self.heights[key] floatValue];
        }
        
        return totalHeight;
    }
    
    return 110;
}

#pragma mark -
#pragma mark - DTAttributedTextContentView Delegate

- (UIView *)attributedTextContentView:(DTAttributedTextContentView *)attributedTextContentView
                    viewForAttachment:(DTTextAttachment *)attachment frame:(CGRect)frame {
    
    
    if([attachment isKindOfClass:[DTImageTextAttachment class]]) {
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
        
        NSLog(@"imageView.frame: %@", NSStringFromCGRect(frame));
        
        [imageView setImageWithURL:attachment.contentURL completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
            
            if (image) {
                
                [self.tableView beginUpdates];
                
                NSLog(@"downloaded image");
                
                CGFloat ratio = image.size.width / 302.5;
                
                CGSize size = image.size;
                
                if (ratio > 1) {
                    size.width = size.width / ratio;
                    size.height = size.height / ratio;
                }
                
                attachment.originalSize = size;
                
                [self.heights setObject:@(size.height) forKey:[attachment.contentURL absoluteString]];
                
                CGRect oldTopicDetailFrame = self.topicDetailView.frame;
                self.topicDetailView.frame = CGRectMake(oldTopicDetailFrame.origin.x, oldTopicDetailFrame.origin.y, oldTopicDetailFrame.size.width, oldTopicDetailFrame.size.height + size.height);
                
                self.topicDetailView.layouter = nil;
                [self.topicDetailView relayoutText];
                
                
                [self.tableView endUpdates];
            }
        }];
        
        return imageView;
        
    }
    
    return nil;
    
}

#pragma mark -
#pragma mark -

- (void)caculateHeight {
    
    /*
     *******************************************
     Data Prepare
     */
    
    // topic title
    NSString *topicTitle = self.topicTitle;
    
    
    // topic body html string
    NSString *topicHTMLString = self.topicDetailInfo[@"body_html"];
    
    
    
    /*
     *******************************************
     View Prepare
     */
    
    // topic title label
    UIFont *font = [UIFont fontWithName:@"Helvetica Neue" size:14];
    CGSize topicTitleLabelSize = [topicTitle sizeOfMultiLineLabelwithWidth:302.5 font:font];
    
    // topic content view
    // 1. get the attributed string
    NSData *htmlData = [topicHTMLString dataUsingEncoding:NSUTF8StringEncoding];
    NSAttributedString *topicAttributedString = [[NSAttributedString alloc] initWithHTMLData:htmlData documentAttributes:nil];
    
    // 2. caculate the frame for the label
    DTCoreTextLayouter *layouter = [[DTCoreTextLayouter alloc] initWithAttributedString:topicAttributedString];
    CGRect maxRect = CGRectMake(8, 20.5 + topicTitleLabelSize.height + 4, 302.5, CGFLOAT_HEIGHT_UNKNOWN);
    NSRange entireString = NSMakeRange(0, [topicAttributedString length]);
    DTCoreTextLayoutFrame *layoutFrame = [layouter layoutFrameWithRect:maxRect range:entireString];
    
    
    self.topicDetailCellHeight = layoutFrame.frame.origin.y + layoutFrame.frame.size.height + 4;
    NSLog(@"self.topicDetailCellHeight: %f", self.topicDetailCellHeight);
    
    
    [self.heights setObject:@(self.topicDetailCellHeight) forKey:@"origin"];
}


@end

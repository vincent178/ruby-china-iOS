//
//  RCTopicDetail.m
//  RubyChina-iOS
//
//  Created by Liang Huang on 7/4/14.
//  Copyright (c) 2014 vincent178. All rights reserved.
//

#import "RCTopicDetail.h"
#import "NSString+DynamicHeight.h"

#import <DTCoreText/DTCoreText.h>
#import <SDWebImage/UIImageView+WebCache.h>



#import "DTTiledLayerWithoutFade.h"

@interface RCTopicDetail()

@property (nonatomic, strong) DTAttributedTextContentView *topicDetailView;


@end


@implementation RCTopicDetail

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
    }
    
    return self;
}

- (void)setup {
    
    // author node and time ago label
    NSString *authorPostedTimeAgo = [NSString stringWithFormat:@"%@ posted in %@ %@", self.topicAuthor, self.nodeName, self.timeAgoString];
    
    UILabel *authorPostedTimeAgoLabel = [[UILabel alloc] init];
    authorPostedTimeAgoLabel.frame = CGRectMake(5, 1, 0, 11);
    authorPostedTimeAgoLabel.font = [UIFont systemFontOfSize:9];
    authorPostedTimeAgoLabel.text = authorPostedTimeAgo;
    [authorPostedTimeAgoLabel sizeToFit];
    [self addSubview:authorPostedTimeAgoLabel];
    
    // horizontal line
    UIImageView *horizontalLine = [[UIImageView alloc] initWithFrame:CGRectMake(5, 12.5, 310, 1)];
    horizontalLine.image = [UIImage imageNamed:@"horizontal_line.png"];
    [self addSubview:horizontalLine];
    
    // topic title label
    UIFont *font = [UIFont fontWithName:@"Helvetica Neue" size:14];
    CGSize topicTitleLabelSize = [self.topicTitle sizeOfMultiLineLabelwithWidth:302.5 font:font];
    
    UILabel *topicTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 20.5, topicTitleLabelSize.width, topicTitleLabelSize.height)];
    topicTitleLabel.font = font;
    topicTitleLabel.text = self.topicTitle;
    topicTitleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    topicTitleLabel.numberOfLines = 0;
    topicTitleLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:topicTitleLabel];
    
    // topic content view
    // 1. get the attributed string
    NSData *htmlData = [self.topicHTMLString dataUsingEncoding:NSUTF8StringEncoding];
    NSAttributedString *topicAttributedString = [[NSAttributedString alloc] initWithHTMLData:htmlData documentAttributes:nil];
    
    // 2. caculate the frame for the label
    DTCoreTextLayouter *layouter = [[DTCoreTextLayouter alloc] initWithAttributedString:topicAttributedString];
    CGRect maxRect = CGRectMake(8, topicTitleLabel.frame.origin.y + topicTitleLabel.frame.size.height + 4, 302.5, CGFLOAT_HEIGHT_UNKNOWN);
    NSRange entireString = NSMakeRange(0, [topicAttributedString length]);
    DTCoreTextLayoutFrame *layoutFrame = [layouter layoutFrameWithRect:maxRect range:entireString];
    
    // 3. initialize label
    self.topicDetailView = [[DTAttributedTextContentView alloc] initWithFrame:layoutFrame.frame];
    self.topicDetailView.delegate = self;
    [DTAttributedTextContentView setLayerClass:[DTTiledLayerWithoutFade class]];
    NSLog(@"layoutFrame.frame: %@", NSStringFromCGRect(layoutFrame.frame));
    self.topicDetailView.attributedString = topicAttributedString;
    
    // 4. add to superview
    [self addSubview:self.topicDetailView];
    
    self.frame = CGRectMake(0, 0, 320, self.topicDetailView.frame.origin.y + self.topicDetailView.frame.size.height + 4);
    
    self.cellHeight = self.frame.size.height;
    NSLog(@"self.cellHeight: %f", self.cellHeight);
}


- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];

}

#pragma mark -
#pragma mark - DTAttributedTextContentViewDelegate

- (UIView *)attributedTextContentView:(DTAttributedTextContentView *)attributedTextContentView
                    viewForAttachment:(DTTextAttachment *)attachment frame:(CGRect)frame {
    
    
    if([attachment isKindOfClass:[DTImageTextAttachment class]]) {
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
        
        NSLog(@"imageView.frame: %@", NSStringFromCGRect(frame));
        
        [imageView setImageWithURL:attachment.contentURL completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
            
            if (image) {
                
                NSLog(@"downloaded image");
                
                CGFloat ratio = image.size.width / 302.5;
                
                CGSize size = image.size;
                
                if (ratio > 1) {
                    size.width = size.width / ratio;
                    size.height = size.height / ratio;
                }
                
                attachment.originalSize = size;
                NSLog(@"attachment.originalSize: %@", NSStringFromCGSize(image.size));
                
                self.topicDetailView.layouter = nil;
                [self.topicDetailView relayoutText];
                
                self.cellHeight = self.cellHeight + size.height;
                
                [self.delegate didFinishDownloadImage];
               
            }
        }];
        
        return imageView;
        
    }
    
    return nil;
   
}


@end


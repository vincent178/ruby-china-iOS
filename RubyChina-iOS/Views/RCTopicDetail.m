//
//  RCTopicDetail.m
//  RubyChina-iOS
//
//  Created by Liang Huang on 7/4/14.
//  Copyright (c) 2014 vincent178. All rights reserved.
//

#import "RCTopicDetail.h"
#import "NSString+DynamicHeight.h"
#import "DTAttributedTextContentView.h"
#import <DTCoreText/DTCoreText.h>
#import "DTTiledLayerWithoutFade.h"

@interface RCTopicDetail()


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
    DTAttributedLabel *topicAttributedDetailLabel = [[DTAttributedLabel alloc] initWithFrame:layoutFrame.frame];
    [DTAttributedTextContentView setLayerClass:[DTTiledLayerWithoutFade class]];
    NSLog(@"layoutFrame.frame: %@", NSStringFromCGRect(layoutFrame.frame));
    topicAttributedDetailLabel.attributedString = topicAttributedString;
    topicAttributedDetailLabel.numberOfLines = 0;
    topicAttributedDetailLabel.lineBreakMode = NSLineBreakByCharWrapping;
    
    // 4. add to superview
    [self addSubview:topicAttributedDetailLabel];
    
    self.frame = CGRectMake(0, 0, 320, topicAttributedDetailLabel.frame.origin.y + topicAttributedDetailLabel.frame.size.height + 4);
    
    
    
    
}


- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];

}


@end


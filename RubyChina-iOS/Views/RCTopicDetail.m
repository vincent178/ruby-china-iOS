//
//  RCTopicDetail.m
//  RubyChina-iOS
//
//  Created by Liang Huang on 7/4/14.
//  Copyright (c) 2014 vincent178. All rights reserved.
//

#import "RCTopicDetail.h"
#import "NSString+DynamicHeight.h"

@implementation RCTopicDetail

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.frame = CGRectMake(0, 0, 320, 1000);
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
    CGSize size = [self.topicTitle sizeOfMultiLineLabelwithWidth:302.5 font:font];
    
    UILabel *topicTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 20.5, size.width, size.height)];
    topicTitleLabel.font = font;
    topicTitleLabel.text = self.topicTitle;
    topicTitleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    topicTitleLabel.numberOfLines = 0;
    topicTitleLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:topicTitleLabel];
    
}

- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];

}

@end

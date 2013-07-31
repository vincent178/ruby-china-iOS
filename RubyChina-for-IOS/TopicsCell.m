//
//  TopicsCell.m
//  RubyChina-for-IOS
//
//  Created by Vincent on 13-7-29.
//  Copyright (c) 2013年 Vincent. All rights reserved.
//

#import "TopicsCell.h"

@implementation TopicsCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Add avatar
        avatar = [[UIImageView alloc] initWithFrame:CGRectZero];
        avatar.backgroundColor = [UIColor grayColor];
        self.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview: avatar];
        
        // Add nameLabel
        nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        nameLabel.textAlignment = NSTextAlignmentLeft;
        nameLabel.textColor = [UIColor grayColor];
        nameLabel.font = SmallFont;
        [self.contentView addSubview: nameLabel];
        
        // Add nodeLabel
        nodeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        nodeLabel.textAlignment = NSTextAlignmentRight;
        nodeLabel.textColor = [UIColor grayColor];
        nodeLabel.font = SmallFont;
        [self.contentView addSubview:nodeLabel];
        
        // Add topicLabel
        topicLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        topicLabel.textAlignment = NSTextAlignmentLeft;
        topicLabel.textColor = [UIColor blackColor];
        topicLabel.lineBreakMode = NSLineBreakByWordWrapping;
        topicLabel.adjustsFontSizeToFitWidth = false;
        topicLabel.numberOfLines = 0;
        topicLabel.font = MiddleFont;
        [self.contentView addSubview: topicLabel];
    }
    return self;
}


- (void) setTopicsCell:(NSDictionary *)cellContent {
    nameLabel.text  = [[cellContent objectForKey:@"user"] objectForKey:@"login"];
    topicLabel.text = [cellContent objectForKey:@"title"];
    nodeLabel.text = [cellContent objectForKey:@"node_name"];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    avatar.frame = CGRectMake(8, 10, 32, 32);
    nameLabel.frame = CGRectMake(50, 10, 80, 14);
    nodeLabel.frame = CGRectMake(160, 10, 150, 14);
    topicLabel.frame = CGRectMake(50, 30, 260, 20);
    
    // Dynamic set UiLabel height
    CGSize maximumLabelSize = CGSizeMake(260, FLT_MAX);
    CGSize expectedLabelSize = [topicLabel.text sizeWithFont:MiddleFont
                                      constrainedToSize:maximumLabelSize
                                          lineBreakMode:topicLabel.lineBreakMode];
    CGRect newFrame = topicLabel.frame;
    newFrame.size.height = expectedLabelSize.height;
    topicLabel.frame = newFrame;
}

- (CGFloat) getTopicCellHeight {
    return self.frame.size.height;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}
@end

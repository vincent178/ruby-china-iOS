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
        nameLabel.backgroundColor = [UIColor yellowColor];
        nameLabel.textAlignment = NSTextAlignmentLeft;
        nameLabel.textColor = [UIColor blueColor];
        nameLabel.font = [UIFont systemFontOfSize:13.0f];
        [self.contentView addSubview: nameLabel];
        
        // Add topicLabel
        topicLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        topicLabel.backgroundColor = [UIColor redColor];
        topicLabel.textAlignment = NSTextAlignmentLeft;
        topicLabel.textColor = [UIColor grayColor];
        topicLabel.lineBreakMode = NSLineBreakByWordWrapping;
        topicLabel.numberOfLines = 2;
        topicLabel.font = [UIFont systemFontOfSize:12.0f];
        [self.contentView addSubview: topicLabel];
        
        // Add nodeLabel
        nodeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        nodeLabel.backgroundColor = [UIColor yellowColor];
        nodeLabel.textAlignment = NSTextAlignmentRight;
        nodeLabel.textColor = [UIColor blueColor];
        nodeLabel.font = [UIFont systemFontOfSize:13.0f];
        [self.contentView addSubview:nodeLabel];
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
    topicLabel.frame = CGRectMake(50, 30, 260, 25);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
@end

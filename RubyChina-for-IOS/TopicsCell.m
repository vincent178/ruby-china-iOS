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
        [self.contentView addSubview: nameLabel];
        
        // Add topicLabel
        topicLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        topicLabel.backgroundColor = [UIColor redColor];
        topicLabel.textAlignment = NSTextAlignmentLeft;
        topicLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview: topicLabel];
    }
    return self;
}


- (void) setTopicsCell:(NSDictionary *)cellContent {
    nameLabel.text  = [[cellContent objectForKey:@"user"] objectForKey:@"login"];
    topicLabel.text = [cellContent objectForKey:@"title"];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    avatar.frame = CGRectMake(10, 10, 50, 50);
    nameLabel.frame = CGRectMake(65, 10, 240, 20);
    topicLabel.frame = CGRectMake(65, 35, 240, 90);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
@end

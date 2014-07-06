//
//  RCTopicCell.m
//  RubyChina-iOS
//
//  Created by Liang Huang on 6/28/14.
//  Copyright (c) 2014 vincent178. All rights reserved.
//

#import "RCTopicCell.h"

@implementation RCTopicCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
    }
    return self;
}

- (void)setup {
    
    self.frame = CGRectMake(0, 0, _size.width, _size.height);
    UIImageView *bgView = [[UIImageView alloc] initWithFrame:self.frame];
    bgView.image = [UIImage imageNamed:@"topics_cell_background.png"];
    [self addSubview:bgView];
    
    
    // 1. avatar image view
    UIView *avatarView = [[UIView alloc] initWithFrame:CGRectMake(8, 18.5, 30, 30)];
    avatarView.backgroundColor = [UIColor colorWithRed:0.221 green:0.93 blue:0.93 alpha:1.0];
    [self addSubview:avatarView];
    
    
    
    // 2. reply number view
    UIImageView *replyLabelBackgroundView = [[UIImageView alloc] initWithFrame:CGRectMake(273, 25.5, 37.5, 15)];
    UILabel *replyNumberLabel = [[UILabel alloc] initWithFrame:replyLabelBackgroundView.frame];
    replyLabelBackgroundView.image = [UIImage imageNamed:@"reply_number_bg.png"];
    replyNumberLabel.text = self.replyNumber;
    replyNumberLabel.textAlignment = NSTextAlignmentCenter;
    replyNumberLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:12];
    replyNumberLabel.backgroundColor = [UIColor clearColor];
    replyNumberLabel.textColor = [UIColor whiteColor];
    [self addSubview:replyLabelBackgroundView];
    [self addSubview:replyNumberLabel];
    
    
    // 3. username view
    UILabel *usernameLabel = [[UILabel alloc] initWithFrame:CGRectMake(48, 14, 100, 18)];
    usernameLabel.text = self.username;
    usernameLabel.font =[UIFont fontWithName:@"Helvetica Neue" size:16];
    usernameLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:usernameLabel];
    
    
    //TODO: 4. category view
    UILabel *categoryLabel = [[UILabel alloc] init];
    UIImageView *categoryBackgroundView = [[UIImageView alloc] init];
    [categoryBackgroundView addSubview:categoryLabel];
    [self addSubview:categoryBackgroundView];
    
    
    //TODO: 5. replied time ago
    UILabel *repliedTimeAgoLabel = [[UILabel alloc] initWithFrame:CGRectMake(102.5, 37.5, 155, 15)];
    repliedTimeAgoLabel.text = @"最后由gene_wu于4小时前回复";
    repliedTimeAgoLabel.font = [UIFont systemFontOfSize:9];
    [self addSubview:repliedTimeAgoLabel];
    
    
    // 6. topic content view
    UILabel *topicTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 58.5, 302.5, self.titleHeight)];
    topicTitleLabel.text = self.topicTitle;
    topicTitleLabel.font = [UIFont systemFontOfSize:14];
    topicTitleLabel.textAlignment = NSTextAlignmentLeft;
    topicTitleLabel.numberOfLines = 0;
    topicTitleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [topicTitleLabel sizeToFit];
    
    [self addSubview:topicTitleLabel];
    
}

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end

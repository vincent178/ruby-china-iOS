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
    
    
    //TODO: 1. avatar image view
    UIImageView *avatarImageView = [[UIImageView alloc] init];
    [self addSubview:avatarImageView];
    
    
    //TODO: 2. reply number view
    UILabel *replyNumberLabel = [[UILabel alloc] init];
    UIImageView *replyLabelBackgroundView = [[UIImageView alloc] init];
    [replyLabelBackgroundView addSubview:replyNumberLabel];
    [self addSubview:replyLabelBackgroundView];
    
    
    //TODO: 3. username view
    UILabel *usernameLabel = [[UILabel alloc] init];
    [self addSubview:usernameLabel];
    
    
    //TODO: 4. category view
    UILabel *categoryLabel = [[UILabel alloc] init];
    UIImageView *categoryBackgroundView = [[UIImageView alloc] init];
    [categoryBackgroundView addSubview:categoryLabel];
    [self addSubview:categoryBackgroundView];
    
    
    //TODO: 5. replied time ago
    UILabel *repliedTimeAgoLabel = [[UILabel alloc] init];
    [self addSubview:repliedTimeAgoLabel];
    
    
    
    //TODO: 6. topic content view
    UILabel *topicContentLabel = [[UILabel alloc] init];
    [self addSubview:topicContentLabel];
    
    
    // DEMO
    UIImageView *demoView = [[UIImageView alloc] initWithFrame:self.frame];
    demoView.image = [UIImage imageNamed:@"Topic Cell.png"];
    [self addSubview:demoView];
    
}

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end

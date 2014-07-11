//
//  RCTopicCell.m
//  RubyChina-iOS
//
//  Created by Liang Huang on 6/28/14.
//  Copyright (c) 2014 vincent178. All rights reserved.
//

#import "RCTopicCell.h"
#import "NSString+DynamicHeight.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "NSDate+DateTools.h"

@interface RCTopicCell()

@property (nonatomic, strong) NSDateFormatter *dateFormatter;

@end

@implementation RCTopicCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.dateFormatter = [[NSDateFormatter alloc] init];
        self.dateFormatter.dateFormat = @"yyyy'-'MM'-'dd'T'HH':'mm':'ss.SSSZZZ";
        
    }
    return self;
}

- (void)setup {
    
    self.frame = CGRectMake(0, 0, _size.width, _size.height);
    self.layer.opacity = 1.0;
    
    // 1. avatar image view
    UIImageView *avatarView = [[UIImageView alloc] initWithFrame:CGRectMake(8, 18.5, 30, 30)];
    [avatarView setImageWithURL:[NSURL URLWithString:self.avatarURL] placeholderImage:[UIImage imageNamed:@"nobody.png"]];
    avatarView.layer.opacity = 1.0;
    avatarView.layer.cornerRadius = 5.0;
    avatarView.clipsToBounds = YES;
    [self addSubview:avatarView];
    
    
    // 2. reply number view
    UIImageView *replyLabelBackgroundView = [[UIImageView alloc] initWithFrame:CGRectMake(273, 25.5, 37.5, 15)];
    replyLabelBackgroundView.layer.opacity = 1.0;
    UILabel *replyNumberLabel = [[UILabel alloc] initWithFrame:replyLabelBackgroundView.frame];
    replyNumberLabel.layer.opacity = 1.0;
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
    usernameLabel.layer.opacity = 1.0;
    usernameLabel.text = self.username;
    usernameLabel.font =[UIFont fontWithName:@"Helvetica Neue" size:16];
    usernameLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:usernameLabel];
    
    
    //TODO: 4. category view
    UILabel *nodenameLabel = [[UILabel alloc] initWithFrame:CGRectMake(48, 37.5, 0, 15)];
    nodenameLabel.text = self.nodeName;
    nodenameLabel.font = [UIFont systemFontOfSize:9];
    nodenameLabel.layer.opacity = 1.0;
    [nodenameLabel sizeToFit];
    [self addSubview:nodenameLabel];
    
    
    //TODO: 5. replied time ago
    if ([self.replyNumber intValue] > 0) {
        CGRect lastRepliedFrame = CGRectMake(nodenameLabel.frame.origin.x + nodenameLabel.frame.size.width + 6, 37.5, 0, 15);
        UILabel *repliedTimeAgoLabel = [[UILabel alloc] initWithFrame:lastRepliedFrame];
        repliedTimeAgoLabel.layer.opacity = 1.0;
        NSDate *lastRepliedDate = [[NSDate alloc] init];
        lastRepliedDate = [self.dateFormatter dateFromString:self.lastRepliedDate];
        NSString *timeAgoString = [lastRepliedDate timeAgoSinceNow];
        NSString *userRepiedTimeAgo = [NSString stringWithFormat:@"%@ replied in %@", self.lastRepliedUsername, timeAgoString];
        repliedTimeAgoLabel.text = userRepiedTimeAgo;
        repliedTimeAgoLabel.font = [UIFont systemFontOfSize:9];
        [repliedTimeAgoLabel sizeToFit];
        [self addSubview:repliedTimeAgoLabel];
    }

    
    // 6. topic title view
    UILabel *topicTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 58.5, 302.5, self.titleHeight)];
    topicTitleLabel.layer.opacity = 1.0;
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

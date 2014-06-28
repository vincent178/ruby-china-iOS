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
        
        UIImageView *avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(8, 16, 30, 30)];
        avatarImageView.image = _avatarImage;
        [self addSubview:avatarImageView];
        
        
        
        
        
    }
    return self;
}

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end

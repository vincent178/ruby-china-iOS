//
//  RCReplyCell.m
//  RubyChina-iOS
//
//  Created by Liang Huang on 7/4/14.
//  Copyright (c) 2014 vincent178. All rights reserved.
//

#import "RCReplyCell.h"

@implementation RCReplyCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.frame = CGRectMake(0, 0, 320, 110);
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.frame];
        imageView.image = [UIImage imageNamed:@"reply_cell.png"];
        
        [self addSubview:imageView];
    }
    return self;
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews {
    
}

@end

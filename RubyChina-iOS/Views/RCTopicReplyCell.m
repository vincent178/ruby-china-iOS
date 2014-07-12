//
//  RCTopicReplyCell.m
//  RubyChina-iOS
//
//  Created by Liang Huang on 7/12/14.
//  Copyright (c) 2014 vincent178. All rights reserved.
//

#import "RCTopicReplyCell.h"

@implementation RCTopicReplyCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.layer.opacity = 1;
    }
    
    return self;
}

- (void)setup {
    
    UILabel *test = [[UILabel alloc] initWithFrame:self.frame];
    test.text = @"section 1";
    test.font = [UIFont systemFontOfSize:15];
    [self addSubview:test];
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];

}

@end

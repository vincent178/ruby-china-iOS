//
//  RCTopicDetail.m
//  RubyChina-iOS
//
//  Created by Liang Huang on 7/4/14.
//  Copyright (c) 2014 vincent178. All rights reserved.
//

#import "RCTopicDetail.h"

@implementation RCTopicDetail

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.frame = CGRectMake(0, 0, 320, 1000);
    }
    
    return self;
}

- (void)setup {
    
    
    // node label
    UILabel *nodeLabel = [[UILabel alloc] init];
    nodeLabel.frame = CGRectMake(5, 1, 0, 11);
    nodeLabel.font = [UIFont systemFontOfSize:9];
    nodeLabel.text = self.nodeName;
    [nodeLabel sizeToFit];
    [self addSubview:nodeLabel];
    
    // author and time ago label
    NSString *authorPostedTimeAgo = [NSString stringWithFormat:@"%@ posted %@", self.topicAuthor, self.timeAgoString];
    
    UILabel *authorPostedTimeAgoLabel = [[UILabel alloc] init];
    authorPostedTimeAgoLabel.frame = CGRectMake(nodeLabel.frame.origin.x + 4, nodeLabel.frame.origin.y, 0, 11);
    authorPostedTimeAgoLabel.font = [UIFont systemFontOfSize:9];
    authorPostedTimeAgoLabel.text = authorPostedTimeAgo;
    [authorPostedTimeAgoLabel sizeToFit];
    [self addSubview:authorPostedTimeAgoLabel];
    
    //
    
}

- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];

}

@end

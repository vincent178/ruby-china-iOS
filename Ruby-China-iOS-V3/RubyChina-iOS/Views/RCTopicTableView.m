//
//  RCTopicTableView.m
//  RubyChina-iOS
//
//  Created by Liang Huang on 7/12/14.
//  Copyright (c) 2014 vincent178. All rights reserved.
//

#import "RCTopicTableView.h"

@implementation RCTopicTableView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.topicReplyHeights = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)awakeFromNib {
    self.topicReplyHeights = [[NSMutableArray alloc] init];
}

@end

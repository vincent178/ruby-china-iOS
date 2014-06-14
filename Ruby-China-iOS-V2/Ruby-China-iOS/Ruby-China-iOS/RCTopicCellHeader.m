//
//  RCTopicCellHeader.m
//  Ruby-China-iOS
//
//  Created by Liang Huang on 6/7/14.
//  Copyright (c) 2014 vincent178. All rights reserved.
//

#import "RCTopicCellHeader.h"

@implementation RCTopicCellHeader

- (id)init {
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, 320, 55);
        [self _prepareView];
    }
    
    return self;
}

#pragma mark - Private

- (void)_prepareView {
    [self _prepareAvatarImageView];
    [self _prepareNameView];
    [self _prepareTimeAgo];
}

- (void)_prepareAvatarImageView {
    UIImageView *avatarImageView = [[UIImageView alloc] init];
    avatarImageView.frame = CGRectMake(15, 15, 35, 35);
    avatarImageView.image = self.avatarImage;
    [self addSubview:avatarImageView];
    
}

- (void)_prepareNameView {
    UILabel *nameView = [[UILabel alloc] init];
    nameView.frame = CGRectMake(75, 15, self.nameString.length, 23);
    nameView.text = self.nameString;
    [self addSubview:nameView];
}

- (void)_prepareTimeAgo {
    UILabel *timeAgoView = [[UILabel alloc] init];
    timeAgoView.frame = CGRectMake(75, 38, self.timeAgoString.length, 12);
    timeAgoView.text = self.timeAgoString;
    [self addSubview:timeAgoView];
}

@end

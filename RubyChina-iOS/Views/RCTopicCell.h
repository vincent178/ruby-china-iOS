//
//  RCTopicCell.h
//  RubyChina-iOS
//
//  Created by Liang Huang on 6/28/14.
//  Copyright (c) 2014 vincent178. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCTopicCell : UITableViewCell

@property (nonatomic, assign) CGSize size;

@property (nonatomic, strong) UIImage *avatarImage;

- (void)setup;

@end

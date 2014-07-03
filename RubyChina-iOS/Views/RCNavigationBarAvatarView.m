//
//  RCNavigationBarAvatarView.m
//  RubyChina-iOS
//
//  Created by Liang Huang on 7/3/14.
//  Copyright (c) 2014 vincent178. All rights reserved.
//

#import "RCNavigationBarAvatarView.h"
#import <QuartzCore/QuartzCore.h>

@interface RCNavigationBarAvatarView()

@end

@implementation RCNavigationBarAvatarView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        imageView.image = self.avatarImage;
        imageView.layer.cornerRadius = self.avatarImage.size.width / 2;
        imageView.layer.masksToBounds = YES;
        imageView.layer.borderWidth = 0;
        [self addSubview: imageView];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(avatarViewDidTap:)];
        
        [self addGestureRecognizer:tapGesture];
       
    }
    return self;
}

- (void)avatarViewDidTap:(UITapGestureRecognizer *)tapGesture {
    
}

@end

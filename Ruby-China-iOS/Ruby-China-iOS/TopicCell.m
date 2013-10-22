//
//  TopicCell.m
//  Ruby-China-iOS
//
//  Created by Liang Huang on 10/22/13.
//  Copyright (c) 2013 Vincent. All rights reserved.
//

#import "TopicCell.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"

@implementation TopicCell

- (id)initWithTopic:(NSDictionary *)topic {
    TopicCell *cell = [[TopicCell alloc] init];
    
    // Avatar Image View
    avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5.0f, 15.0f, 35.0f, 35.0f)];
    NSURL *url = [NSURL URLWithString:[[topic objectForKey:@"user"] objectForKey:@"avatar_url"]];
    [avatarImageView setImageWithURL:url];
    [self addSubview:avatarImageView];
    
    // User NickName Label
    NSString *userNickName = [[topic objectForKey:@"user"] objectForKey:@"login"];
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:13.0f]};
    CGSize userNickSize = [userNickName sizeWithAttributes:attributes];
    
    
    
    return cell;
}

@end

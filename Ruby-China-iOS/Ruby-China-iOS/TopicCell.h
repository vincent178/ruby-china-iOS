//
//  TopicCell.h
//  Ruby-China-iOS
//
//  Created by Liang Huang on 10/22/13.
//  Copyright (c) 2013 Vincent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopicCell : UITableViewCell {
    UIImageView *avatarImageView;
    UILabel *user_login;
    UILabel *topic_created_at;
    UITextView *topic_title;
    UIImage *reply_pic;
    UILabel *replies_count;
}

- (id)initWithTopic:(NSDictionary *)topic;

@end

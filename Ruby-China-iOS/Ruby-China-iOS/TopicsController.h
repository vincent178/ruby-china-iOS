//
//  TopicsController.h
//  Ruby-China-iOS
//
//  Created by Vincent on 13-10-12.
//  Copyright (c) 2013年 Vincent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopicsController : UITableViewController <UITableViewDataSource, UITableViewDelegate> {
    NSArray *topics;
}

- (void)newTopicButtonClicked;


@end

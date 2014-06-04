//
//  SidebarController.h
//  Ruby-China-iOS
//
//  Created by Liang Huang on 11/28/13.
//  Copyright (c) 2013 Vincent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SidebarController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *menuItems;

@end

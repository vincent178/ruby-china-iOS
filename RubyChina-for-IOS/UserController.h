//
//  UserController.h
//  RubyChina-for-IOS
//
//  Created by Vincent on 13-7-24.
//  Copyright (c) 2013年 Vincent. All rights reserved.
//

#import <UIKit/UIKit.h>

@class User;

@interface UserController : UITableViewController

@property (nonatomic, strong) User *user;
@property (nonatomic, strong) NSString *login;
@property (nonatomic, copy, readwrite) NSMutableArray *topics;

@end

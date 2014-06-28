//
//  RCTopicsController.h
//  RubyChina-iOS
//
//  Created by Liang Huang on 6/28/14.
//  Copyright (c) 2014 vincent178. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RCPaginationView;

@interface RCTopicsController : UIViewController <UITableViewDataSource, UITableViewDelegate>


@property (weak, nonatomic) IBOutlet RCPaginationView *paginationView;


- (IBAction)previousTapped:(id)sender;
- (IBAction)nextTapped:(id)sender;



@property (weak, nonatomic) IBOutlet UITableView *topicsTableView;


@end

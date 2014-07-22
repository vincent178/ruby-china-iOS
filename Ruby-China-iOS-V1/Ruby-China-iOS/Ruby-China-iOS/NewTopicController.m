//
//  NewTopicController.m
//  Ruby-China-iOS
//
//  Created by Liang Huang on 10/22/13.
//  Copyright (c) 2013 Vincent. All rights reserved.
//

#import "NewTopicController.h"
#import "TopicsController.h"

@implementation NewTopicController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                       target:self action:@selector(doneButtonClicked)];
    self.navigationItem.rightBarButtonItem = doneButton;
}

- (void)doneButtonClicked {
    [self.navigationController popViewControllerAnimated:YES];
}



@end

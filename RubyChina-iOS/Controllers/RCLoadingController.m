//
//  RCLoadingController.m
//  RubyChina-iOS
//
//  Created by Liang Huang on 7/3/14.
//  Copyright (c) 2014 vincent178. All rights reserved.
//

#import "RCLoadingController.h"

@interface RCLoadingController ()

@end

@implementation RCLoadingController

- (void)awakeFromNib {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loadingIndicator.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)start {
    self.view.backgroundColor = [UIColor grayColor];
    self.loadingIndicator.hidden = NO;
    [self.loadingIndicator startAnimating];
}

- (void)dismiss {
    self.view.backgroundColor = [UIColor clearColor];
    [self.loadingIndicator stopAnimating];
    self.loadingIndicator.hidden = YES;
}

@end

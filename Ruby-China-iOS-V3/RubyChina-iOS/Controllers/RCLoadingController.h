//
//  RCLoadingController.h
//  RubyChina-iOS
//
//  Created by Liang Huang on 7/3/14.
//  Copyright (c) 2014 vincent178. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCLoadingController : UIViewController

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingIndicator;


- (void)start;
- (void)dismiss;

@end

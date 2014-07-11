//
//  RCTestController.m
//  RubyChina-iOS
//
//  Created by Liang Huang on 7/10/14.
//  Copyright (c) 2014 vincent178. All rights reserved.
//

#import "RCTestController.h"
@import CoreGraphics;

@interface RCTestController ()

@end

@implementation RCTestController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *subView = [[UIView alloc] initWithFrame:self.view.frame];
    
    [self.view addSubview:subView];
    
    
    subView.layer.backgroundColor = [UIColor grayColor].CGColor;
    subView.layer.cornerRadius = 20.0;
    subView.layer.frame = CGRectInset(subView.layer.frame, 20, 20);
    
    
    CALayer *subLayer = [CALayer layer];
    subLayer.delegate = self;
    
    subLayer.backgroundColor = [UIColor redColor].CGColor;
    subLayer.shadowOffset = CGSizeMake(10, 3);
    subLayer.shadowRadius = 5.0;
    subLayer.shadowColor = [UIColor blueColor].CGColor;
    subLayer.shadowOpacity = 0.8;
    subLayer.frame = CGRectMake(30, 30, 128, 192);
    [subView.layer addSublayer:subLayer];
    
    [subLayer setNeedsDisplay];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark - CALayer Delegate

@end

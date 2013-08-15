//
//  ViewController.m
//  RubyChina
//
//  Created by Vincent on 13-8-13.
//  Copyright (c) 2013年 Vincent. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 30, 30)];
    label.backgroundColor = [UIColor blackColor];
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  ViewController.m
//  Ruby-China-iOS
//
//  Created by Vincent on 13-10-10.
//  Copyright (c) 2013年 Vincent. All rights reserved.
//

#import "HomeController.h"

@interface HomeController ()

@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *labelContent = @"Ruby China";
    CGSize labelContentSize = [labelContent sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:11.0f]}];
    NSLog(@"Width: %f, Height: %f", labelContentSize.width, labelContentSize.height);
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 30, labelContentSize.width + 10.0f, 10.0f)];
    label.text = labelContent;
    label.font = [UIFont systemFontOfSize:11.0f];
    [self.view addSubview:label];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  TopicsViewController.m
//  RubyChina-for-IOS
//
//  Created by Vincent on 13-6-21.
//  Copyright (c) 2013年 Vincent. All rights reserved.
//

#import "TopicsViewController.h"

@interface TopicsViewController ()
@property (nonatomic, strong) UITableView *myTableView;
@end

@implementation TopicsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.myTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    [self.view addSubview:self.myTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

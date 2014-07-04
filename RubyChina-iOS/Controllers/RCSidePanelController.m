//
//  RCSidePanelController.m
//  RubyChina-iOS
//
//  Created by Liang Huang on 7/3/14.
//  Copyright (c) 2014 vincent178. All rights reserved.
//

#import "RCSidePanelController.h"

@interface RCSidePanelController ()

@end

@implementation RCSidePanelController

- (void)awakeFromNib {
    
    [self setLeftPanel:[self.storyboard instantiateViewControllerWithIdentifier:@"HomePageController"]];
    [self setCenterPanel:[self.storyboard instantiateViewControllerWithIdentifier:@"NavigationTopicsController"]];
}

- (UIBarButtonItem *)leftButtonForCenterPanel {
    
    UIImage *faceImage = [UIImage imageNamed:@"icon.jpg"];
    CGRect frame = CGRectMake(0, 2, 40, 40);
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.image = faceImage;
    imageView.layer.cornerRadius = faceImage.size.width / 2;
    imageView.layer.masksToBounds = YES;
    imageView.layer.borderWidth = 0;   
    
    UIButton *face = [UIButton buttonWithType:UIButtonTypeCustom];
    face.bounds = frame;
    face.backgroundColor = [UIColor clearColor];
    [face addTarget:self
             action:@selector(toggleLeftPanel:)
   forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:face];
    
    
    return [[UIBarButtonItem alloc] initWithCustomView:imageView];
}


- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

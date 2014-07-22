//
//  RCPaginationView.h
//  RubyChina-iOS
//
//  Created by Liang Huang on 6/28/14.
//  Copyright (c) 2014 vincent178. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCPaginationView : UIScrollView

@property (nonatomic, assign, readonly) NSInteger currentIndex;

@property (nonatomic, assign) NSInteger maxPageNumber;
@property (nonatomic, assign) NSInteger minPageNumber;

@property (nonatomic, strong) UIImage *selectedBackgroundImage;

- (void)selectIndex:(NSInteger)index;
- (void)reloadData;

@end

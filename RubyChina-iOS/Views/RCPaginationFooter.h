//
//  RCPaginationFooter.h
//  RubyChina-iOS
//
//  Created by Liang Huang on 7/12/14.
//  Copyright (c) 2014 vincent178. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RCPaginationView;

@protocol RCPaginationDelegate <NSObject>

- (void)currentIndexDidChange:(NSUInteger)index;

@end

@interface RCPaginationFooter : UIView

- (IBAction)previousTapped:(id)sender;
- (IBAction)nextTapped:(id)sender;

@property (weak, nonatomic) IBOutlet RCPaginationView *paginationView;

@property (nonatomic, weak) id<RCPaginationDelegate> delegate;


@end

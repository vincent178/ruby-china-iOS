//
//  RCPaginationFooter.m
//  RubyChina-iOS
//
//  Created by Liang Huang on 7/12/14.
//  Copyright (c) 2014 vincent178. All rights reserved.
//

#import "RCPaginationFooter.h"
#import "RCPaginationView.h"

@implementation RCPaginationFooter

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}




- (IBAction)previousTapped:(id)sender {
    
    if (self.paginationView.currentIndex > 1) {
        [self.paginationView selectIndex:self.paginationView.currentIndex-1];
        [self.delegate currentIndexDidChange:self.paginationView.currentIndex];
    }
    
}

- (IBAction)nextTapped:(id)sender {
    
    if (self.paginationView.currentIndex < 99) {
        [self.paginationView selectIndex:self.paginationView.currentIndex+1];
        [self.delegate currentIndexDidChange:self.paginationView.currentIndex];
    }
    
    
}
@end

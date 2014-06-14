//
//  RCTopicCellContent.m
//  Ruby-China-iOS
//
//  Created by Liang Huang on 6/7/14.
//  Copyright (c) 2014 vincent178. All rights reserved.
//

#import "RCTopicCellContent.h"

@implementation RCTopicCellContent

- (id)init {
    self = [super init];
    if (self) {
    }
    
    return self;
}

- (void)buildView {
    if (!self.titleString) {
        assert(@"Need title string before build the view");
    }
}

#pragma mark - Private

- (void)_prepareView {
    [self _prepareTitle];
}

- (void)_prepareTitle {
    UILabel *titleView = [[UILabel alloc] init];
    CGSize size = CGSizeMake(190, 0);
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:17.0]};
    CGRect expectedLabelRect = [self.titleString boundingRectWithSize:size
                                                              options:NSStringDrawingUsesLineFragmentOrigin
                                                           attributes:attributes context:nil];
    
    CGSize expectedLabelSize = expectedLabelRect.size;
    titleView.frame = CGRectMake(15, 10, expectedLabelSize.width, expectedLabelSize.height);
    titleView.text = self.titleString;
    
    [self addSubview:titleView];
}

@end

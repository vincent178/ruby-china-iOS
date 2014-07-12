//
//  UIView+findSuperView.m
//  RubyChina-iOS
//
//  Created by Liang Huang on 7/12/14.
//  Copyright (c) 2014 vincent178. All rights reserved.
//

#import "UIView+findSuperView.h"

@implementation UIView (findSuperView)

- (UIView *)findSuperViewWithClass:(Class)superViewClass {
    
    UIView *superView = self.superview;
    UIView *foundSuperView = nil;
    
    while (nil != superView && nil == foundSuperView) {
        if ([superView isKindOfClass:superViewClass]) {
            foundSuperView = superView;
        } else {
            superView = superView.superview;
        }
    }
    return foundSuperView;
}

@end

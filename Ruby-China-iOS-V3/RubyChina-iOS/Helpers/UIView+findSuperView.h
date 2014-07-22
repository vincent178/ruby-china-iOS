//
//  UIView+findSuperView.h
//  RubyChina-iOS
//
//  Created by Liang Huang on 7/12/14.
//  Copyright (c) 2014 vincent178. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (findSuperView)

- (UIView *)findSuperViewWithClass:(Class)superViewClass;

@end

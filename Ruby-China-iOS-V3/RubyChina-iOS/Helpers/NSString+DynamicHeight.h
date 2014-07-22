//
//  NSString+DynamicHeight.h
//  RubyChina-iOS
//
//  Created by Liang Huang on 7/2/14.
//  Copyright (c) 2014 vincent178. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DynamicHeight)

- (CGSize)sizeOfMultiLineLabelwithWidth:(NSInteger)width font:(UIFont *)font;

@end

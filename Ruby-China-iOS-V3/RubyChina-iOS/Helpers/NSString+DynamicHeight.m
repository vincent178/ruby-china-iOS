//
//  NSString+DynamicHeight.m
//  RubyChina-iOS
//
//  Created by Liang Huang on 7/2/14.
//  Copyright (c) 2014 vincent178. All rights reserved.
//

#import "NSString+DynamicHeight.h"

@implementation NSString (DynamicHeight)

- (CGSize)sizeOfMultiLineLabelwithWidth:(NSInteger)width font:(UIFont *)font {
    
    return [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                              options:NSStringDrawingUsesLineFragmentOrigin
                           attributes:@{NSFontAttributeName: font}
                              context:nil].size;
}

@end

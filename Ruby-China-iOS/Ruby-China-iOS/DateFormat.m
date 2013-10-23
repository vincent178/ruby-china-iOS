//
//  DateFormat.m
//  Ruby-China-iOS
//
//  Created by Liang Huang on 10/23/13.
//  Copyright (c) 2013 Vincent. All rights reserved.
//

#import "DateFormat.h"

@implementation DateFormat

- (NSString *)setTimeFormat:(NSString *)rawDate {
    NSString *result = nil;
    
    NSArray *components = [rawDate componentsSeparatedByString:@"T"];
    
    NSString *createdDateString = [components objectAtIndex:0];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    [dateFormatter setDateFormat:@"yyyy'-'MM'-'dd'"];
    NSDate *currentDate = [NSDate date];
    NSString *currentDateString = [dateFormatter stringFromDate:currentDate];
    
    if ([currentDateString isEqualToString:createdDateString]) {
        result = @"今天";
    } else {
        result = createdDateString;
    }
    
    return result;
}

@end

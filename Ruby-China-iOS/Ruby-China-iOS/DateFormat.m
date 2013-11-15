//
//  DateFormat.m
//  Ruby-China-iOS
//
//  Created by Liang Huang on 10/23/13.
//  Copyright (c) 2013 Vincent. All rights reserved.
//

#import "DateFormat.h"

@implementation DateFormat

+ (NSString *)setTimeFormat:(NSString *)rawDate {
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

+ (NSString *)timeAgo:(NSString *)rawDate {
    
    NSString *timeAgo;
    
    NSString *rawData = @"2013-11-13T23:21:32.200+08:00";
    NSArray *dataArray = [rawData componentsSeparatedByString:@"T"];
    NSLog(@"data array here is %@", dataArray);
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss.SSSZZZ"];
    
    NSDate *date = [dateFormatter dateFromString:rawData];
    NSNumber *dateNumber = [NSNumber numberWithDouble:[date timeIntervalSinceReferenceDate]];
    
    NSLog(@"Topic is %@", dateNumber);
    
    NSDate *dateNow = [NSDate date];
    NSNumber *dateNumberNow = [NSNumber numberWithDouble:[dateNow timeIntervalSinceReferenceDate]];
    NSLog(@"Time now is %@", dateNumberNow);
    
    int result = [dateNumberNow intValue] - [dateNumber intValue];
    NSLog(@"The result is %d", result);
    
    if (result / 60 < 1) {
        timeAgo = @"不到1分钟";
    } else if (result / 3600 < 1) {
        timeAgo = [NSString stringWithFormat:@"%d分钟前", result % 60];
    } else if (result / (3600 * 24) < 1) {
        timeAgo = [NSString stringWithFormat:@"%d小时前", result % 3600];
    } else {
        timeAgo = [NSString stringWithFormat:@"%d天前", result % 86400];
    }
    
    return timeAgo;
    
}

@end

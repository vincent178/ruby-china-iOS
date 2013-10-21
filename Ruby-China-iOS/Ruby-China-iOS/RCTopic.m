//
//  RCTopic.m
//  Ruby-China-iOS
//
//  Created by Liang Huang on 10/21/13.
//  Copyright (c) 2013 Vincent. All rights reserved.
//

#import "RCTopic.h"
#import "AFNetworking.h"

@implementation RCTopic

+ (void)findWithPage:(int)page perPage:(int)perPage async:(void (^)(NSArray *, NSError *))async {
    NSString *requestUrl = [NSString stringWithFormat:@"http://ruby-china.org/api/v2/topics.json?page=%d&per_page=%d", page, perPage];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:requestUrl parameters:nil success:^(AFHTTPRequestOperation *operation, NSArray *responseObject) {
        NSLog(@"%@", [responseObject class]);
        NSLog(@"%d", [responseObject count]);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"ERROR: %@", error);
    }];
}

@end

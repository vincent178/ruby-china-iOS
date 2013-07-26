//
//  RemoteEngine.m
//  RubyChina-for-IOS
//
//  Created by Vincent on 13-7-26.
//  Copyright (c) 2013年 Vincent. All rights reserved.
//

#import "RemoteEngine.h"

@implementation RemoteEngine

- (MKNetworkOperation *)login:(NSString *)username password:(NSString *)password {
    
    MKNetworkOperation *op = [self operationWithPath:[NSString stringWithFormat:@"account/sign_in.json"]
                              params:[NSDictionary dictionaryWithObjectsAndKeys:nil]
                              httpMethod:@"POST"];
    
    [self enqueueOperation:op];
    return op;
}

@end

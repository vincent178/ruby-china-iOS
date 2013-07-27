//
//  RemoteEngine.m
//  RubyChina-for-IOS
//
//  Created by Vincent on 13-7-26.
//  Copyright (c) 2013年 Vincent. All rights reserved.
//

#import "RemoteEngine.h"

@implementation RemoteEngine

- (MKNetworkOperation *) login:(NSString *)username password:(NSString *)password onCompletion:(MKNKResponseBlock)completionBlock onError:(MKNKResponseErrorBlock)errorBlock {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:username forKey:@"login"];
    [params setValue:password forKey:@"password"];
    MKNetworkOperation *op = [self operationWithPath:@"account/sign_in.json"
                              params:params
                                          httpMethod:@"POST"];
    [op addCompletionHandler:completionBlock errorHandler:errorBlock];
    op.postDataEncoding = MKNKPostDataEncodingTypeJSON;
    [self enqueueOperation:op];
    return op;
    
}

@end

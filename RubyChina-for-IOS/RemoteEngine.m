//
//  RemoteEngine.m
//  RubyChina-for-IOS
//
//  Created by Vincent on 13-7-26.
//  Copyright (c) 2013年 Vincent. All rights reserved.
//

#import "RemoteEngine.h"

@implementation RemoteEngine

- (MKNetworkOperation *) login:(NSString *)login
                      password:(NSString *)password
                  onCompletion:(MKNKResponseBlock)completionBlock
                       onError:(MKNKResponseErrorBlock)errorBlock {
    
    // Basic Authentication Header
    NSString *authStr = [NSString stringWithFormat:@"%@:%@", login, password];
    NSData *authData = [authStr dataUsingEncoding:NSUTF8StringEncoding];
    NSString *authHeader = [NSString stringWithFormat:@"Basic %@", [authData base64EncodedString]];
    NSMutableDictionary *headerFields = [NSMutableDictionary dictionary];
    [headerFields setValue:authHeader forKey:@"Authorization"];
    
    // Initialize operation
    MKNetworkOperation *op = [self operationWithPath:@"account/sign_in.json"
                                              params:nil
                                          httpMethod:@"POST"];
    [op addHeaders:headerFields];
    [op addCompletionHandler:completionBlock errorHandler:errorBlock];
    op.postDataEncoding = MKNKPostDataEncodingTypeJSON;
    
    // Add operation in Queue
    [self enqueueOperation:op];
    
    return op;
}

- (MKNetworkOperation *) getTopicsWithPage:(NSInteger)page
                             onCompletion:(MKNKResponseBlock)completionBlock
                                   onError:(MKNKResponseErrorBlock)errorBlock {
    
    MKNetworkOperation *op = [self operationWithPath:[NSString stringWithFormat:@"topics.json?page=%d", page]
                                              params:nil
                                          httpMethod:@"GET"];
    [op addCompletionHandler:completionBlock errorHandler:errorBlock];
    [self enqueueOperation:op];
    return op;
}

- (MKNetworkOperation *) getTopicWithTopicId:(NSUInteger)TopicId
                                onCompletion:(MKNKResponseBlock)completionBlock
                                     onError:(MKNKResponseErrorBlock)errorBlock {
    MKNetworkOperation *op = [self operationWithPath:[NSString stringWithFormat:@"topics/%d.json", TopicId]
                                              params:nil
                                          httpMethod:@"GET"];
    [op addCompletionHandler:completionBlock errorHandler:errorBlock];
    [self enqueueOperation:op];
    return op;
}

@end

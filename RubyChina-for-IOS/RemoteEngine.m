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
    
    MKNetworkOperation *op = [self operationWithPath:@"account/sign_in.json"
                                              params:nil
                                          httpMethod:@"POST"];
    [op addHeaders:headerFields];
    [op addCompletionHandler:completionBlock errorHandler:errorBlock];
    
    op.postDataEncoding = MKNKPostDataEncodingTypeJSON;
    [self enqueueOperation:op];
    
    return op;
}

@end

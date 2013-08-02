//
//  RemoteEngine.h
//  RubyChina-for-IOS
//
//  Created by Vincent on 13-7-26.
//  Copyright (c) 2013年 Vincent. All rights reserved.
//

#import "MKNetworkEngine.h"

@interface RemoteEngine : MKNetworkEngine

- (MKNetworkOperation *) login:(NSString *)login
                      password:(NSString *)password
                  onCompletion:(MKNKResponseBlock)completionBlock
                       onError:(MKNKResponseErrorBlock)errorBlock;

- (MKNetworkOperation *) getTopicsWithPage:(NSInteger)page
                             onCompletion:(MKNKResponseBlock)completionBlock
                                   onError:(MKNKResponseErrorBlock)errorBlock;

- (MKNetworkOperation *) getTopicWithTopicId:(NSUInteger)TopicId
                                onCompletion:(MKNKResponseBlock)completionBlock
                                     onError:(MKNKResponseErrorBlock)errorBlock;


@end

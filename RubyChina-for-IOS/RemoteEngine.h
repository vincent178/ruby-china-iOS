//
//  RemoteEngine.h
//  RubyChina-for-IOS
//
//  Created by Vincent on 13-7-26.
//  Copyright (c) 2013年 Vincent. All rights reserved.
//

#import "MKNetworkEngine.h"

@interface RemoteEngine : MKNetworkEngine

- (MKNetworkOperation *) login:(NSString *)username
                      password:(NSString *)password
                  onCompletion:(MKNKResponseBlock)completionBlock
                       onError:(MKNKResponseErrorBlock)errorBlock;

- (MKNetworkOperation *) createTopic:(NSString *)title body:(NSString *)body
                             NodeId:(NSNumber *)nodeId;

- (MKNetworkOperation *) topics:(NSNumber *)page;

- (MKNetworkOperation *) userTopics:(NSNumber *)page login:(NSString *)login;

- (MKNetworkOperation *) topic:(NSNumber *)topicId;

- (MKNetworkOperation *) createReply:(NSNumber *)topicId body:(NSString *)body;

- (MKNetworkOperation *) nodes;

- (MKNetworkOperation *) node:(NSNumber *)nodeId;

- (MKNetworkOperation *) user:(NSString *)username;


@end

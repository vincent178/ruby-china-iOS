//
//  RCAPIManager.h
//  RubyChina-iOS
//
//  Created by Liang Huang on 6/29/14.
//  Copyright (c) 2014 vincent178. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface RCAPIManager : NSObject

@property (nonatomic, strong, readonly) NSString *version;



+ (instancetype)shareAPIManager;


- (void)fetchTopicsListPageNumber:(NSInteger)page withPerPage:(NSInteger)perPage withType:(NSString *)type
                      withHandler:(void (^)(NSArray * resultsArray, NSError *error))successBlock;

- (void)fetchUserInfo:(NSString *)username withHandler:(void (^)(NSArray *userInfo, NSError *error))successBlock;

- (void)fetchTopicDetail:(NSInteger)topicID withHandler:(void(^)(NSDictionary *topicDetail, NSError *error))successBlock;

- (void)fetchNotificationsPageNumber:(NSInteger)page withPerPage:(NSInteger)perPage withToken:(NSString *)token
                         withHandler:(void (^)(NSArray *resultArray, NSError *error))successBlock;

@end

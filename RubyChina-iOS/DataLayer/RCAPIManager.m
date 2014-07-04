//
//  RCAPIManager.m
//  RubyChina-iOS
//
//  Created by Liang Huang on 6/29/14.
//  Copyright (c) 2014 vincent178. All rights reserved.
//

#import "RCAPIManager.h"
#import <AFNetworking/AFNetworking.h>

@interface RCAPIManager()

@property (nonatomic, strong) NSString *version;
@property (nonatomic, strong) NSString *apiURI;
@property (nonatomic, strong) NSString *endPoint;

@property (nonatomic, strong) AFHTTPRequestOperationManager *manager;

@end

@implementation RCAPIManager

+ (instancetype)shareAPIManager {
    static RCAPIManager *shareAPIManager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareAPIManager = [[self alloc] init];
    });
    
    return shareAPIManager;
}

- (id)init {
    self = [super init];
    
    if (self) {
        self.apiURI = @"https://ruby-china.org/api";
        self.version = @"v2";
        
        self.manager = [AFHTTPRequestOperationManager manager];
    }
    
    return self;
}

- (NSString *)urlWithEndPoint:(NSString *)endPoint {
    
    return [NSString stringWithFormat:@"%@/%@/%@", self.apiURI, self.version, endPoint];
}

#pragma mark -
#pragma mark - Topics API

/*
 * Get active topics list
 * params[:page]
 * params[:per_page] default is 30
 * params[:type] default is default, options are excellent no_reply popular last
 
 * Example
 * /api/v2/topics.json?page=15&per_page=15
 *
 */

- (void)fetchTopicsListPageNumber:(NSInteger)page withPerPage:(NSInteger)perPage withType:(NSString *)type
                      withHandler:(void (^)(NSArray * resultsArray, NSError *error))successBlock {
    
    NSString *url = [self urlWithEndPoint:@"topics.json"];
    
    if (!type) {
        type = @"default";
    }
    NSDictionary *params = @{@"page": @(page),
                             @"per_page": @(perPage),
                             @"type": type};
    
    NSLog(@"Connecting %@...", url);
    [self.manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"API Call Success: %@", operation.response);
        NSLog(@"API Response JSON: %@", responseObject);
        
        //TODO: change responseObject to NSArray
        NSArray *responseArray = (NSArray *)responseObject;
        
        successBlock(responseArray, nil);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"API Call Error: %@", error.userInfo);
        successBlock(nil, error);
    }];
    
}

/*
 * Get active topics of the specified node
 * params[:id] node id
 * params[:page]
 * params[:per_page] default is 15, maximum is 100
 * params[:type] default is default, options are excellent no_reply popular last
 
 * Example
 * /api/v2/topics/node/1.json?per_page=30
 */


/*
 * Get a single user
 
 * Example
 * /api/v2/users/qichunren.json
 */

- (void)fetchUserInfo:(NSString *)username withHandler:(void (^)(NSArray *, NSError *))successBlock {
    
    NSString *url = [self urlWithEndPoint:[NSString stringWithFormat:@"/users/%@.json", username]];
    
    NSLog(@"Connecting %@...", url);
    [self.manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"API Call Success: %@", operation.response);
        NSLog(@"API Response JSON: %@", responseObject);
        
        //TODO: change responseObject to NSArray
        NSArray *responseArray = (NSArray *)responseObject;
        
        successBlock(responseArray, nil);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"API Call Error: %@", error.userInfo);
        successBlock(nil, error);
    }];
    
}



@end

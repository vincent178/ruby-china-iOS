//
//  Node.h
//  RubyChina-for-IOS
//
//  Created by Vincent on 13-7-24.
//  Copyright (c) 2013年 Vincent. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

@interface Node : NSObject

@property (nonatomic, strong) User *followers;
@property (nonatomic, strong) NSString *name, *summary;
@property (nonatomic, strong) NSNumber *sort, *topicCount;
@property (nonatomic, strong) NSNumber *ID;

+ (Node *) initWithDictionary: (NSDictionary *)dict;
@end

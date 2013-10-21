//
//  RCNode.h
//  Ruby-China-iOS
//
//  Created by Liang Huang on 10/21/13.
//  Copyright (c) 2013 Vincent. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RCUser;

@interface RCNode : NSObject

@property (nonatomic, strong) RCUser *followers;
@property (nonatomic, strong) NSString *name, *summary;
@property (nonatomic, strong) NSNumber *sort, *topicsCount;

@end

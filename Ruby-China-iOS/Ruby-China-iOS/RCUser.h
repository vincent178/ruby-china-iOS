//
//  RCUser.h
//  Ruby-China-iOS
//
//  Created by Liang Huang on 10/21/13.
//  Copyright (c) 2013 Vincent. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RCTopic;
@class RCNote;
@class RCReply;
@class RCPhoto;
@class RCNode;

@interface RCUser : NSObject

@property (nonatomic, strong) NSString *login,*email, *name, *location,*company, *twitter, *bio, *website, *githubUrl, *avatarUrl,*tagline;
@property (nonatomic, assign) BOOL emailPublic;

@end

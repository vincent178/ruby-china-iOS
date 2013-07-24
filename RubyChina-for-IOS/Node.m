//
//  Node.m
//  RubyChina-for-IOS
//
//  Created by Vincent on 13-7-24.
//  Copyright (c) 2013年 Vincent. All rights reserved.
//

#import "Node.h"
#import "User.h"

@implementation Node

+ (Node *) initWithDictionary:(NSDictionary *)obj {
    Node *node = [[Node alloc] init];
    
    node.name = [obj objectForKey:@"name"];
    node.ID = [obj objectForKey:@"id"];
    
    return node;
}

@end

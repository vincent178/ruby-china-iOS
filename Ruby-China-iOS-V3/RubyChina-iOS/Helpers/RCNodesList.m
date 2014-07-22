//
//  RCNodesList.m
//  RubyChina-iOS
//
//  Created by Liang Huang on 7/7/14.
//  Copyright (c) 2014 vincent178. All rights reserved.
//

#import "RCNodesList.h"

@interface RCNodesList()

@property (nonatomic, strong) NSDictionary *nodesList;

@end

@implementation RCNodesList

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        
        static dispatch_once_t once;
        dispatch_once(&once, ^{
            
            self.nodesList = @{@1 : @"Ruby",
                               @2 : @"Rails",
                               @3 : @"Gem",
                               @4 : @"Python",
                               @5 : @"JavaScript",
                               @9 : @"MongoDB",
                               @10: @"Redis",
                               @11: @"Git",
                               @12: @"Database",
                               @17: @"Linux",
                               @18: @"Nginx",
                               @21: @"公告",
                               @22: @"反馈",
                               @23: @"社区开发",
                               @24: @"工具控",
                               @26: @"分享",
                               @27: @"瞎扯淡",
                               @28: @"其他",
                               @29: @"重构",
                               @30: @"产品控",
                               @31: @"RubyTuesday",
                               @32: @"iPhone",
                               @33: @"Android",
                               @34: @"Go",
                               @35: @"Erlang",
                               @37: @"Testing",
                               @38: @"书籍",
                               @39: @"搜索分词",
                               @40: @"算法",
                               @41: @"CSS",
                               @42: @"Mac",
                               @43: @"Sinatra",
                               @44: @"部署",
                               @45: @"RVM",
                               @46: @"Mailer",
                               @47: @"开源项目",
                               @48: @"Cocoa",
                               @50: @"插画",
                               @51: @"RubyConf",
                               @52: @"新手问题",
                               @53: @"数学",
                               @54: @"JRuby",
                               @55: @"运维",
                               @56: @"创业",
                               @57: @"线下活动",
                               @58: @"Clojure",
                               @59: @"Haskell",
                               @60: @"安全",
                               @62: @"移民",
                               @20: @"云服务",
                               @63: @"健康",
                               @64: @"求职",
                               @65: @"Elixir",
                               @66: @"mruby",
                               @67: @"Swift",
                               @61: @"NoPoint",
                               @25: @"招聘"};
            
        });
        
    }
    
    
    
    return self;
}

- (NSNumber *)nodeNamewithID:(NSNumber *)id {
    
    return self.nodesList[id];
    
}

- (NSString *)nodeIdwithName:(NSString *)name {
    
    return [self.nodesList allKeysForObject:name][0];
}

@end

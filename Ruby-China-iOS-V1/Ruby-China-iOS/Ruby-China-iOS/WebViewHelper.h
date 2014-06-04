//
//  WebViewHelper.h
//  Ruby-China-iOS
//
//  Created by Liang Huang on 10/24/13.
//  Copyright (c) 2013 Vincent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebViewHelper : NSObject

+ (CGFloat)getHeightOfWebView:(UIWebView *)webView;
+ (NSString *)setWebViewWithFont:(int)fontSize Html:(NSString *)html andId:(NSString *)id;

@end

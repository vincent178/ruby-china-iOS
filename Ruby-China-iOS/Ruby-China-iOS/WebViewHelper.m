//
//  WebViewHelper.m
//  Ruby-China-iOS
//
//  Created by Liang Huang on 10/24/13.
//  Copyright (c) 2013 Vincent. All rights reserved.
//

#import "WebViewHelper.h"

@implementation WebViewHelper

+ (CGFloat)getHeightOfWebView:(UIWebView *)webView {
    return webView.scrollView.contentSize.height;
}

+ (NSString *)setWebViewWithFont:(int)fontSize Html:(NSString *)html andId:(NSString *)id {
    return [NSString stringWithFormat:@"<div id=%@ style='font-size: %dpx;'> %@ </div>", id, fontSize, html];
}

@end

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
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"default_css" ofType:@"css"];
    NSData *cssData = [NSData dataWithContentsOfFile:filePath options:NSUTF8StringEncoding error:nil];
    NSString *css = [[NSString alloc] initWithData:cssData encoding:NSUTF8StringEncoding];
    
    return [NSString stringWithFormat:@"<!DOCTYPE html>"
            "<html>"
            "<head>"
            "<meta charset='utf-8'>"
            "<meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;'>"
            "<style>%@</style>"
            "</head>"
            "<body>"
            "<div id=%@ style='font-size: %dpx;'> %@ </div></body></html>", css, id, fontSize, html];
}

@end

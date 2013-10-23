//
//  ViewController.m
//  Ruby-China-iOS
//
//  Created by Vincent on 13-10-10.
//  Copyright (c) 2013年 Vincent. All rights reserved.
//

#import "HomeController.h"

@interface HomeController ()

@end

@implementation HomeController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    NSString *html_another = @"<p>文档里面写的很清楚。 <a href=\"http://postgresapp.com/documentation#toc_3\" rel=\"nofollow\" target=\"_blank\">http://postgresapp.com/documentation#toc_3</a> <br>\nIn <code>config/database.yml</code>, use the following settings: 31232132131231232132</p>\n<pre class=\"highlight yaml\"><span class=\"s\">development</span><span class=\"pi\">:</span>\n  <span class=\"s\">adapter</span><span class=\"pi\">:</span> <span class=\"s\">postgresql</span>\n  <span class=\"s\">database</span><span class=\"pi\">:</span> <span class=\"pi\">[</span><span class=\"nv\">YOUR_DATABASE_NAME</span><span class=\"pi\">]</span>\n  <span class=\"s\">host</span><span class=\"pi\">:</span> <span class=\"s\">localhost</span>\n</pre>";
    NSString *html = [NSString stringWithFormat:@"<div style='font-size: 11px;'> %@ </div>", html_another];

    
    [self.webView loadHTMLString:html baseURL:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

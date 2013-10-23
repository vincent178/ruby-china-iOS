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
    
    NSString *labelContent = @"Ruby China";
    CGSize labelContentSize = [labelContent sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:11.0f]}];
    NSLog(@"Width: %f, Height: %f", labelContentSize.width, labelContentSize.height);
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 30, labelContentSize.width + 10.0f, 10.0f)];
    label.text = labelContent;
    label.font = [UIFont systemFontOfSize:11.0f];
    [self.view addSubview:label];
    
    NSString *html = @"<p><a href=\"#reply1\" class=\"at_floor\" data-floor=\"1\">#1楼</a> <a href=\"/chunlea\" class=\"at_user\" title=\"@chunlea\"><i>@</i>chunlea</a> 谢谢，我看了这个，也试了，但是他让我输入用户名和密码，我不知道这个在哪里，因为我从没创建过postgresql的用户名和密码，不知道怎么回事？<br>\n我到Stackoverflow上查了下，说是有一个默认的用户名密码，但那是在使用homebrew安装的时候会有这个输入提示，直接使用postgres.app就没有这个提示，不知道这个用户名和密码来自于哪里？<br>\n我直接看这里：<a href=\"http://postgresapp.com/documentation#toc_3\" rel=\"nofollow\" target=\"_blank\">http://postgresapp.com/documentation#toc_3</a><br>\n他说“When Postgres.app first starts up, it creates the $USER database, which is the default database for psql when none is specified. The default user is $USER, with no password.”，难道是这个？但是我试了也不行啊！<br>\n谢谢！</p>";
    
    NSString *html_another = @"<p>文档里面写的很清楚。 <a href=\"http://postgresapp.com/documentation#toc_3\" rel=\"nofollow\" target=\"_blank\">http://postgresapp.com/documentation#toc_3</a> <br>\nIn <code>config/database.yml</code>, use the following settings:</p>\n<pre class=\"highlight yaml\"><span class=\"s\">development</span><span class=\"pi\">:</span>\n  <span class=\"s\">adapter</span><span class=\"pi\">:</span> <span class=\"s\">postgresql</span>\n  <span class=\"s\">database</span><span class=\"pi\">:</span> <span class=\"pi\">[</span><span class=\"nv\">YOUR_DATABASE_NAME</span><span class=\"pi\">]</span>\n  <span class=\"s\">host</span><span class=\"pi\">:</span> <span class=\"s\">localhost</span>\n</pre>";
    
    [self.webView loadHTMLString:html_another baseURL:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

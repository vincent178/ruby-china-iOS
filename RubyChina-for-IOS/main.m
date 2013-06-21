//
//  main.m
//  RubyChina-for-IOS
//
//  Created by Vincent on 13-6-21.
//  Copyright (c) 2013年 Vincent. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        NSString *urlAsString = @"http://ruby-china.org/api/topics.json";
        NSURL *url = [NSURL URLWithString:urlAsString];
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        
        [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:
         ^(NSURLResponse *response, NSData *data, NSError *error) {
             if ([data length] > 0 && error == nil) {
                 NSString *html = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                 NSLog(@"HTML = %@", html);
             } else if ([data length] == 0 && error == nil) {
                 NSLog(@"Nothing was downloaded.");
             } else if (error != nil) {
                 NSLog(@"Error happened = %@", error);
             }
             
         }];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}

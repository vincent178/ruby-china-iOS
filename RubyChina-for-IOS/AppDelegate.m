//
//  AppDelegate.m
//  RubyChina-for-IOS
//
//  Created by Vincent on 13-6-21.
//  Copyright (c) 2013年 Vincent. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    __strong NSString *myString = [[NSString alloc] initWithUTF8String:"String 1"];
    __weak NSString *anotherString = myString;
    
    NSLog(@"%@'s memory address is <%p>", myString, myString);
    
    myString = nil;
    __unsafe_unretained NSString *theirString = anotherString;
    
    NSLog(@"%@, %@, %@", myString, anotherString, theirString);
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    NSLog(@"String 1 = %@", self.string1);
    NSLog(@"String 2 = %@", self.string2);
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

@end

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
    
    __strong NSNumber *myNumber = @1;
    __weak NSNumber *anotherNumber = myNumber;
    
    myString = nil;
    myNumber = nil;
    __unsafe_unretained NSString *theirString = anotherString;
    __unsafe_unretained NSNumber *theirNumber = anotherNumber;
    
    NSLog(@"%@, %@, %@", myString, anotherString, theirString);
    NSLog(@"%@, %@, %@", myNumber, anotherNumber, theirNumber);
    
    NSLog(@"%@", @("This is a c string"));
    NSLog(@"This is a normal c number: %@", @(1));
    
//    int carray[] = { 12, 99, 42 };
//    NSArray *nsarray = @[@12, @99, @42];
    
//    NSLog(@"%d, %@", carray[1], nsarray[1]);
    
    NSMutableArray *nsarray = [@[@12, @99, @42] mutableCopy];
    NSLog(@"%@", nsarray[1]);
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"suspect"] = @"Colonel Mustard";
    dict[@"weapon"]  = @"Candlestick";
    dict[@"room"]    = @"Library";
    
    NSLog(@"%@", dict[@"room"]);
    
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

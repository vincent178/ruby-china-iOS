//
//  LoginController.m
//  Ruby-China-iOS
//
//  Created by Liang Huang on 11/17/13.
//  Copyright (c) 2013 Vincent. All rights reserved.
//

#import "LoginController.h"
#import "TopicsController.h"
#import "Preferences.h"
#import "AFHTTPRequestOperationManager.h"
#import "AFNetworkReachabilityManager.h"
#import "SVProgressHUD.h"

@interface LoginController ()

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.loginUserNameField.delegate = self;
    self.loginUserPasswordField.delegate = self;
    
   
    /* If user has login app, show the topics directlly */ 
    if ([Preferences privateToken]) {
        /* Show the topics view with presentviewcontroller method */
        TopicsController *topicsController = [[TopicsController alloc] init];
        UINavigationController *navigationController = [[UINavigationController alloc]
                                                        initWithRootViewController:topicsController];
        
        [self presentViewController:navigationController animated:YES completion:nil];
    }
}


- (IBAction)loginButtonClicked:(id)sender {
    NSString *login = self.loginUserNameField.text;
    NSString *password = self.loginUserPasswordField.text;
    
    if ([login isEqualToString:@""]) {
        
        // login is blank
        NSLog(@"login is %@", login);
        [SVProgressHUD showErrorWithStatus:@"用户名不能为空."];
    } else if ([password isEqualToString:@""]) {
        
        // password is blank
        NSLog(@"password is %@", password);
        [SVProgressHUD showErrorWithStatus:@"密码不能为空."];
    } else {
    
        [Preferences setLogin:login];
        /*
         * Codes used in login the ruby china forum
         */
        
        [SVProgressHUD showWithStatus:@"正在努力登录中..."];
        
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        NSDictionary *params = @{@"user": @{@"login": login, @"password": password}};
        
        [manager POST:@"http://ruby-china.org/account/sign_in.json" parameters:params
              success:^(AFHTTPRequestOperation *operation, id responseObject) {
                  
                  [SVProgressHUD showSuccessWithStatus:@"登录成功."];
                  [Preferences setPassword:password];
                  [Preferences setPrivateToken:[responseObject objectForKey:@"private_token"]];
                  [Preferences setAvatarUrl:[[responseObject objectForKey:@"avatar"] objectForKey:@"normal"]];
                  
                  NSLog(@"JSON: %@", responseObject);
                  
                  /* Show the topics view with presentviewcontroller method */
                  TopicsController *topicsController = [[TopicsController alloc] init];
                  UINavigationController *navigationController = [[UINavigationController alloc]
                                                                  initWithRootViewController:topicsController];
                  [self presentViewController:navigationController animated:YES completion:nil];
                  
              } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                  
                  [SVProgressHUD showErrorWithStatus:@"用户名或者密码错误"];
                  [self.view endEditing:YES];
                  NSLog(@"ERROR USER INFO is %@", error);
              }
         ];
    }
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

/*
 * Need to register within the app
 */
- (IBAction)registerButtonClicked:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://ruby-china.org/account/sign_up"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Login textfiled delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    [self loginButtonClicked:self];
    return YES;
}

@end

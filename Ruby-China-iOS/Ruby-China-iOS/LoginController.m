//
//  LoginController.m
//  Ruby-China-iOS
//
//  Created by Liang Huang on 11/17/13.
//  Copyright (c) 2013 Vincent. All rights reserved.
//

#import "LoginController.h"
#import "TopicsController.h"
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

}


- (IBAction)loginButtonClicked:(id)sender {
    NSString *login = self.loginUserNameField.text;
    NSString *password = self.loginUserPasswordField.text;
    
    
    
    /*
     * Codes used in login the ruby china forum
     */
    
    [SVProgressHUD showWithStatus:@"正在努力登录中..."];
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *params = @{@"user": @{@"login": login, @"password": password}};
    
    [manager POST:@"http://ruby-china.org/account/sign_in.json" parameters:params
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              
              [SVProgressHUD showSuccessWithStatus:@"登录成功."];
              
              NSLog(@"JSON: %@", responseObject);
              
              /* Show the topics view with presentviewcontroller method */
              TopicsController *topicsController = [[TopicsController alloc] init];
              UINavigationController *navigationController = [[UINavigationController alloc]
                                                              initWithRootViewController:topicsController];
              [self presentViewController:navigationController animated:YES completion:nil];
              
          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              
              [SVProgressHUD showErrorWithStatus:@"用户名或者密码错误"];
              NSLog(@"ERROR USER INFO is %@", error);
          }
     ];

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

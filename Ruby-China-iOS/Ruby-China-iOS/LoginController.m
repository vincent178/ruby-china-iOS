//
//  LoginController.m
//  Ruby-China-iOS
//
//  Created by Liang Huang on 11/17/13.
//  Copyright (c) 2013 Vincent. All rights reserved.
//

#import "LoginController.h"
#import "AFHTTPRequestOperationManager.h"

@interface LoginController ()

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.loginUserNameField.delegate = self;
    self.loginUserPasswordField.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Login textfiled delegate

- (IBAction)loginButtonClicked:(id)sender {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *params = @{@"user": @{@"login": self.loginUserNameField.text, @"password": self.loginUserPasswordField.text}};
    
    [manager POST:@"http://ruby-china.org/account/sign_in.json" parameters:params
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              NSLog(@"JSON: %@", responseObject);
          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              NSLog(@"JSON: %@", error);
          }
     ];
}
     
@end

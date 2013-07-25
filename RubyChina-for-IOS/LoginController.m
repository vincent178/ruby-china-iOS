//
//  LoginController.m
//  RubyChina-for-IOS
//
//  Created by Vincent on 13-7-25.
//  Copyright (c) 2013年 Vincent. All rights reserved.
//

#import "LoginController.h"

@interface LoginController ()

@end

@implementation LoginController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"";
    [[self navigationController] setNavigationBarHidden:YES];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]]];
    
    UIImageView *logoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]];
    logoView.frame = CGRectMake(60, 60, 200, 60);
    [self.view addSubview:logoView];
    
    self.loginField = [[UITextField alloc] initWithFrame:CGRectMake(35, 150, 255, 40)];
    self.loginField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.loginField.font = [UIFont systemFontOfSize:18.0f];
    self.loginField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.loginField.borderStyle = UITextBorderStyleRoundedRect;
    self.loginField.placeholder = @"用户名";
    
    self.loginField.tag = 1;
    self.loginField.delegate = self;
    [self.view addSubview:self.loginField];
    
    self.passwordField = [[UITextField alloc] initWithFrame:CGRectMake(35, 200, 255, 40)];
    self.passwordField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.passwordField.font = [UIFont systemFontOfSize:18.0f];
    self.passwordField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.passwordField.borderStyle = UITextBorderStyleRoundedRect;
    self.passwordField.placeholder = @"密码";
    self.passwordField.secureTextEntry = YES;
    self.passwordField.tag = 2;
    self.passwordField.delegate = self;
    [self.view addSubview:self.passwordField];
    
    self.loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.loginButton.frame = CGRectMake(35, 250, 255, 42);
    UIImage *bg = [[UIImage imageNamed:@"button.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(6, 6, 6, 6)];
    [self.loginButton setBackgroundImage:bg forState:UIControlStateNormal];
    [self.loginButton setTitle:@"登陆" forState:UIControlStateNormal];
    [self.loginButton setBackgroundColor:[UIColor clearColor]];
    [self.loginButton addTarget:self action:@selector(loginIsPressed:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:self.loginButton];
}

- (void) loginIsPressed: (UIButton *)sender {
    NSLog(@"Hello world");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  LoginController.h
//  RubyChina-for-IOS
//
//  Created by Vincent on 13-7-25.
//  Copyright (c) 2013年 Vincent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginController : UIViewController<UITextFieldDelegate>

@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UITextField *loginField;
@property (nonatomic, strong) UITextField *passwordField;

@end

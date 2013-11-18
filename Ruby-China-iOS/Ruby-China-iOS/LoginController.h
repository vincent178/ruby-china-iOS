//
//  LoginController.h
//  Ruby-China-iOS
//
//  Created by Liang Huang on 11/17/13.
//  Copyright (c) 2013 Vincent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *loginUserNameField;
@property (weak, nonatomic) IBOutlet UITextField *loginUserPasswordField;
- (IBAction)loginButtonClicked:(id)sender;
@end

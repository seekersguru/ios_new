//
//  WWLoginVC.m
//  WeddingWise
//
//  Created by Deepak Sharma on 5/20/15.
//  Copyright (c) 2015 DS. All rights reserved.
//

#import "WWLoginVC.h"
#import "WWRegistrationVC.h"
#import "UITextField+ADTextField.h"
#import "WWCommon.h"
#import "ViewController.h"
#import "WWCalendarView.h"
#import "AppDelegate.h"
#import "MyKnotList.h"
#import "WWVendorsVC.h"
#import "WWInboxListVC.h"
#import "WWInspireListVC.h"
#import "MyKnotList.h"
#import "WWForgotPassword.h"

@interface WWLoginVC ()

@end
//Client secret= r4c6Lvxfq99AGauizFsS-Ffw
//Bundle id: com.weddingwise.app



@implementation WWLoginVC


#pragma mark View life cycle methods:
- (void)viewDidLoad {
    //[self setTextFieldPlacehoder];
   
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];

    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"header_arrow"] forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, 30, 30);
    [button addTarget:self action:@selector(popView) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *customBarItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = customBarItem;
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    
    [self.navigationController.navigationBar setHidden:NO];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                             forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)popView{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark IBAction & utility methods:
-(void)dismissKeyboard {
    [_txtEmailAddress resignFirstResponder];
    [_txtPassword resignFirstResponder];
}
-(void)setTextFieldPlacehoder{
    [_txtEmailAddress setTextFieldPlaceholder:@"Email Address" withcolor:[UIColor whiteColor] withPadding:_txtEmailAddress];
    [_txtPassword setTextFieldPlaceholder:@"Password" withcolor:[UIColor whiteColor] withPadding:_txtPassword];
}
-(IBAction)btnSignInPressed:(id)sender{
    MyKnotList *myKnot=[[MyKnotList alloc]initWithNibName:@"MyKnotList" bundle:nil];
    [self.navigationController pushViewController:myKnot animated:YES];
}
-(IBAction)btnBackPressed:(id)sender{
    [self dismissKeyboard];
    [self.navigationController popViewControllerAnimated:YES];
}
-(BOOL)checkValidations{
    if (_txtEmailAddress.text && _txtEmailAddress.text.length == 0)
    {
        [[WWCommon getSharedObject]createAlertView:@"Wedding Wise" :@"Please enter email address" :nil :000 ];
        return YES;
    }
    if (_txtPassword.text && _txtPassword.text.length == 0)
    {
        [[WWCommon getSharedObject]createAlertView:@"Wedding Wise" :@"Please enter password" :nil :000 ];
        return YES;
    }
    return YES;
}
-(void)textFieldDidBeginEditing:(UITextField *)textField {
    [self toggleAnimation:textField];
}
- (void)toggleAnimation:(UITextField*)textField {
    
    
}
-(IBAction)btnGoogleLoginPressed:(id)sender{
}
-(void)textFieldDidEndEditing:(UITextField *)textField {
    [self toggleAnimation:textField];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField==_txtEmailAddress){
        [self.txtPassword becomeFirstResponder];
    }
    else if(textField==_txtPassword){
        [_txtPassword resignFirstResponder];
    }
    return YES;
}
-(IBAction)btnForgotPasswordPressed:(id)sender{
    WWForgotPassword *forgotPasowrd=[[WWForgotPassword alloc]initWithNibName:@"WWForgotPassword" bundle:nil];
    [self.navigationController pushViewController:forgotPasowrd animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

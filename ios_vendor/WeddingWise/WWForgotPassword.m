//
//  WWForgotPassword.m
//  WeddingWise
//
//  Created by Deepak Sharma on 5/31/15.
//  Copyright (c) 2015 DS. All rights reserved.
//

#import "WWForgotPassword.h"

@interface WWForgotPassword ()

@end

@implementation WWForgotPassword

- (void)viewDidLoad {
    
    [self setTextFieldPlacehoder];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
#pragma mark: IBAction & utility methods:
-(void)setTextFieldPlacehoder{
    [_txtEmailAddress setTextFieldPlaceholder:@"Email Address" withcolor:[UIColor darkGrayColor] withPadding:_txtEmailAddress];
}
-(void)dismissKeyboard {
    [_txtEmailAddress resignFirstResponder];
}
-(IBAction)btnSignInPressed:(id)sender{
    [_txtEmailAddress resignFirstResponder];
}
-(IBAction)btnBackPressed:(id)sender{
    [_txtEmailAddress resignFirstResponder];
    [self.navigationController popViewControllerAnimated:YES];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [_txtEmailAddress resignFirstResponder];
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

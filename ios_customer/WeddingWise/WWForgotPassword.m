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
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"header_arrow"] forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, 30, 30);
    [button addTarget:self action:@selector(popView) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *customBarItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = customBarItem;
    // Do any additional setup after loading the view from its nib.
}
-(void)popView{
    [self.navigationController popViewControllerAnimated:YES];
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

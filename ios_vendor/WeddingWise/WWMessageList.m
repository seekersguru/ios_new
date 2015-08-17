//
//  WWMessageList.m
//  WeddingWise
//
//  Created by Dotsquares on 6/11/15.
//  Copyright (c) 2015 DS. All rights reserved.
//

#import "WWMessageList.h"
#import "MessageListCell.h"
#import "WWMessageVC.h"

@interface WWMessageList ()

@end

@implementation WWMessageList

- (void)viewDidLoad {
    
     [self.navigationController.navigationBar setHidden:YES];
     [messageTable registerNib:[UINib nibWithNibName:@"MessageListCell" bundle:nil] forCellReuseIdentifier:@"MessageListCell"];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(IBAction)bidBtnClicked:(id)sender
{
    bidBtn.selected = YES;
    bookBtn.selected = NO;
    messageBtn.selected = NO;
    
    [UIView animateWithDuration:0.2 animations:^{
        selectorImageLeadingSpaceConstraint.constant = bidBtn.frame.origin.x;
        [self.view layoutIfNeeded];
    }];
    
}

-(IBAction)bookBtnClicked:(id)sender
{
    bidBtn.selected = NO;
    bookBtn.selected = YES;
    messageBtn.selected = NO;
    
    [UIView animateWithDuration:0.2 animations:^{
        selectorImageLeadingSpaceConstraint.constant = bookBtn.frame.origin.x;
        [self.view layoutIfNeeded];
    }];
}

-(IBAction)messageBtnClicked:(id)sender
{
    bidBtn.selected = NO;
    bookBtn.selected = NO;
    messageBtn.selected = YES;
    
    [UIView animateWithDuration:0.2 animations:^{
        selectorImageLeadingSpaceConstraint.constant = messageBtn.frame.origin.x;
        [self.view layoutIfNeeded];
    }];
}

#pragma mark - Tableview delegate/datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView==messageTable)
    {
        MessageListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MessageListCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }
    
    return nil;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WWMessageVC *messageVc = [[WWMessageVC alloc] initWithNibName:@"WWMessageVC" bundle:nil];
    
    [self.navigationController pushViewController:messageVc animated:YES];
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

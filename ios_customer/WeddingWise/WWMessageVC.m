//
//  WWMessageVC.m
//  WeddingWise
//
//  Created by Deepak Sharma on 6/5/15.
//  Copyright (c) 2015 DS. All rights reserved.
//

#import "WWMessageVC.h"
#import "SenderMsgCell.h"
#import "ReceiverMsgCell.h"

#define TYPE_A_MESSAGE_STR @"Type a message"

@interface WWMessageVC ()
{
    NSMutableDictionary *offscreenCells;
    
    NSMutableArray *chatArray;
    
    CGFloat maxChatTextWidth;
}

@end

@implementation WWMessageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setBackButtonToNavigationBar];
    [self setClipAndMenuButtonToNavigationBar];
    
    UIImage *faceImage = [UIImage imageNamed:@"back@arrow"];
    UIButton *face = [UIButton buttonWithType:UIButtonTypeCustom];
    face.bounds = CGRectMake( 0, 0, 20, 20 );//set bound as per you want
    [face addTarget:self action:@selector(backButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [face setImage:faceImage forState:UIControlStateNormal];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:face];
    self.navigationItem.leftBarButtonItem = backButton;
    
    UIImage *rightImage = [UIImage imageNamed:@"slicingbid_head_icon"];
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.bounds = CGRectMake( 0, 0, 20, 20 );//set bound as per you want
    [rightButton addTarget:self action:@selector(rightButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [rightButton setImage:rightImage forState:UIControlStateNormal];
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightBarButton;
    
    
    self.title = @"Username";
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    chatTextView.text = @"";
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [messageTable registerNib:[UINib nibWithNibName:@"SenderMsgCell" bundle:nil] forCellReuseIdentifier:@"SenderMsgCell"];
    [messageTable registerNib:[UINib nibWithNibName:@"ReceiverMsgCell" bundle:nil] forCellReuseIdentifier:@"ReceiverMsgCell"];
    
    offscreenCells = [NSMutableDictionary dictionary];
    
    [self fetchChatArray];
    [messageTable reloadData];
}

#pragma mark Set custom Back button to Navigationbar
- (void)setBackButtonToNavigationBar
{
    UIImage *backButtonImage = [UIImage imageNamed:@"backarrow"];
    CGRect buttonFrame = CGRectMake(0, 0, 44, 44);
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = buttonFrame;
    [button addTarget:self action:@selector(backBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [button setImage:backButtonImage forState:UIControlStateNormal];
    
    
    UIBarButtonItem *settingItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSpacer.width = -16;// it was -6 in iOS 6
    
    
    [self.navigationItem setLeftBarButtonItems:[NSArray arrayWithObjects:negativeSpacer, settingItem, nil]];
    
}
-(void)backButtonPressed{
    [self.navigationController popViewControllerAnimated:YES];

}
-(void)rightButtonPressed{

}
-(IBAction)backBtnClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark Set settings button to Navigationbar
-(void)setClipAndMenuButtonToNavigationBar
{
    UIImage *clipButtonImage = [UIImage imageNamed:@"attechment"];
    CGRect buttonFrame = CGRectMake(0, 0, 40, 44);
    
    UIButton *clipButton = [UIButton buttonWithType:UIButtonTypeCustom];
    clipButton.frame = buttonFrame;
    [clipButton addTarget:self action:@selector(clipButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [clipButton setImage:clipButtonImage forState:UIControlStateNormal];
    
    UIBarButtonItem *clipItem = [[UIBarButtonItem alloc] initWithCustomView:clipButton];
    
    
    UIImage *menuButtonImage = [UIImage imageNamed:@"other"];
    //CGRect buttonFrame = CGRectMake(0, 0, 44, 44);
    
    UIButton *menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
    menuButton.frame = buttonFrame;
    [menuButton addTarget:self action:@selector(menuButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [menuButton setImage:menuButtonImage forState:UIControlStateNormal];
    
    UIBarButtonItem *menuItem = [[UIBarButtonItem alloc] initWithCustomView:menuButton];
    
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSpacer.width = -16;// it was -6 in iOS 6
    
    
    [self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects:negativeSpacer, menuItem, clipItem, nil]];
}

-(void)clipButtonPressed
{
    
}

-(void)menuButtonPressed
{
    
}

-(void)fetchChatArray
{
    chatArray = [[NSMutableArray alloc] init];
    
    [chatArray addObject:@{@"message" : @"Time or slot, some unique identifier",
                           @"read_status" : @(YES),
                           @"sender" : @(NO),
                           @"date" : [NSDate date]}];
    
    [chatArray addObject:@{@"message" : @"Time or slot service",
                           @"read_status" : @(NO),
                           @"sender" : @(YES),
                           @"date" : [NSDate date]}];
    
    [chatArray addObject:@{@"message" : @"Time or slot",
                           @"read_status" : @(NO),
                           @"sender" : @(NO),
                           @"date" : [NSDate date]}];
    
    [chatArray addObject:@{@"message" : @"Service, Privacy Policy, Guest Policy",
                           @"read_status" : @(NO),
                           @"sender" : @(YES),
                           @"date" : [NSDate date]}];
    
    [chatArray addObject:@{@"message" : @"Service, Policy",
                           @"read_status" : @(NO),
                           @"sender" : @(YES),
                           @"date" : [NSDate date]}];
    
    [chatArray addObject:@{@"message" : @"Service, Policy, Guest",
                           @"read_status" : @(NO),
                           @"sender" : @(YES),
                           @"date" : [NSDate date]}];
    
    [chatArray addObject:@{@"message" : @"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.",
                           @"read_status" : @(NO),
                           @"sender" : @(NO),
                           @"date" : [NSDate date]}];
    
    [chatArray addObject:@{@"message" : @"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.",
                           @"read_status" : @(NO),
                           @"sender" : @(YES),
                           @"date" : [NSDate date]}];
}

-(IBAction)sendBtnClicked:(id)sender
{
    chatTextView.text = [chatTextView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    
    if([[chatTextView.text lowercaseString] isEqualToString:[TYPE_A_MESSAGE_STR lowercaseString]])
    {
        return;
    }
    
    if([chatTextView.text length]==0)
    {
        return;
    }
    
    chatTextView.text = @"";
    
    [chatTextView resignFirstResponder];
}


#pragma mark Tableview delegate/datasource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [chatArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSDictionary *dict = [chatArray objectAtIndex:indexPath.row];
    
    if(![dict[@"sender"] boolValue])
    {
        ReceiverMsgCell *cell = [offscreenCells objectForKey:@"ReceiverMsgCell"];
        if (!cell && cell.tag!=-1)
        {
            cell = [tableView dequeueReusableCellWithIdentifier:@"ReceiverMsgCell"];
            cell.tag = -1;
            [offscreenCells setObject:cell forKey:@"ReceiverMsgCell"];
        }
        
        //cell.chatMessageLbl.text = chatObj.messageBody;
        //cell.chatMessageLbl.preferredMaxLayoutWidth = tableView.bounds.size.width - 110.0;
        
        cell.chatMsgTxt.selectable = NO;
        cell.chatMsgTxt.text = dict[@"message"];
        cell.chatMsgTxt.font = [UIFont systemFontOfSize:14.0];
        //cell.chatMessageTxt.selectable = YES;
        
        
        maxChatTextWidth = self.view.bounds.size.width - 54.0;
        
        CGSize sizeThatFitsTextView = [cell.chatMsgTxt sizeThatFits:CGSizeMake(maxChatTextWidth, MAXFLOAT)];
        cell.chatMsgTxtWidthConstraint.constant = sizeThatFitsTextView.width;
        cell.chatMsgTxtHeightConstraint.constant = sizeThatFitsTextView.height;
        
        [cell setNeedsLayout];
        [cell layoutIfNeeded];
        
        // Get the actual height required for the cell
        CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
        
        // Add an extra point to the height to account for the cell separator, which is added between the bottom
        // of the cell's contentView and the bottom of the table view cell.
        //height += 1;
        
        /*if(height<55.0)
         {
         return 55.0;
         }*/
        
        return height;
    }
    else
    {
        SenderMsgCell *cell = [offscreenCells objectForKey:@"SenderMsgCell"];
        if (!cell && cell.tag!=-1)
        {
            cell = [tableView dequeueReusableCellWithIdentifier:@"SenderMsgCell"];
            cell.tag = -1;
            [offscreenCells setObject:cell forKey:@"SenderMsgCell"];
        }
        
        /*cell.chatMessageLbl.text = chatObj.messageBody;
         cell.chatMessageLbl.preferredMaxLayoutWidth = tableView.bounds.size.width - 110.0;*/
        
        cell.chatMsgTxt.selectable = NO;
        cell.chatMsgTxt.text = dict[@"message"];
        cell.chatMsgTxt.font = [UIFont systemFontOfSize:14.0];
        //cell.chatMessageTxt.preferredMaxLayoutWidth = tableView.bounds.size.width - 110.0;
        //cell.chatMessageTxt.selectable = YES;
        
        maxChatTextWidth = self.view.bounds.size.width - 54.0;
        
        CGSize sizeThatFitsTextView = [cell.chatMsgTxt sizeThatFits:CGSizeMake(maxChatTextWidth, MAXFLOAT)];
        cell.chatMsgTxtWidthConstraint.constant = sizeThatFitsTextView.width;
        cell.chatMsgTxtHeightConstraint.constant = sizeThatFitsTextView.height;
        
        [cell setNeedsLayout];
        [cell layoutIfNeeded];
        
        // Get the actual height required for the cell
        CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
        
        // Add an extra point to the height to account for the cell separator, which is added between the bottom
        // of the cell's contentView and the bottom of the table view cell.
        //∂height += 1;
        
        /*if(height<55.0)
         {
         return 55.0;
         }*/
        
        return height;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dict = [chatArray objectAtIndex:indexPath.row];
    
    if(![dict[@"sender"] boolValue])
    {
        ReceiverMsgCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ReceiverMsgCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        //cell.chatMessageLbl.text = chatObj.messageBody;
        cell.chatMsgTxt.selectable = NO;
        cell.chatMsgTxt.text = dict[@"message"];
        cell.chatMsgTxt.textColor = [UIColor blackColor];
        cell.chatMsgTxt.font = [UIFont systemFontOfSize:14.0];
        cell.chatMsgTxt.selectable = YES;
        cell.chatMsgTxt.scrollEnabled = NO;
        
        CGSize sizeThatFitsTextView = [cell.chatMsgTxt sizeThatFits:CGSizeMake(maxChatTextWidth, MAXFLOAT)];
        cell.chatMsgTxtWidthConstraint.constant = sizeThatFitsTextView.width;
        cell.chatMsgTxtHeightConstraint.constant = sizeThatFitsTextView.height;
        
        if([dict[@"read_status"] boolValue])
        {
            cell.readStatusImage.hidden = NO;
        }
        else
        {
            cell.readStatusImage.hidden = YES;
        }
        
        [cell layoutIfNeeded];
        
        return cell;
    }
    else
    {
        SenderMsgCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SenderMsgCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;        
        
        //cell.chatMessageLbl.text = chatObj.messageBody;
        cell.chatMsgTxt.selectable = NO;
        cell.chatMsgTxt.text = dict[@"message"];
        cell.chatMsgTxt.textColor = [UIColor blackColor];
        cell.chatMsgTxt.font = [UIFont systemFontOfSize:14.0];
        cell.chatMsgTxt.selectable = YES;
        cell.chatMsgTxt.scrollEnabled = NO;
        
        CGSize sizeThatFitsTextView = [cell.chatMsgTxt sizeThatFits:CGSizeMake(maxChatTextWidth, MAXFLOAT)];
        cell.chatMsgTxtWidthConstraint.constant = sizeThatFitsTextView.width;
        cell.chatMsgTxtHeightConstraint.constant = sizeThatFitsTextView.height;
        
        [cell layoutIfNeeded];
        
        return cell;
    }
    
    return nil;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


//Code from Brett Schumann
-(void) keyboardWillShow:(NSNotification *)note
{
    // get keyboard size and loctaion
    CGRect keyboardBounds;
    [[note.userInfo valueForKey:UIKeyboardFrameEndUserInfoKey] getValue: &keyboardBounds];
    NSNumber *duration = [note.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [note.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    
    // Need to translate the bounds to account for rotation.
    keyboardBounds = [self.view convertRect:keyboardBounds toView:nil];
    
    // animations settings
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:[duration doubleValue]];
    [UIView setAnimationCurve:[curve intValue]];
    
    chatBoxViewBottomSpaceConstraint.constant = keyboardBounds.size.height - 65.0;
    
    // commit animations
    [UIView commitAnimations];
    
    [self.view layoutIfNeeded];
    
    /*if (chatTableView.contentSize.height > chatTableView.frame.size.height)
     {
     CGPoint offset = CGPointMake(0, chatTableView.contentSize.height - chatTableView.frame.size.height);
     [chatTableView setContentOffset:offset animated:YES];
     }*/
    
}

-(void) keyboardWillHide:(NSNotification *)note
{
    
    NSNumber *duration = [note.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [note.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    
    
    // animations settings
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:[duration doubleValue]];
    [UIView setAnimationCurve:[curve intValue]];
    
    chatBoxViewBottomSpaceConstraint.constant = 0;
    
    // commit animations
    [UIView commitAnimations];
}

#pragma mark - UITextView delegate methods

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if([[textView.text lowercaseString] isEqualToString:[TYPE_A_MESSAGE_STR lowercaseString]])
    {
        textView.text = @"";
    }
    
    textView.textColor = [UIColor darkGrayColor];
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    textView.text = [textView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if([textView.text length]==0)
    {
        textView.text = [TYPE_A_MESSAGE_STR uppercaseString];
    }
    
    textView.textColor = [UIColor lightGrayColor];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
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

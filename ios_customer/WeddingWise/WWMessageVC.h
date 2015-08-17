//
//  WWMessageVC.h
//  WeddingWise
//
//  Created by Deepak Sharma on 6/5/15.
//  Copyright (c) 2015 DS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WWMessageVC : UIViewController
{
    IBOutlet UITableView *messageTable;
    IBOutlet UIView *chatBoxView;
    IBOutlet UITextView *chatTextView;
    IBOutlet NSLayoutConstraint *chatBoxViewBottomSpaceConstraint;
}

@end

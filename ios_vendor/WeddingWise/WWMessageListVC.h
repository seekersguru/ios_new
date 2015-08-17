//
//  WWMessageListVC.h
//  WeddingWise
//
//  Created by WeeTech Solution on 08/06/15.
//  Copyright (c) 2015 DS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WWMessageListVC : UIViewController
{
    IBOutlet UIButton *bidBtn;
    IBOutlet UIButton *bookBtn;
    IBOutlet UIButton *messageBtn;
    IBOutlet UIImageView *selectorImage;
    IBOutlet UITableView *userTable;
    IBOutlet NSLayoutConstraint *selectorImageLeadingSpaceConstraint;
}

@end

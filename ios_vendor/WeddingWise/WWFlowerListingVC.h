//
//  WWFlowerListingVC.h
//  WeddingWise
//
//  Created by Deepak Sharma on 5/13/15.
//  Copyright (c) 2015 DS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WWFlowerListingVC : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, weak)IBOutlet UITableView *tblFlower;

@end

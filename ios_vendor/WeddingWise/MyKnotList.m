//
//  ViewController.m
//  WeddingWise
//
//  Created by Deepak Sharma on 5/11/15.
//  Copyright (c) 2015 DS. All rights reserved.
//

#import "MyKnotList.h"
#import "myKnotCell.h"
#import "RDVTabBarController.h"
#import "RDVTabBarItem.h"

@interface MyKnotList ()

@end

@implementation MyKnotList

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo_new"]];
    
    if (self.rdv_tabBarController.tabBar.translucent) {
        UIEdgeInsets insets = UIEdgeInsetsMake(0,
                                               0,
                                               CGRectGetHeight(self.rdv_tabBarController.tabBar.frame),
                                               0);
        
        self.tblMyKnotList.contentInset = insets;
        self.tblMyKnotList.scrollIndicatorInsets = insets;
    }
    UIImage* image3 = [UIImage imageNamed:@"nav.png"];
    CGRect frameimg = CGRectMake(0, 0, image3.size.width, image3.size.height);
    UIButton *someButton = [[UIButton alloc] initWithFrame:frameimg];
    [someButton setBackgroundImage:image3 forState:UIControlStateNormal];
    [someButton setShowsTouchWhenHighlighted:YES];
    
    UIBarButtonItem *mailbutton =[[UIBarButtonItem alloc] initWithCustomView:someButton];
    self.navigationItem.rightBarButtonItem=mailbutton;
}
#pragma mark - Methods
- (void)configureCell:(myKnotCell *)cell forIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            cell.leftImage.image=[UIImage imageNamed:@"makeup"];
            [cell.leftButton setTitle:@"Makeup" forState:UIControlStateNormal];
            break;
        case 1:
            cell.leftImage.image=[UIImage imageNamed:@"bridal-fashion"];
            [cell.leftButton setTitle:@"Bridal Fashion" forState:UIControlStateNormal];
            break;
        case 2:
            cell.leftImage.image=[UIImage imageNamed:@"caters"];
            [cell.leftButton setTitle:@"Caterers" forState:UIControlStateNormal];
            break;
        case 3:
            cell.leftImage.image=[UIImage imageNamed:@"dsicjokey"];
            [cell.leftButton setTitle:@"Disc jockey" forState:UIControlStateNormal];
            break;
        case 4:
            cell.leftImage.image=[UIImage imageNamed:@"photogrphers"];
            [cell.leftButton setTitle:@"Photographer" forState:UIControlStateNormal];
            break;
        case 5:
            cell.leftImage.image=[UIImage imageNamed:@"invitation"];
            [cell.leftButton setTitle:@"Invitations" forState:UIControlStateNormal];
            break;
        case 6:
            cell.leftImage.image=[UIImage imageNamed:@"floweres"];
            [cell.leftButton setTitle:@"Flowers" forState:UIControlStateNormal];
            break;
        default:
            break;
    }
}
#pragma mark - Table view
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"myKnotCell";
    myKnotCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil];
        cell = [topLevelObjects objectAtIndex:0];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    self.tblMyKnotList.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self configureCell:cell forIndexPath:indexPath];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 108.0f;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

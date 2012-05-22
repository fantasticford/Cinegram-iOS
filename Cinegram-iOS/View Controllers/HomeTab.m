//
//  HomeTab.m
//  Cinegram-iOS
//
//  Created by David Ford on 17/05/2012.
//  Copyright (c) 2012 Me. All rights reserved.
//

#import "HomeTab.h"
#import "HomeTableCell.h"

@implementation HomeTab

@synthesize button1 = _button1;
@synthesize button2 = _button2;
@synthesize selectedSeg = _selectedSeg;
@synthesize swipeGestureRecognizerRight = _swipeGestureRecognizerRight;
@synthesize swipedCell = _swipedCell;
@synthesize deSwipedCell = _deSwipedCell;
@synthesize dragging = _dragging;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self viewStylings];
    self.selectedSeg = @"0";
    [self segWork];    
}

- (void)oneFingerSwiperight:(UISwipeGestureRecognizer *)recognizer
{ 
    CGPoint swipeLocation = [recognizer locationInView:self.tableView];
    NSIndexPath *swipedIndexPath = [self.tableView indexPathForRowAtPoint:swipeLocation];
    self.swipedCell = [NSString stringWithFormat:@"Cell %d", swipedIndexPath.section + 1];
    [self.tableView reloadData];
}

- (void)oneFingerSwipeleft:(UISwipeGestureRecognizer *)recognizer
{ 
    CGPoint swipeLocation = [recognizer locationInView:self.tableView];
    NSIndexPath *swipedIndexPath = [self.tableView indexPathForRowAtPoint:swipeLocation];
    self.deSwipedCell = [NSString stringWithFormat:@"Cell %d", swipedIndexPath.section + 1];
    [self.tableView reloadData];
}

- (void)segWork
{
    if([self.selectedSeg isEqualToString:@"0"]){
        self.button1.selected = TRUE;
        self.button2.selected = FALSE;
    } else {
        self.button1.selected = FALSE;
        self.button2.selected = TRUE;
    }
    [self.tableView reloadData];
}

- (IBAction)signOut:(id)sender {
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    [settings setObject:@"null" forKey:@"userEmail"];
    [settings setObject:@"null" forKey:@"userPassword"];
    [settings setObject:@"FALSE" forKey:@"userLoggedIn"];
    [settings synchronize];
    [self performSegueWithIdentifier:@"signOut" sender:sender];
}

- (IBAction)button1:(id)sender {
    self.selectedSeg = @"0";
    [self segWork];
}

- (IBAction)button2:(id)sender {
    self.selectedSeg = @"1";
    [self segWork]; 
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath; 
{
    if(indexPath.section == 9) return 200;
    else return 190;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"";
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 35;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 35)];
    headerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"ge_background.png"]];
    
    UIImageView *profileImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pr_userIcon.png"]];
    profileImage.frame = CGRectMake(5, 5, 25, 25);
    
    UILabel *profileName = [[UILabel alloc] initWithFrame:CGRectMake(35, 5, 200, 25)];
    profileName.backgroundColor = [UIColor clearColor];
    [profileName setFont:[UIFont boldSystemFontOfSize:12]];
    profileName.textColor = [UIColor colorWithRed:0.486 green:0.486 blue:0.486 alpha:1.];
    profileName.text = @"Profile Name";
    
    UILabel *postDate = [[UILabel alloc] initWithFrame:CGRectMake(265, 5, 50, 25)];
    postDate.backgroundColor = [UIColor clearColor];
    [postDate setFont:[UIFont boldSystemFontOfSize:12]];
    postDate.textColor = [UIColor colorWithRed:0.749 green:0.749 blue:0.749 alpha:1.];
    postDate.textAlignment = UITextAlignmentRight;
    postDate.text = @"24h";
    
    [headerView addSubview:profileImage];
    [headerView addSubview:profileName];
    [headerView addSubview:postDate];
    
    return headerView;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeTableCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"normCell"];
    
    NSString *cellNumber =  [NSString stringWithFormat:@"Cell %d", indexPath.section + 1];
    
    UISwipeGestureRecognizer *right = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(oneFingerSwiperight:)];    
    [right setDirection:UISwipeGestureRecognizerDirectionRight];
    [cell addGestureRecognizer:right];
    
    UISwipeGestureRecognizer *left = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(oneFingerSwipeleft:)];    
    [left setDirection:UISwipeGestureRecognizerDirectionLeft];
    [cell addGestureRecognizer:left];
    
    if([self.selectedSeg isEqualToString:@"0"]){
        cell.videoThumb.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"vd_sampleVideo.png"]];
        cell.videoCountLabel.text = @"1,908";
        cell.favCountLabel.text = @"25";
    } else {
        cell.videoThumb.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"vd_sampleVideo_2.png"]];
        cell.videoCountLabel.text = @"908";
        cell.favCountLabel.text = @"252";
    }
    
    cell.videoTitle.text = @"Video Name";
        
    UIImageView *cellBG = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 180)];
    cellBG.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"ge_background.png"]];
    
    [cell.viewProfile setTitle:@"" forState:UIControlStateNormal];
    [cell.commentVideo setTitle:@"" forState:UIControlStateNormal];
    [cell.commentVideo setTitle:@"" forState:UIControlStateNormal];

    [cell addSubview:cellBG];
    [cell sendSubviewToBack:cellBG];

    if([cellNumber isEqualToString:self.swipedCell] && [self.scrolling isEqualToString:@"FALSE"]){
        [UIView beginAnimations:@"fade out" context:nil];
        [UIView setAnimationDuration:0.5];
            cell.shareView.alpha = 1;
            cell.starButton.alpha = 1;
            cell.twitterShareButton.alpha = 1;
            cell.emailButton.alpha = 1;
            cell.starButton.frame = CGRectMake(100, 43, 34, 37);
            cell.twitterShareButton.frame = CGRectMake(69, 77, 39, 37);
            cell.emailButton.frame = CGRectMake(130, 77, 37, 37);
        [UIView commitAnimations];
        self.swipedCell = @"zoink";
    }
    
    if([cellNumber isEqualToString:self.deSwipedCell] || [self.scrolling isEqualToString:@"TRUE"]){
        [UIView beginAnimations:@"fade out" context:nil];
        [UIView setAnimationDuration:0.5];
            cell.shareView.alpha = 0;
            cell.starButton.alpha = 0;
            cell.twitterShareButton.alpha = 0;
            cell.emailButton.alpha = 0;
            cell.starButton.frame = CGRectMake(100, 56, 34, 37);
            cell.twitterShareButton.frame = CGRectMake(100, 56, 39, 37);
            cell.emailButton.frame = CGRectMake(100, 56, 37, 37);
        [UIView commitAnimations];
        self.deSwipedCell = @"zoink";
    }
    
    return cell;
}

- (void)viewStylings
{   
    UIImage *barLogoImage = [UIImage imageNamed: @"hm_navBarLogo.png"];
    UIImageView *navigationImage = [[UIImageView alloc] initWithImage: barLogoImage];
    self.navigationItem.titleView = navigationImage;
        
    self.view.backgroundColor = [UIColor clearColor];
    
    UIImage *selectedImage0 = [UIImage imageNamed:@"tb_1_down.png"];
    UIImage *unselectedImage0 = [UIImage imageNamed:@"tb_1_up.png"];
    
    UIImage *selectedImage1 = [UIImage imageNamed:@"tb_2_down.png"];
    UIImage *unselectedImage1 = [UIImage imageNamed:@"tb_2_up.png"];
    
    UIImage *selectedImage2 = [UIImage imageNamed:@"tb_3_down.png"];
    UIImage *unselectedImage2 = [UIImage imageNamed:@"tb_3_up.png"];
    
    UIImage *selectedImage3 = [UIImage imageNamed:@"tb_4_down.png"];
    UIImage *unselectedImage3 = [UIImage imageNamed:@"tb_4_up.png"];
    
    UIImage *selectedImage4 = [UIImage imageNamed:@"tb_5_down.png"];
    UIImage *unselectedImage4 = [UIImage imageNamed:@"tb_5_up.png"];
    
    UITabBar *tabBar = self.tabBarController.tabBar;
    UITabBarItem *item0 = [tabBar.items objectAtIndex:0];
    UITabBarItem *item1 = [tabBar.items objectAtIndex:1];
    UITabBarItem *item2 = [tabBar.items objectAtIndex:2];
    UITabBarItem *item3 = [tabBar.items objectAtIndex:3];
    UITabBarItem *item4 = [tabBar.items objectAtIndex:4];
    
    [item0 setFinishedSelectedImage:selectedImage0 withFinishedUnselectedImage:unselectedImage0];
    [item1 setFinishedSelectedImage:selectedImage1 withFinishedUnselectedImage:unselectedImage1];
    [item2 setFinishedSelectedImage:selectedImage2 withFinishedUnselectedImage:unselectedImage2];
    [item3 setFinishedSelectedImage:selectedImage3 withFinishedUnselectedImage:unselectedImage3];
    [item4 setFinishedSelectedImage:selectedImage4 withFinishedUnselectedImage:unselectedImage4];
}

- (void)viewDidUnload
{
    [self setButton1:nil];
    [self setButton2:nil];
    [self setSelectedSeg:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

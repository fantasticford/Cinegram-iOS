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
    
    cell.videoThumb.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"vd_sampleVideo.png"]];
    cell.videoThumb.frame = CGRectMake(5, 0, cell.videoThumb.frame.size.width, cell.videoThumb.frame.size.height);
    cell.videoThumb.imageView.image = [UIImage imageNamed:@""];
    
    UILabel *videoTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 200, 20)];
    videoTitle.shadowColor = [UIColor blackColor];
    videoTitle.shadowOffset = CGSizeMake(1, 1);
    videoTitle.textColor = [UIColor whiteColor];
    videoTitle.backgroundColor = [UIColor clearColor];
    videoTitle.font = [UIFont boldSystemFontOfSize:12];
    videoTitle.text = @"Video Name";
        
    UIImageView *cellBG = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 180)];
    cellBG.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"ge_background.png"]];
    
    cell.shareView.frame = CGRectMake(0, 135, 320, 54);
    
    UIView *videoWatchCount = [[UIView alloc] initWithFrame:CGRectMake(247, 0, 65, 53)];
    UILabel *videoCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 60, 35)];
    videoCountLabel.text = @"1,908";
    videoCountLabel.textColor = [UIColor whiteColor];
    videoCountLabel.shadowColor = [UIColor blackColor];
    videoCountLabel.shadowOffset = CGSizeMake(1, 1);
    videoCountLabel.font = [UIFont boldSystemFontOfSize:16];
    videoCountLabel.backgroundColor = [UIColor clearColor];
    [videoWatchCount addSubview:videoCountLabel];
    videoWatchCount.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"hm_viewsCount.png"]];
    
    UIView *favCount = [[UIView alloc] initWithFrame:CGRectMake(247, 61, 65, 53)];
    UILabel *favCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 60, 35)];
    favCountLabel.text = @"25";
    favCountLabel.textColor = [UIColor whiteColor];
    favCountLabel.shadowColor = [UIColor blackColor];
    favCountLabel.shadowOffset = CGSizeMake(1, 1);
    favCountLabel.font = [UIFont boldSystemFontOfSize:16];
    favCountLabel.backgroundColor = [UIColor clearColor];
    [favCount addSubview:favCountLabel];

    favCount.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"hm_favsCount.png"]];
    
    UIButton *viewProfile = [[UIButton alloc] initWithFrame:CGRectMake(247, 121, 65, 53)];
    viewProfile.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"hm_viewProfile.png"]];
    [viewProfile setTitle: @"" forState: UIControlStateSelected];
    
    UIButton *fanVideo = [[UIButton alloc] initWithFrame:CGRectMake(5, 154, 115, 20)];
    fanVideo.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"hm_likeButton.png"]];
    
    UIButton *addComment = [[UIButton alloc] initWithFrame:CGRectMake(125, 154, 115, 20)];
    addComment.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"hm_commentButton.png"]];

    [cell addSubview:videoTitle];
    [cell addSubview:videoWatchCount];
    [cell addSubview:favCount];
    [cell addSubview:viewProfile];
    [cell addSubview:fanVideo];
    [cell addSubview:addComment];
    [cell addSubview:cellBG];
    
    [cell sendSubviewToBack:videoWatchCount];
    [cell sendSubviewToBack:favCount];
    [cell sendSubviewToBack:viewProfile];
    [cell sendSubviewToBack:fanVideo];
    [cell sendSubviewToBack:addComment];
    [cell sendSubviewToBack:cellBG];
    
    if([cellNumber isEqualToString:self.swipedCell] && [self.scrolling isEqualToString:@"FALSE"]){
        [UIView beginAnimations:@"fade out" context:nil];
        [UIView setAnimationDuration:0.5];
        cell.shareView.alpha = 1;
        [UIView commitAnimations];
        self.swipedCell = @"zoink";
    }
    
    if([cellNumber isEqualToString:self.deSwipedCell] || [self.scrolling isEqualToString:@"TRUE"]){
        [UIView beginAnimations:@"fade out" context:nil];
        [UIView setAnimationDuration:0.5];
        cell.shareView.alpha = 0;
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

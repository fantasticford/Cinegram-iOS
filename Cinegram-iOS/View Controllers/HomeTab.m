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
    NSLog(@"%@", self.swipedCell);
}

- (void)oneFingerSwipeleft:(UISwipeGestureRecognizer *)recognizer
{ 
    CGPoint swipeLocation = [recognizer locationInView:self.tableView];
    NSIndexPath *swipedIndexPath = [self.tableView indexPathForRowAtPoint:swipeLocation];
    self.deSwipedCell = [NSString stringWithFormat:@"Cell %d", swipedIndexPath.section + 1];
    [self.tableView reloadData];
    NSLog(@"%@", self.deSwipedCell);
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
    return 190;
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
    
    cell.contentView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"ge_background.png"]];

    UISwipeGestureRecognizer *right = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(oneFingerSwiperight:)];    
    [right setDirection:UISwipeGestureRecognizerDirectionRight];
    [cell addGestureRecognizer:right];
    
    UISwipeGestureRecognizer *left = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(oneFingerSwipeleft:)];    
    [left setDirection:UISwipeGestureRecognizerDirectionLeft];
    [cell addGestureRecognizer:left];
    
    cell.videoThumb.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"vd_videoBackground.png"]];
    cell.videoThumb.frame = CGRectMake(5, 0, cell.videoThumb.frame.size.width, cell.videoThumb.frame.size.height);

    UIView *shareView = [[UIView alloc] initWithFrame:CGRectMake(0, 136, 320, 54)];
    shareView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"sh_BG.png"]];
    
    UIButton *tweetButton = [UIButton buttonWithType:UIButtonTypeCustom];
    tweetButton.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"sh_twitter.png"]];
    tweetButton.frame = CGRectMake(90, 13, 32, 27);
    
    UIButton *favButton = [UIButton buttonWithType:UIButtonTypeCustom];
    favButton.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"sh_star.png"]];
    favButton.frame = CGRectMake(145, 10, 35, 33);
    
    UIButton *emailButton = [UIButton buttonWithType:UIButtonTypeCustom];
    emailButton.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"sh_mail.png"]];
    emailButton.frame = CGRectMake(205, 17, 28, 23);
    
    [shareView addSubview:tweetButton];
    [shareView addSubview:favButton];
    [shareView addSubview:emailButton];
    
    cell.shareView.frame = CGRectMake(0, 136, 320, 54);
    
    UIView *videoWatchCount = [[UIView alloc] initWithFrame:CGRectMake(262, 0, 50, 45)];
    videoWatchCount.backgroundColor = [UIColor colorWithRed:0.365 green:0.365 blue:0.365 alpha:1.];
    
    UIView *favCount = [[UIView alloc] initWithFrame:CGRectMake(262, 53, 50, 45)];
    favCount.backgroundColor = [UIColor colorWithRed:0.365 green:0.365 blue:0.365 alpha:1.];
    
    UIButton *viewProfile = [[UIButton alloc] initWithFrame:CGRectMake(262, 105, 50, 45)];
    viewProfile.backgroundColor = [UIColor colorWithRed:0.365 green:0.365 blue:0.365 alpha:1.];
    
    UIButton *fanVideo = [[UIButton alloc] initWithFrame:CGRectMake(5, 155, 75, 20)];
    fanVideo.backgroundColor = [UIColor colorWithRed:0.365 green:0.365 blue:0.365 alpha:1.];

    UIButton *addComment = [[UIButton alloc] initWithFrame:CGRectMake(85, 155, 75, 20)];
    addComment.backgroundColor = [UIColor colorWithRed:0.365 green:0.365 blue:0.365 alpha:1.];

    [cell addSubview:videoWatchCount];
    [cell addSubview:favCount];
    [cell addSubview:viewProfile];
    //[cell addSubview:fanVideo];
    //[cell addSubview:addComment];
    
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

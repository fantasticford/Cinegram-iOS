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
    self.swipedCell = [NSString stringWithFormat:@"%d", swipedIndexPath.row];
    [self.tableView reloadData];
}

- (void)oneFingerSwipeleft:(UISwipeGestureRecognizer *)recognizer
{ 
    CGPoint swipeLocation = [recognizer locationInView:self.tableView];
    NSIndexPath *swipedIndexPath = [self.tableView indexPathForRowAtPoint:swipeLocation];
    self.deSwipedCell = [NSString stringWithFormat:@"%d", swipedIndexPath.row];
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
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath; 
{
    return 150;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeTableCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"normCell"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"Cell %d", indexPath.row + 1];
    cell.contentView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"ge_background.png"]];

    UISwipeGestureRecognizer *right = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(oneFingerSwiperight:)];    
    [right setDirection:UISwipeGestureRecognizerDirectionRight];
    [cell addGestureRecognizer:right];
    
    UISwipeGestureRecognizer *left = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(oneFingerSwipeleft:)];    
    [left setDirection:UISwipeGestureRecognizerDirectionLeft];
    [cell addGestureRecognizer:left];

    cell.shareView.frame = CGRectMake(0, 96, cell.shareView.frame.size.width, cell.shareView.frame.size.height);
    
    NSString *curCell = [NSString stringWithFormat:@"%d", indexPath.row];
    if([curCell isEqualToString:self.swipedCell]){
        [UIView beginAnimations:@"fade out" context:nil];
        [UIView setAnimationDuration:0.5];
        cell.shareView.alpha = 1;
        [UIView commitAnimations];
        
        self.swipedCell = @"zoink";
    }
    
    if([curCell isEqualToString:self.deSwipedCell]){
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

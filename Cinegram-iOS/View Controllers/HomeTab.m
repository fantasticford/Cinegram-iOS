//
//  HomeTab.m
//  Cinegram-iOS
//
//  Created by David Ford on 17/05/2012.
//  Copyright (c) 2012 Me. All rights reserved.
//

#import "HomeTab.h"

@implementation HomeTab

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self viewStylings];
	// Do any additional setup after loading the view.
}

- (void)viewStylings
{
    [UIView beginAnimations:@"fade out" context:nil];
    [UIView setAnimationDuration:2.0];
    //loadingView.alpha = 0;
    [UIView commitAnimations];
    
    UIImage *barLogoImage = [UIImage imageNamed: @"hm_navBarLogo.png"];
    UIImageView *navigationImage = [[UIImageView alloc] initWithImage: barLogoImage];
    self.navigationItem.titleView = navigationImage;

    [self.tabBarController.tabBar setBackgroundImage:[UIImage imageNamed:@"ge_tabBarBG .png"]];
    
    self.view.backgroundColor = [UIColor clearColor];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath; 
{
    return 55;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"normCell"];
    cell.textLabel.text = @"Hello";
    return cell;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

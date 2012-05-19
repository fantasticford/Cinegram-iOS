//
//  MyVideosTab.m
//  Cinegram-iOS
//
//  Created by David Ford on 18/05/2012.
//  Copyright (c) 2012 Me. All rights reserved.
//

#import "MyVideosTab.h"

@implementation MyVideosTab

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self viewStylings];
}

- (void)viewStylings
{   
    self.view.backgroundColor = [UIColor clearColor];

    UIImage *barLogoImage = [UIImage imageNamed: @"my_navBarLogo.png"];
    UIImageView *navigationImage = [[UIImageView alloc] initWithImage: barLogoImage];
    self.navigationItem.titleView = navigationImage;
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

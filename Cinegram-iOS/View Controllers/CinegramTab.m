//
//  CinegramTab.m
//  Cinegram-iOS
//
//  Created by David Ford on 18/05/2012.
//  Copyright (c) 2012 Me. All rights reserved.
//

#import "CinegramTab.h"

@implementation CinegramTab

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self viewStylings];
}

- (void)viewStylings
{   
    self.view.backgroundColor = [UIColor clearColor];
    
    UIImage *barLogoImage = [UIImage imageNamed: @"ab_navBarLogo.png"];
    UIImageView *navigationImage = [[UIImageView alloc] initWithImage: barLogoImage];
    self.navigationItem.titleView = navigationImage;
}


- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

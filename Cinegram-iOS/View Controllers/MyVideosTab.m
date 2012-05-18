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
    self.view.backgroundColor = [UIColor clearColor];

	// Do any additional setup after loading the view.
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

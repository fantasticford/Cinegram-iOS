//
//  IntroCheck.m
//  Cinegram-iOS
//
//  Created by David Ford on 17/05/2012.
//  Copyright (c) 2012 Me. All rights reserved.
//

#import "IntroCheck.h"

@implementation IntroCheck

@synthesize defaultImage = _defaultImage;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [UIView beginAnimations:@"fade out" context:nil];
    [UIView setAnimationDuration:2.0];
    self.defaultImage.alpha = 0;
    [UIView commitAnimations];
    
    [self skipLoad];
	// Do any additional setup after loading the view.
}

- (void)skipLoad
{
    NSLog(@"Skip");
    [self performSegueWithIdentifier:@"skipLogIn" sender:self];
}

- (void)viewDidUnload
{
    [self setDefaultImage:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

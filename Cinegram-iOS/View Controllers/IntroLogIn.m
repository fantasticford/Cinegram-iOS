//
//  IntroLogIn.m
//  Cinegram-iOS
//
//  Created by David Ford on 18/05/2012.
//  Copyright (c) 2012 Me. All rights reserved.
//

#import "IntroLogIn.h"

@implementation IntroLogIn

@synthesize logInSuccess = _logInSuccess;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    NSString *loggedIn = [settings objectForKey:@"userLoggedIn"];
    if([loggedIn isEqualToString:@"TRUE"]) [self performSegueWithIdentifier:@"logInComplete" sender:self];
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

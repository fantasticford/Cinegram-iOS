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
    
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    NSString *loggedIn = [settings objectForKey:@"userLoggedIn"];
    if([loggedIn isEqualToString:@"TRUE"]) [self skipLoad];
    else[self logIn];
}

- (void)skipLoad
{
    NSLog(@"Skip");
    [self performSegueWithIdentifier:@"skipLogIn" sender:self];
}

- (void)logIn
{
    NSLog(@"Log In");
    [self performSegueWithIdentifier:@"logIn" sender:self];
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

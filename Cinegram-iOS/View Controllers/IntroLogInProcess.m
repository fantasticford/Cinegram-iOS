//
//  IntroLogInProcess.m
//  Cinegram-iOS
//
//  Created by David Ford on 21/05/2012.
//  Copyright (c) 2012 Me. All rights reserved.
//

#import "IntroLogInProcess.h"

@implementation IntroLogInProcess

@synthesize logInEmail = _logInEmail;
@synthesize logInPassword = _logInPassword;
@synthesize failedLogIn = _failedLogIn;
@synthesize logInSuccess = _logInSuccess;
@synthesize processIndicator = _processIndicator;
@synthesize loadingGraphic = _loadingGraphic;
@synthesize loadingSpinner = _loadingSpinner;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.failedLogIn.alpha = 0;
    self.loadingGraphic.alpha = 0;
    self.loadingSpinner.alpha = 0;
    [self.logInEmail becomeFirstResponder];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setLogInEmail:nil];
    [self setLogInPassword:nil];
    [self setProcessIndicator:nil];
    [self setLoadingGraphic:nil];
    [self setLoadingSpinner:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)cancelButton:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)formDone:(id)sender {
    NSString *logIn = @"TRUE";
    
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    [settings setObject:self.logInEmail forKey:@"userEmail"];
    [settings setObject:self.logInPassword forKey:@"userPassword"];
    [settings setObject:@"TRUE" forKey:@"userLoggedIn"];
    [settings synchronize];
    
    if([logIn isEqualToString:@"TRUE"]){
        [self.logInPassword resignFirstResponder];
        self.failedLogIn.alpha = 0;
        self.loadingGraphic.alpha = 1;
        self.loadingSpinner.alpha = 1;
        [self dismissModalViewControllerAnimated:YES];
    } else {
        [UIView beginAnimations:@"fade out" context:nil];
        [UIView setAnimationDuration:1.0];
        self.failedLogIn.alpha = 1;
        [UIView commitAnimations];
    };
}

@end

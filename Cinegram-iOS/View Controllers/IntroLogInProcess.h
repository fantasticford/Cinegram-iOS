//
//  IntroLogInProcess.h
//  Cinegram-iOS
//
//  Created by David Ford on 21/05/2012.
//  Copyright (c) 2012 Me. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IntroLogInProcess : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *logInEmail;
@property (strong, nonatomic) IBOutlet UITextField *logInPassword;
@property (strong, nonatomic) IBOutlet UIImageView *failedLogIn;
@property (strong, nonatomic) IBOutlet NSString *logInSuccess;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *processIndicator;
@property (strong, nonatomic) IBOutlet UIImageView *loadingGraphic;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *loadingSpinner;

- (IBAction)cancelButton:(id)sender;
- (IBAction)formDone:(id)sender;

@end

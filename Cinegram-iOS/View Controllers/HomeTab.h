//
//  HomeTab.h
//  Cinegram-iOS
//
//  Created by David Ford on 17/05/2012.
//  Copyright (c) 2012 Me. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PullRefreshTableViewController.h"

@interface HomeTab : PullRefreshTableViewController <UIGestureRecognizerDelegate>

@property (strong, nonatomic) IBOutlet UIButton *button1;
@property (strong, nonatomic) IBOutlet UIButton *button2;
@property (strong, nonatomic) IBOutlet NSString *selectedSeg;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeGestureRecognizerRight;
@property (strong, nonatomic) IBOutlet NSString *swipedCell;
@property (strong, nonatomic) IBOutlet NSString *deSwipedCell;

- (IBAction)button1:(id)sender;
- (IBAction)button2:(id)sender;
- (void)viewStylings;
- (void)segWork;

@end

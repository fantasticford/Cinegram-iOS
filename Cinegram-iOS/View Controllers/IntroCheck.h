//
//  IntroCheck.h
//  Cinegram-iOS
//
//  Created by David Ford on 17/05/2012.
//  Copyright (c) 2012 Me. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IntroCheck : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *defaultImage;

- (void)skipLoad;
- (void)logIn;

@end

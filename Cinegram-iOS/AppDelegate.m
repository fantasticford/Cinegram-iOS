//
//  AppDelegate.m
//  Cinegram-iOS
//
//  Created by David Ford on 17/05/2012.
//  Copyright (c) 2012 Me. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    UINavigationBar *navigationBarProxy = [UINavigationBar appearance];
    
    // Set the background of the navigation bar
    UIImage *backgroundImage = [UIImage imageNamed:@"ge_navBar.png"];
    
    NSMutableDictionary *titleTextProperties = [NSMutableDictionary dictionary];
    [titleTextProperties setValue:[UIColor colorWithRed:0.400 green:0.400 blue:0.400 alpha:1] forKey:UITextAttributeTextColor];
    [titleTextProperties setValue:[NSValue valueWithUIOffset:UIOffsetMake(0.0, 0.0)] forKey:UITextAttributeTextShadowOffset];
    [[UINavigationBar appearance] setTitleTextAttributes:titleTextProperties];
    
    [navigationBarProxy setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
        
    // Set the default tint for all bar button items
    UIColor *tintColour = [UIColor colorWithRed:1.000 green:1.000 blue:1.000 alpha:1.];
    [[UIBarButtonItem appearance] setTintColor:tintColour];
    
    // The chosen font has unusual padding so finally adjust the offsets
    UIOffset titleOffset = UIOffsetMake(0, 0);
    [[UIBarButtonItem appearance] setTitlePositionAdjustment:titleOffset forBarMetrics:UIBarMetricsDefault];
    
    NSMutableDictionary *buttonAttributes = [NSMutableDictionary dictionary];
    [buttonAttributes setValue:[UIFont boldSystemFontOfSize:12] forKey:UITextAttributeFont];
    [buttonAttributes setValue:[UIColor colorWithRed:0.400 green:0.400 blue:0.400 alpha:1] forKey:UITextAttributeTextColor];
    [buttonAttributes setValue:[NSValue valueWithUIOffset:UIOffsetMake(0.0, 0.0)] forKey:UITextAttributeTextShadowOffset];
    [[UIBarButtonItem appearance] setTitleTextAttributes:buttonAttributes forState:UIControlStateNormal];
    
    self.window.backgroundColor = [UIColor colorWithRed:1.000 green:1.000 blue:1.000 alpha:1];
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque animated:YES];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

//
//  AppDelegate.m
//  UILabel
//
//  Created by Christian Schnorr on 6/17/15.
//  Copyright (c) 2015 Christian Schnorr. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)options
{
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.rootViewController = [[RootViewController alloc] init];
    [self.window makeKeyAndVisible];

    return YES;
}

@end

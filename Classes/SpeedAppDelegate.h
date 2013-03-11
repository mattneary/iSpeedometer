//
//  HelloThereAppDelegate.h
//  HelloThere
//
//  Created by Dan Grigsby on 2/4/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SpeedViewController;

@interface SpeedAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    SpeedViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SpeedViewController *viewController;

@end


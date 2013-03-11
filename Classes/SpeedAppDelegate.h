#import <UIKit/UIKit.h>

@class SpeedViewController;

@interface SpeedAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    SpeedViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SpeedViewController *viewController;

@end


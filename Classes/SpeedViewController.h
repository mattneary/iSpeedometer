#import <UIKit/UIKit.h>
#import "MyCLController.h"

@interface SpeedViewController : UIViewController <MyCLControllerDelegate> {
	IBOutlet UILabel *mphLabel;
    IBOutlet UILabel *distanceLabel;
    IBOutlet UILabel *avgSpeedLabel;
    IBOutlet UILabel *topSpeedLabel;
    IBOutlet UILabel *durationLabel;
    IBOutlet UIWebView *webView;
	MyCLController *locationController;
    CLLocation *prevLocation;
    CLLocation *currentLocation;
    int shouldTakeSample;
}

- (void)locationUpdate:(CLLocation *)location;
- (void)locationError:(NSError *)error;
- (IBAction)setStart;

@end
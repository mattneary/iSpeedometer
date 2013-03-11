#import "SpeedViewController.h"

@implementation SpeedViewController

- (void)viewDidLoad {
    NSString* htmlString = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"] encoding:NSUTF8StringEncoding error:nil];
    [webView loadHTMLString:htmlString baseURL:nil];
    
    prevLocation = [[CLLocation alloc] initWithLatitude:0 longitude:0];
    
	locationController = [[MyCLController alloc] init];
	locationController.delegate = self;
	[locationController.locationManager startUpdatingLocation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; 
}
- (IBAction)setStart {
    [webView stringByEvaluatingJavaScriptFromString:@"reset();"];
}
- (void)dealloc {
	[locationController release];
    [super dealloc];
}
- (void)locationUpdate:(CLLocation *)location {
    currentLocation = [location retain];
    
    // initial condition
    if( prevLocation.coordinate.latitude == 0 ) {
        prevLocation = [location retain];
    }
    
    // consider two samples at a time
    if( shouldTakeSample ) {
        mphLabel.text = [webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"push(%f);", [location distanceFromLocation:prevLocation]]];
        
        distanceLabel.text = [webView stringByEvaluatingJavaScriptFromString:@"(Math.round(sumDistance/1624*10)/10)"];
        avgSpeedLabel.text = [webView stringByEvaluatingJavaScriptFromString:@"Math.round(new SamplePoint(sumDistance, sumTime).speed)"];
        topSpeedLabel.text = [webView stringByEvaluatingJavaScriptFromString:@"Math.round(maxSpeed)"];
        durationLabel.text = [webView stringByEvaluatingJavaScriptFromString:@"Math.round(sumTime/60*10)/10"];
        
        prevLocation = currentLocation;
        shouldTakeSample = 0;
    } else {
        shouldTakeSample = 1;
    }
}

- (void)locationError:(NSError *)error {
	//locationLabel.text = [error description];
}

@end

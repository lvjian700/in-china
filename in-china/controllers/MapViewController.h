#import <UIKit/UIKit.h>
#import "LocationMapView.h"
#import "ICVoiceView.h"

@interface MapViewController : UIViewController<MKMapViewDelegate, CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet LocationMapView *mapView;
@property (weak, nonatomic) IBOutlet ICVoiceView *voiceBottomView;

@property(nonatomic, strong) CLLocationManager *locationManager;
@property(nonatomic, strong) CLLocation *currentLocation;
@end

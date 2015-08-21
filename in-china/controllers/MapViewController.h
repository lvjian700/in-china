#import <UIKit/UIKit.h>
#import "LocationMapView.h"

@interface MapViewController : UIViewController<MKMapViewDelegate, CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet LocationMapView *mapView;

@property(nonatomic, strong) CLLocationManager *locationManager;
@property(nonatomic, strong) CLLocation *currentLocation;
@end

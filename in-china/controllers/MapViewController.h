#import <UIKit/UIKit.h>
#import "LocationMapView.h"

@interface MapViewController : UIViewController<MKMapViewDelegate, CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet LocationMapView *mapView;

@end

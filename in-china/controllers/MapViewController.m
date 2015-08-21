#import "MapViewController.h"
#import "ICLocationAnnotation.h"
#import "CoordinatesHelper.h"

@interface MapViewController ()

@end

@implementation MapViewController
/*
{
    "id": "551537e2498ef873a9cf7d86",
    "name": "西市城购物中心",
    "contact": {},
    "location": {
        "lat": 34.24689701959766,
        "lng": 108.9025350395719,
        "distance": 6756,
        "cc": "CN",
        "country": "China",
        "formattedAddress": [
            "China"
         ]
    }
}
*/
- (void)viewDidLoad {
    [super viewDidLoad];

    MKUserTrackingBarButtonItem *trackingBarButtonItem = [[MKUserTrackingBarButtonItem alloc] initWithMapView:self.mapView];
    self.navigationItem.rightBarButtonItem = trackingBarButtonItem;

    self.locationManager = [self createLocationManager];
    self.locationManager.delegate = self;

    [self requestAuthorizationForLocationManager:self.locationManager];

    self.voiceBottomView.voiceButton.layer.cornerRadius = 6;
//    self.voiceBottomView.voiceButton.layer.borderWidth = 1.0;
    self.voiceBottomView.voiceButton.layer.masksToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.locationManager startUpdatingLocation];
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.locationManager stopUpdatingLocation];
}

#pragma mark map view
- (void)centerMap:(MKMapView *)mapView
     onCoordinate: (CLLocationCoordinate2D) coordinate
     withDistance: (CLLocationDistance) radius {
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, radius, radius);

    [mapView setRegion:region animated:YES];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"fail to get current location: %@", error);
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    self.currentLocation = [locations firstObject];

    [self centerMap:self.mapView
       onCoordinate:self.currentLocation.coordinate
       withDistance:1000];

    CLLocationCoordinate2D targetCoordinate = CLLocationCoordinate2DMake(34.24689701959766, 108.9025350395719);
    ICLocationAnnotation *annotation = [ICLocationAnnotation annotationWithTitle:@"西市城购物中心"
                                                                      coordinate:targetCoordinate];
    [self.mapView addAnnotation:annotation];

    CoordinatesHelper *twoCoordinates = [[CoordinatesHelper alloc] initWithCoordinate: self.currentLocation.coordinate
                                    andCoordinate:targetCoordinate];

    [self centerMap:self.mapView
       onCoordinate:twoCoordinates.middleCoordinate
       withDistance:twoCoordinates.distance];

    [self.locationManager stopUpdatingLocation];
}

#pragma mark location
- (void)mapViewWillStartLocatingUser:(MKMapView *)mapView {
}

- (void)requestAuthorizationForLocationManager: (CLLocationManager *) locationManager {
    if (![CLLocationManager locationServicesEnabled]) {
        NSLog(@"定位服务当前可能尚未打开，请设置打开！");
        return;
    }

    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
        NSLog(@"Requesting when in use auth");
        [locationManager requestWhenInUseAuthorization];
    } else if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied) {
        NSLog(@"Location services denied");
    }
}

- (CLLocationManager *)createLocationManager {
    CLLocationManager *manager = [[CLLocationManager alloc] init];
    manager.distanceFilter = kCLDistanceFilterNone;
    manager.desiredAccuracy = kCLLocationAccuracyHundredMeters;

    return manager;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

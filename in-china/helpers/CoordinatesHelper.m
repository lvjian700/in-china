#import "CoordinatesHelper.h"


@implementation CoordinatesHelper {
    CLLocationCoordinate2D _fromCoordinate;
    CLLocationCoordinate2D _toCoordinate;
}

- (instancetype)initWithCoordinate:(CLLocationCoordinate2D)fromCoordinate andCoordinate:(CLLocationCoordinate2D)toCoordinate {
    self = [super init];
    if (self) {
        _fromCoordinate = fromCoordinate;
        _toCoordinate = toCoordinate;
    }

    return self;
}


- (CLLocationDistance)distance {
    CLLocation *targetLocation = [self createLocationWithCoordinate:_toCoordinate];
    CLLocation *fromLocation = [self createLocationWithCoordinate:_fromCoordinate];

    return [targetLocation distanceFromLocation:fromLocation];
}

- (CLLocation *)createLocationWithCoordinate: (CLLocationCoordinate2D) coordinate {
    return [[CLLocation alloc] initWithLatitude:coordinate.latitude
                                      longitude:coordinate.longitude];
}

- (CLLocationCoordinate2D)middleCoordinate {
    return [self midCoordinateBetween: _fromCoordinate
                                  and: _toCoordinate];
}

- (CLLocationCoordinate2D )midCoordinateBetween:(CLLocationCoordinate2D)fromCoordinate and:(CLLocationCoordinate2D)toCoordinate {
    double lon1 = fromCoordinate.longitude * M_PI / 180;
    double lat1 = fromCoordinate.latitude * M_PI / 180;

    double lon2 = toCoordinate.longitude * M_PI / 180;
    double lat2 = toCoordinate.latitude * M_PI / 180;

    double dLon = lon2 - lon1;

    double x = cos(lat2) * cos(dLon);
    double y = cos(lat2) * sin(dLon);

    double lat3 = atan2( sin(lat1) + sin(lat2), sqrt((cos(lat1) + x) * (cos(lat1) + x) + y * y) );
    double lon3 = lon1 + atan2(y, cos(lat1) + x);

    return CLLocationCoordinate2DMake(lat3 * 180 / M_PI, lon3 * 180 / M_PI);;
}
@end
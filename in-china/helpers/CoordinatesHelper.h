#import <Foundation/Foundation.h>
#import <CoreLocation/CLLocation.h>


@interface CoordinatesHelper : NSObject
- (instancetype)initWithCoordinate:(CLLocationCoordinate2D)fromCoordinate andCoordinate:(CLLocationCoordinate2D)toCoordinate;

- (CLLocationDistance)distance;

- (CLLocationCoordinate2D)middleCoordinate;
@end
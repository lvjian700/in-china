#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ICVoiceView : UIView

@property (weak, nonatomic) IBOutlet UIButton *voiceButton;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;

- (void)displayLocationWithTitle:(NSString *)string distance:(CLLocationDistance)distance;

@end

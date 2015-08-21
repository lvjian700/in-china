#import "ICVoiceView.h"

@implementation ICVoiceView

- (void)displayLocationWithTitle:(NSString *)string distance:(CLLocationDistance)distance {
    self.titleLabel.text = string;
    self.distanceLabel.text = [self distanceTextWithDistance: distance];
}

- (NSString *)distanceTextWithDistance:(CLLocationDistance)distance {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setMaximumFractionDigits:1];
    [formatter setRoundingMode:NSNumberFormatterRoundUp];

    return [NSString stringWithFormat:@"%@ km", [formatter stringFromNumber:[NSNumber numberWithDouble:distance / 1000.0]]];
}
@end

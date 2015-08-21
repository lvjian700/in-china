//
//  PlaceTableViewCell.h
//  in-china
//
//  Created by Jian Lv on 8/21/15.
//  Copyright © 2015 Pricing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlaceTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *briefDesc;

@end

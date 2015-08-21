//
//  ICEntryMenuViewController.m
//  in-china
//
//  Created by Jian Lv on 8/21/15.
//  Copyright © 2015 Pricing. All rights reserved.
//

#import "ICEntryMenuViewController.h"
#import "ICSearchPlacesTableViewController.h"
#import "HelpersMacro.h"
#import "ConstantMacro.h"

@interface ICEntryMenuViewController ()

@end

@implementation ICEntryMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goShopping:(UIButton *)sender {
    ICSearchPlacesTableViewController *searchPlacesController = ControllerOfStoryBoard(@"Places", @"ICSearchPlacesTableViewController");
    
    searchPlacesController.targetPlace = @"shopping";
    
    [self.navigationController pushViewController:searchPlacesController animated:YES];
}

- (IBAction)goHospital:(UIButton *)sender {
    ICSearchPlacesTableViewController *searchPlacesController = ControllerOfStoryBoard(@"Places", @"ICSearchPlacesTableViewController");
    
    searchPlacesController.targetPlace = @"hospital";
    
    [self.navigationController pushViewController:searchPlacesController animated:YES];
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

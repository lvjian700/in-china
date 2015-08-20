//
//  JSONDataHelper.m
//  in-china
//
//  Created by Theesit Konkaew on 8/20/15.
//  Copyright (c) 2015 Pricing. All rights reserved.
//

#import "JSONDataHelper.h"

@implementation JSONDataHelper

- (NSDictionary *) loadData:(NSString *) dataFileName{

    NSString *path = [[NSBundle mainBundle] pathForResource:dataFileName ofType:@"json"];
    
    NSData *jsonData = [NSData dataWithContentsOfFile: path];
    
    NSDictionary* json = (NSDictionary *)[NSJSONSerialization JSONObjectWithData:jsonData
                                                         options:kNilOptions
                                                           error:nil];
    
    return json;
}
@end

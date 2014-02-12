//
//  Hourly.m
//  Cookout
//
//  Created by Alex Hicks on 2/10/14.
//  Copyright (c) 2014 iapps. All rights reserved.
//

#import "Hourly.h"

@implementation Hourly

-(NSString*) getStoreCode {
    return @"WS11";
#warning implement get setting here
}

-(NSNumber*) getPayRate {
    return [NSNumber numberWithFloat:7.50f];
#warning implement get setting here
}

-(NSNumber*) laborPercent{
    if ([_crewCount intValue] < 1 ){
        return @0;
    }
    
    if ([_saleAmount intValue] < 1){
        return @0;
    }
    
    float laborCost = [_crewCount intValue] * [self.payrate floatValue];
    float result = [_saleAmount intValue] / laborCost;
    return [NSNumber numberWithFloat:result];
}
@end

//
//  Hourly.m
//  Cookout
//
//  Created by Alex Hicks on 2/10/14.
//  Copyright (c) 2014 iapps. All rights reserved.
//

#import "Hourly.h"
//THIS IS
@implementation Hourly


-(id) init:(NSUInteger)tod {
    
    if(self = [super init]){
        _timeOfDay = [NSNumber numberWithInt:tod];
        
    }
    return self;
}
    

-(id) init {
    if(self = [super init]){
        _timeOfDay = [NSNumber numberWithInt:TOD1];
    }
    return self;
}

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
    
    CGFloat sales = [_saleAmount floatValue];
    CGFloat laborCost = [_crewCount intValue] * [self.payrate floatValue];

    CGFloat result = floorf(((sales / laborCost) * 100) + 0.5) /100;
    
    CGFloat roundedFloat = (int)(result * 100 + 0.5) / 100.0;
    return [NSNumber numberWithFloat:roundedFloat];
}

/*
 
 CGFloat val = 37.777779;

 CGFloat rounded_down = floorf(val * 100) / 100;    Result: 37.77
CGFloat nearest = floorf(val * 100 + 0.5) / 100;   Result: 37.78
CGFloat rounded_up = ceilf(val * 100) / 100;       Result: 37.78

*/






//THIS
+(NSNumber*) getLaborPercentWithSalesAmount:(NSNumber*) salesAmount
                        crewCount:(NSNumber*) crew

{
    
    
    Hourly * hourly = [[Hourly alloc] init];
    hourly.saleAmount = salesAmount;
    hourly.crewCount = crew;
    return [hourly laborPercent];
    
}
@end

//
//  Hourly.m
//  Cookout
//
//  Created by Alex Hicks on 2/10/14.
//  Copyright (c) 2014 iapps. All rights reserved.
//

#import "Hourly.h"


@interface Hourly(){
    NSNumber *_timeOfDay;
    NSNumber *_salesAmount;
    NSNumber *_crewCount;
    NSNumber *_serviceTime;
    NSNumber *_upDownAmount;
    
}

@end


@implementation Hourly

-(id) init:(NSNumber*) salesAmount crewCount:(NSNumber*) crewCount {
    if (self = [super init]) {
        _salesAmount = [salesAmount copy];
        _crewCount = [crewCount copy];
        _serviceTime = @0;
        _upDownAmount = @0;

        
    }
    return self;
}



-(id) init:(NSUInteger)tod {
    
    if(self = [super init]){
        _timeOfDay = [NSNumber numberWithInt:tod];
        _salesAmount = @0;
        _crewCount = @0;
        _serviceTime = @0;
        _upDownAmount = @0;
    
    }
    return self;
}
    

-(id) init {
    if(self = [super init]){
        _timeOfDay = [NSNumber numberWithInt:TOD1];
        _salesAmount = @0;
        _crewCount = @0;
        _serviceTime = @0;
        _upDownAmount = @0;
    }
    return self;
}

-(NSNumber*) getServiceTime{
    return _serviceTime;
}

-(NSNumber*) getCrewCount {
    return _crewCount;
}

-(NSNumber*) getSalesAmount {
    return _salesAmount;
}


-(NSNumber*) getTimeOfDay {
    return _timeOfDay;
}


-(NSString*) getStoreCode {
    return @"WS11";
#warning implement get setting here
}

-(NSNumber*) getPayRate {
    return [NSNumber numberWithFloat:7.50f];
#warning implement get setting here
}


-(NSNumber*) getLaborPercent{
    if ([_crewCount intValue] < 1 ){
        return @0;
    }
    
    if ([_salesAmount intValue] < 1){
        return @0;
    }
    
    CGFloat sales = [_salesAmount floatValue];
    CGFloat laborCost = [_crewCount intValue] * [self.payrate floatValue];

    CGFloat result = floorf(((sales / laborCost) * 100) + 0.5) /100;
    
    CGFloat roundedFloat = (int)(result * 100 + 0.5) / 100.0;
    return [NSNumber numberWithFloat:roundedFloat];
}

+(NSNumber*) getLaborPercentWithSalesAmount:(NSNumber*) salesAmount
                        crewCount:(NSNumber*) crew

{
    
    
    Hourly * hourly = [[Hourly alloc] init:salesAmount crewCount:salesAmount];
    return hourly.laborPercent;
    
}
@end

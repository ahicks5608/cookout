//
//  Hourly.m
//  Cookout
//
//  Created by Alex Hicks on 2/10/14.
//  Copyright (c) 2014 iapps. All rights reserved.
//

#import "Hourly.h"
#import "Common.h"

@interface Hourly(){
    NSNumber *_timeOfDay;
    NSNumber *_salesAmt;
    NSNumber *_crewCount;
    NSNumber *_serviceTime;
    NSNumber *_laborRate;
}

@end


@implementation Hourly

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    _salesAmt = [decoder decodeObjectForKey:cfnSalesAmt];
    _crewCount = [decoder decodeObjectForKey:cfnHoursWorked];
    _timeOfDay = [decoder decodeObjectForKey:cfnTimeOfDay];
    _serviceTime = [decoder decodeObjectForKey:cfnServiceTime];
    
    _laborRate = [decoder decodeObjectForKey:cfnLaborRate];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:_salesAmt forKey:cfnSalesAmt];
    [encoder encodeObject:_crewCount forKey:cfnHoursWorked];
    [encoder encodeObject:_timeOfDay forKey:cfnTimeOfDay];
    [encoder encodeObject:_serviceTime forKey:cfnServiceTime];
    
    [encoder encodeObject:_laborRate forKey:cfnLaborRate];
}

-(id)init {
    if (self = [super init]) {
        _salesAmt = @0;
        _crewCount = @0;
        _timeOfDay = @0;
        _serviceTime = @0;
        
        _laborRate = @0;
    }return self;
}

-(id)initWithDictionary:(NSDictionary*) dict{
    if (self = [super init]) {
        _salesAmt = (NSNumber*)[dict valueForKey:cfnSalesAmt];
        _crewCount = (NSNumber*)[dict valueForKey:cfnHoursWorked];
        _serviceTime = (NSNumber*)[dict valueForKey:cfnServiceTime];
        _laborRate = (NSNumber*)[dict valueForKey:cfnLaborRate];
        
        _timeOfDay = (NSNumber*)[dict valueForKey:cfnTimeOfDay];
        
    }
    return self;
}

-(NSNumber*) getLaborRate{
    return _laborRate;
}

-(NSNumber*) getUpDownAmt{
    return _upDownAmt;
}

-(NSNumber*) getServiceTime{
    return _serviceTime;
}

-(NSNumber*) getCrewCount {
    return _crewCount;
}

-(NSNumber*) getSalesAmt {
    return _salesAmt;
}


-(NSNumber*) getTimeOfDay {
    return _timeOfDay;
}


-(NSString*) getStoreCode {
    return @"WS11";
#warning implement get setting here
}

//-(NSNumber*) getPayRate {
    //return [NSNumber numberWithFloat:8.99f];
//#warning implement get setting here
//}


-(NSNumber*) getLaborPercent{
    if ([_crewCount intValue] < 1 ){
        return @0;
    }
    
    if ([_salesAmt intValue] < 1){
        return @0;
    }
    if ([_laborRate floatValue] <1){
        return @0;
    }
    
    CGFloat sales = [_salesAmt floatValue];
    CGFloat laborCost = [_crewCount intValue] * [_laborRate floatValue];

    CGFloat result = ((laborCost / sales) * 100.00);
    
    
    return [NSNumber numberWithFloat:result];
}

/*
+(NSString*) getLaborPercentWithSalesAmount:(NSString*) asalesAmount
                        crewCount:(NSString*) acrew

{
    NSNumber *salesAmount = [NSNumber numberWithFloat:asalesAmount.floatValue];
    NSNumber *crew = [NSNumber numberWithInt:acrew.intValue];
    
    Hourly * hourly = [[Hourly alloc] init:salesAmount crewCount:crew];
    return [hourly.laborPercent stringValue];
    
}
 */
@end

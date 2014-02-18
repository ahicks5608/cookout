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
    NSNumber *_upDownAmt;
    
}

@end


@implementation Hourly

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    _salesAmt = [decoder decodeObjectForKey:cfnSalesAmt];
    _crewCount = [decoder decodeObjectForKey:cfnCrewCount];
    _timeOfDay = [decoder decodeObjectForKey:cfnTimeOfDay];
    _serviceTime = [decoder decodeObjectForKey:cfnTimeOfDay];
    _upDownAmt = [decoder decodeObjectForKey:cfnUpDownAmt];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:_salesAmt forKey:cfnSalesAmt];
    [encoder encodeObject:_crewCount forKey:cfnCrewCount];
    [encoder encodeObject:_timeOfDay forKey:cfnTimeOfDay];
    [encoder encodeObject:_serviceTime forKey:cfnServiceTime];
    [encoder encodeObject:_upDownAmt forKey:cfnUpDownAmt];
}


-(id) init:(NSNumber*) salesAmt crewCount:(NSNumber*) crewCount {
    if (self = [super init]) {
        _salesAmt = [salesAmt copy];
        _crewCount = [crewCount copy];
        _serviceTime = @0;
        _upDownAmt = @0;

        
    }
    return self;
}



-(id) init:(NSUInteger)tod {
    
    if(self = [super init]){
        _timeOfDay = [NSNumber numberWithInt:tod];
        _salesAmt = @0;
        _crewCount = @0;
        _serviceTime = @0;
        _upDownAmt = @0;
    
    }
    return self;
}
    

-(id) init {
    if(self = [super init]){
        _timeOfDay = [NSNumber numberWithInt:TOD1];
        _salesAmt = @0;
        _crewCount = @0;
        _serviceTime = @0;
        _upDownAmt = @0;
    }
    return self;
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

-(NSNumber*) getPayRate {
    return [NSNumber numberWithFloat:7.50f];
#warning implement get setting here
}


-(NSNumber*) getLaborPercent{
    if ([_crewCount intValue] < 1 ){
        return @0;
    }
    
    if ([_salesAmt intValue] < 1){
        return @0;
    }
    
    CGFloat sales = [_salesAmt floatValue];
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

//
//  Daily.m
//  Cookout
//
//  Created by Alex Hicks on 2/13/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import "Daily.h"

@interface Daily(){
    NSNumber *_NetSalesAmt;
    NSNumber *_EmployeeFoodAmt;
    NSNumber *_TotalServiceTime;
    NSNumber *_UpDownToday;
    
    
}
@end


@implementation Daily

- (id)init
{
    self = [super init];
    if (self) {
        _NetSalesAmt = @0;
        _EmployeeFoodAmt = @0;
        _TotalServiceTime = @0;
        _UpDownToday = @0;
        _createDate = [NSDate date];
    }
    return self;
}

-(NSNumber*) getNetSalesAmt {
    
    return _NetSalesAmt;
    
}

-(void) setNetSalesAmt:(NSNumber*) value{
    _NetSalesAmt = [NSNumber numberWithDouble:[value doubleValue]];
    
}

//


-(NSNumber*) getEmployeeFoodAmt{
    return _EmployeeFoodAmt;
}

-(void) setEmployeeFood:(NSNumber *) value{
   _EmployeeFoodAmt = [NSNumber numberWithDouble:[value doubleValue]];
}

//

-(NSNumber*) getTotalServiceTime {
    return _TotalServiceTime;
}

-(void) setTotalServiceTime : (NSNumber*) value{
  _TotalServiceTime = [NSNumber numberWithDouble:[value doubleValue]];
}

//

-(NSNumber*) getUpDownToday{
    return _UpDownToday;
}

-(void) setUpDownToday : (NSNumber*) value {
    _UpDownToday = [NSNumber numberWithDouble:[value doubleValue]];
}

@end

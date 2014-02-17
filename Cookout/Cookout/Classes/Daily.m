//
//  Daily.m
//  Cookout
//
//  Created by Alex Hicks on 2/13/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import "Daily.h"
#import "Common.h"

@interface Daily(){
    NSNumber *_netSalesAmt;
    NSNumber *_totalServiceTime;
    NSNumber *_upDownToday;
    NSNumber *_employeeFoodAmt;
    NSNumber *_paidOutAmt;
    NSNumber *_mgmtVoidAmt;
    NSNumber *_cashAmt;
    NSNumber *_cashOsAmt;
    NSNumber *_creditCardAmt;
    NSNumber *_totalDepositAmt;
    NSNumber *_salesTaxAmt;
    NSMutableArray *_hourlies;
    NSMutableDictionary *_data;
    
}
@end


@implementation Daily

- (id)init
{
    self = [super init];
    if (self) {
        _netSalesAmt = @0;
        _employeeFoodAmt = @0;
        _totalServiceTime = @0;
        _upDownToday = @0;
        _paidOutAmt = @0;
        _mgmtVoidAmt = @0;
        _cashAmt = @0;
        _cashOsAmt = @0;
        _creditCardAmt = @0;
        _totalDepositAmt = @0;
        _salesTaxAmt = @0;
        
                
    }
    return self;
}

-(id) initWithHourly:(NSArray*) hourlies data:(NSDictionary*) values {
    self = [super init];
    if (self) {
        _netSalesAmt = @0;
        _employeeFoodAmt = @0;
        _totalServiceTime = @0;
        _upDownToday = @0;
        _paidOutAmt = @0;
        _mgmtVoidAmt = @0;
        _cashAmt = @0;
        _cashOsAmt = @0;
        _creditCardAmt = @0;
        _totalDepositAmt = @0;
        _salesTaxAmt = @0;
        _hourlies = [[NSMutableArray alloc] initWithCapacity:24];
        
        if (hourlies){
            [_hourlies addObjectsFromArray:hourlies];
        }
        _data = [[NSMutableDictionary alloc] initWithCapacity:10];
        
        if (values) {
            [_data addEntriesFromDictionary:values];
            _employeeFoodAmt = (NSNumber *) [_data valueForKeyPath:cfnEmployeeFoodAmt];
            _cashOsAmt = (NSNumber *) [_data valueForKeyPath:cfnCashOsAmt];
            _cashAmt = (NSNumber *) [_data valueForKeyPath:cfnCashAmt];
            
        }
        
        
    }
    return self;
    
}

-(NSNumber*) getSalesTaxAmt{
    return _salesTaxAmt;
}

-(NSNumber*) getTotalDepositAmt {
    return _totalDepositAmt;
}

-(NSNumber*) getCreditCardAmt{
    return _creditCardAmt;
}

-(NSNumber*) getCashOsAmt{
    return _cashOsAmt;
}

-(NSNumber*) getCashAmt{
    return _cashAmt;
}

-(NSNumber*) getMgmtVoidAmt{
    return _mgmtVoidAmt;
}

-(NSNumber*) getPaidOutAmt{
    return _paidOutAmt;
}

-(NSNumber*) getNetSalesAmt {
    
    return _netSalesAmt;
    
}


-(NSNumber*) getTotalServiceTime {
    return _totalServiceTime;
}


//

-(NSNumber*) getUpDownAmount{
    return _upDownToday;
}

-(NSNumber*) compare:(NSObject*) daily what:(NSUInteger) whatToCompare{
    return @0;
}


-(NSNumber*) compareWithLastWeek:(NSUInteger) value;{
    return @0;
}
-(NSNumber*) compareWithLastYear:(NSUInteger) value;{
    return @0;
}

@end

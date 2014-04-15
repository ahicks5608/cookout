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
    NSMutableArray *_fields;
    NSMutableArray *_hourlies;
    NSMutableDictionary *_data;
}
@end


@implementation Daily

static float kSalesTaxRate = 7.56;


- (id)init
{
    
    self = [super init];
    if (self) {
        _fields = [[NSMutableArray alloc] initWithCapacity:36];
        for (int x = 0; x<35; x++) {
            [_fields setObject:@0 atIndexedSubscript:x];
        }
    }
    return self;
}



-(id) initWithData:(NSDictionary*) values Hourlies:(NSArray*) hourlies{
    self = [super init];
    if (self) {
        
        _hourlies = [[NSMutableArray alloc] initWithCapacity:24];
        
        if (hourlies){
            [_hourlies addObjectsFromArray:hourlies];
        }
        _data = [[NSMutableDictionary alloc] initWithCapacity:10];
        
     }
    return self;

}



-(NSNumber*) getNetSalesDAY{
    return [_fields objectAtIndex:DFNetSalesDAY];
}
-(NSNumber*) getSalesTax{
    return [_fields objectAtIndex:DFSalesTax];
}
-(NSNumber*) getGrossSales{
    return [_fields objectAtIndex:DFGrossSales];
}
-(NSNumber*) getPaidOutAmt {
    return [_fields objectAtIndex:DFPaidOuts];
}
-(NSNumber*) getCreditCardAmt {
    return [_fields objectAtIndex:DFCreditCards];
}
-(NSNumber*) getCashSHForDep{
    return [_fields objectAtIndex:DFCashSHForDep];
}
-(NSNumber*) getDeposit1{
    return [_fields objectAtIndex:DFDeposit1];
}
-(NSNumber*) getDeposit2{
    return [_fields objectAtIndex:DFDeposit2];
}
-(NSNumber*) getTotalDepositAmt{
    return [_fields objectAtIndex:DFTotalDep];
}
-(NSNumber*) getCashOSDAY {
    return [_fields objectAtIndex:DFCashOSDAY];
}
-(NSNumber*) getMgmtVoidAmt {
    return [_fields objectAtIndex:DFMgvdTransvoid];;
}
-(NSNumber*) getTotalServiceTime {
    return [_fields objectAtIndex:DFTotalServiceTime];
}


//


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

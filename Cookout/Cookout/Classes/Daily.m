//
//  Daily.m
//  Cookout
//
//  Created by Alex Hicks on 2/13/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import "DataManagerDaily.h"
#import "Daily.h"
#import "Common.h"
#import "Formula2.h"
#import "Formula3.h"
#import "Formula6.h"
#import "FormulaTotalDep.h"
#import "Formula9.h"
#import "Formula10.h"
#import "Formula12.h"
#import "Formula18.h"
#import "Formula19.h"
#import "Formula20.h"
#import "Formula22.h"
#import "Formula24.h"
#import "Formula27.h"
#import "Formula29.h"
#import "Formula31.h"
#import "Formula33.h"
#import "Formula35.h"


@interface Daily(){
    NSMutableArray *_fields;


}
@end


@implementation Daily

static float kSalesTaxRate = 7.56;


-(void) configureFields {
    _fields = [[NSMutableArray alloc] initWithCapacity:36];
    for (int x = 0; x<35; x++) {
        [_fields setObject:@0 atIndexedSubscript:x];
        
    }

}


- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (self) {
        
    _fields = [decoder decodeObjectForKey:cfnValue];

    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:_fields forKey:cfnValue];
    
}


- (id)init {
    
    self = [super init];
    if (self) {
        [self configureFields];

       
        }
return self;
}



//These values are "instant summaries" of the hourly records.

-(id) initWithData:(NSDictionary*) values {
    self = [super init];
    if (self){
        [self configureFields];
        
        NSNumber *value = (NSNumber*) [values valueForKey:cfnSalesAmt];
        [_fields setObject:value atIndexedSubscript:DFNetSalesDAY];
    
        value = (NSNumber*) [values valueForKey:cfnServiceTime];
        [_fields setObject:value atIndexedSubscript:DFDayServiceTime];
        
        value = (NSNumber*) [values valueForKey:cfnServiceTime2];
        [_fields setObject:value atIndexedSubscript:DFNightServiceTime];
        
        value = (NSNumber*) [values valueForKey:cfnLabMoneyPaid];
        [_fields setObject:value atIndexedSubscript:DFLaborAmtDAYPaysh];
        
    

        
        
    }
    return self;

}


-(NSString*) getValueAtIndex:(NSUInteger) index{
    switch (index) {
 
        case DFNetSalesWEEK113:
            return @"0.00";
            break;
        case DFTotalServiceTime:
            return [Formula27 getValue:self];
            break;
        
        case DFDayServiceTime:
        case DFNightServiceTime: {
            NSNumber *value = [_fields objectAtIndex:index];
            return [value stringValue];
        }
       
        case DFPaidOuts:
        case DFCreditCards:
        case DFDeposit1:
        case DFDeposit2:
        case DFMgvdTransvoid:
        case DFFoodEmpForDay:
        case DFLaborAmtDAYPaysh:
        case DFNetSalesDAY: {
            NSNumber *value = [_fields objectAtIndex:index];
            return [Common formatNumberAsMoney:value];
        }
            break;
        case DFSalesTax: {
    
            NSString *val = [Formula2 getValue:self];
            NSNumber *alex2 = [Formula2 getFormulaResult:self];

            [_fields setObject:alex2 atIndexedSubscript:DFSalesTax];
            return val;
        }
        case DFGrossSales: {
            NSString *val = [Formula3 getValue:self];
            NSNumber *alex2 = [Formula3 getFormulaResult:self];
            [_fields setObject:alex2 atIndexedSubscript:DFGrossSales];
            return val;
        }
        case DFCashSHForDep: {
            NSString *val = [Formula6 getValue:self];
            NSNumber *alex2 = [Formula6 getFormulaResult:self];
            [_fields setObject:alex2 atIndexedSubscript:DFCashSHForDep];
            return val;
        }
        case DFTotalDep: {
            NSString *val = [FormulaTotalDep getValue:self];
            NSNumber *alex2 = [FormulaTotalDep getFormulaResult:self];
            [_fields setObject:alex2 atIndexedSubscript:DFTotalDep];
            return val;
        }
        case DFCashOSDAY: {
            NSString *val = [Formula9 getValue:self];
            NSNumber *alex2 = [Formula9 getFormulaResult:self];
            [_fields setObject:alex2 atIndexedSubscript:DFCashOSDAY];
            return val;
        }
        case DFCashOSPercDAY91: {
            NSString *val = [Formula10 getValue:self];
            NSNumber *alex2 = [Formula10 getFormulaResult:self];
            [_fields setObject:alex2 atIndexedSubscript:DFCashOSPercDAY91];
            return val;
        }
        case DFLaborPercDAY151: {
            NSString *val = [Formula18 getValue:self];
            NSNumber *alex2 = [Formula18 getFormulaResult:self];
            [_fields setObject:alex2 atIndexedSubscript:DFLaborPercDAY151];
            return val;
        }
    
        
        default:
            return @"$0.00";
            break;
    }
}

-(void) setValueAtIndex:(NSUInteger) index value:(NSNumber*) value{
    [_fields setObject:value atIndexedSubscript:index];
    //[self setValue:_fields forKey:cfnValue];
    DataManagerDaily *data = [[DataManagerDaily alloc] init];
    [data update:@{ccnData:self, ccnUuid:_parentUUID}];

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
-(NSNumber*) getPaidOuts{
    return [_fields objectAtIndex:DFPaidOuts];
}
-(NSNumber*) getCreditCards{
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
-(NSNumber*) getTotalDep{
    return [_fields objectAtIndex:DFTotalDep];
}
-(NSNumber*) getCashOSDAY {
    return [_fields objectAtIndex:DFCashOSDAY];
}
-(NSNumber*) getCashOSPercDay91{
    return [_fields objectAtIndex:DFCashOSPercDAY91];;
}
-(NSNumber*) getCashOSMONTH911{
    return [_fields objectAtIndex:DFCashOSMONTH911];
}
-(NSNumber*) getCashOSPercMONTH1114{
    return [_fields objectAtIndex:DFCashOSPercMONTH1114];
}
-(NSNumber*) getNetSalesWEEK113{
    return [_fields objectAtIndex:DFNetSalesWEEK113];
}
-(NSNumber*) getNetSalesMONTH114{
    return [_fields objectAtIndex:DFNetSalesMONTH114];
}
-(NSNumber*) getLaborAmtDAYPaysh{
    return [_fields objectAtIndex:DFLaborAmtDAYPaysh];
}
-(NSNumber*) getLaborAmtWEEK1516{
    return [_fields objectAtIndex:DFLaborAmtWEEK1516];
}
-(NSNumber*) getLaborAmtMONTH1517{
    return [_fields objectAtIndex:DFLaborAmtMONTH1517];
}
-(NSNumber*) getLaborPercDAY151{
    return [_fields objectAtIndex:DFLaborPercDAY151];
}
-(NSNumber*) getLaborPercWEEK1613{
    return [_fields objectAtIndex:DFLaborPercWEEK1613];
}
-(NSNumber*) getLaborPercMONTH1714{
    return [_fields objectAtIndex:DFLaborPercMONTH1714];
}
-(NSNumber*) getMgvdTransvoid{
    return [_fields objectAtIndex:DFMgvdTransvoid];
}
-(NSNumber*) getMgrvdPercDAY211{
    return [_fields objectAtIndex:DFMgrvdPercDAY211];
}
-(NSNumber*) getMgrvdMONTH2123{
    return [_fields objectAtIndex:DFMgrvdMONTH2123];
}
-(NSNumber*) getMgrvdPercMONTH2314{
    return [_fields objectAtIndex:DFMgrvdPercMONTH2314];
}
-(NSNumber*) getDayServiceTime{
    return [_fields objectAtIndex:DFDayServiceTime];;
}
-(NSNumber*) getNightServiceTime{
    return [_fields objectAtIndex:DFNightServiceTime];
}
-(NSNumber*) getTotalServiceTime{
    return [_fields objectAtIndex:DFTotalServiceTime];
}
-(NSNumber*) getFoodEmpForDay{
    return [_fields objectAtIndex:DFFoodEmpForDay];
}
-(NSNumber*) getFoodEmpPercDAY281{
    return [_fields objectAtIndex:DFFoodEmpPercDAY281];
}
-(NSNumber*) getFoodEmpMONTH2830{
    return [_fields objectAtIndex:DFFoodEmpMONTH2830];
}
-(NSNumber*) getFoodEmpPercMONTH3014{
    return [_fields objectAtIndex:DFFoodEmpPercMONTH3014];;
}
-(NSNumber*) getSalesLastWeekSameDay{
    return [_fields objectAtIndex:DFSalesLastWeekSameDay];
}
-(NSNumber*) getUpDownToday132{
    return [_fields objectAtIndex:DFUpDownToday132];
}
-(NSNumber*) getNetSalesLastWEEKThruTODAY{
    return [_fields objectAtIndex:DFNetSalesLastWEEKThruTODAY];
}
-(NSNumber*) getUpDownThisWEEK1334{
    return [_fields objectAtIndex:DFUpDownThisWEEK1334];
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

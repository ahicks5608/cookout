//
//  CookOutDaily.h
//  Cookout
//
//  Created by Alex Hicks on 2/17/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol CookOutDaily <NSObject>
@required

-(NSNumber*) getNetSalesDAY;
-(NSNumber*) getSalesTax;
-(NSNumber*) getGrossSales;
-(NSNumber*) getPaidOuts;
-(NSNumber*) getCreditCards;
-(NSNumber*) getCashSHForDep;
-(NSNumber*) getDeposit1;
-(NSNumber*) getDeposit2;
-(NSNumber*) getTotalDep;
-(NSNumber*) getCashOSDAY;
-(NSNumber*) getCashOSPercDay91;
-(NSNumber*) getCashOSMONTH911;
-(NSNumber*) getCashOSPercMONTH1114;
-(NSNumber*) getNetSalesWEEK113;
-(NSNumber*) getNetSalesMONTH114;
-(NSNumber*) getLaborAmtDAYPaysh;
-(NSNumber*) getLaborAmtWEEK1516;
-(NSNumber*) getLaborAmtMONTH1517;
-(NSNumber*) getLaborPercDAY151;
-(NSNumber*) getLaborPercWEEK1613;
-(NSNumber*) getLaborPercMONTH1714;
-(NSNumber*) getMgvdTransvoid;
-(NSNumber*) getMgrvdPercDAY211;
-(NSNumber*) getMgrvdMONTH2123;
-(NSNumber*) getMgrvdPercMONTH2314;
-(NSNumber*) getDayServiceTime;
-(NSNumber*) getNightServiceTime;
-(NSNumber*) getTotalServiceTime;
-(NSNumber*) getFoodEmpForDay;
-(NSNumber*) getFoodEmpPercDAY281;
-(NSNumber*) getFoodEmpMONTH2830;
-(NSNumber*) getFoodEmpPercMONTH3014;
-(NSNumber*) getSalesLastWeekSameDay;
-(NSNumber*) getUpDownToday132;
-(NSNumber*) getNetSalesLastWEEKThruTODAY;
-(NSNumber*) getUpDownThisWEEK1334;






/*DFNetSalesDAY=0
,DFSalesTax=1
,DFGrossSales=2
,DFPaidOuts=3
,DFCreditCards=4
,DFCashSHForDep=5
,DFDeposit1=6
,DFDeposit2=7
,DFTotalDep=8
,DFCashOSDAY=9
,DFCashOSPercDAY91=10
,DFCashOSMONTH911=11
,DFCashOSPercMONTH1114=12
,DFNetSalesWEEK113=13
,DFNetSalesMONTH114=14
,DFLaborAmtDAYPaysh=15
,DFLaborAmtWEEK1516=16
,DFLaborAmtMONTH1517=17
,DFLaborPercDAY151=18
,DFLaborPercWEEK1613=19
,DFLaborPercMONTH1714=20
,DFMgvdTransvoid=21
,DFMgrvdPercDAY211=22
,DFMgrvdMONTH2123=23
,DFMgrvdPercMONTH2314=24
,DFDayServiceTime=25
,DFNightServiceTime=26
,DFTotalServiceTime=27
,DFFoodEmpForDay=28
,DFFoodEmpPercDAY281=29
,DFFoodEmpMONTH2830=30
,DFFoodEmpPercMONTH3014=31
,DFSalesLastWeekSameDay=32
,DFUpDownToday132=33
,DFNetSalesLastWEEKThruTODAY=34
,DFUpDownThisWEEK1334=35
*/

//methods
-(NSNumber*) compare:(NSObject*) daily what:(NSUInteger) whatToCompare;
-(NSNumber*) compareWithLastWeek:(NSUInteger) value;
-(NSNumber*) compareWithLastYear:(NSUInteger) value;
@end

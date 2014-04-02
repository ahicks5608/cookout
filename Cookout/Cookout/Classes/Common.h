//
//  Common.h
//  Cookout
//
//  Created by Alex Hicks on 2/12/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import <Foundation/Foundation.h>



//Time of Day
typedef enum : NSUInteger {TOD0, TOD1, TOD2, TOD3, TOD4, TOD5, TOD6, TOD7, TOD8, TOD9, TOD10, TOD11, TOD12, TOD13, TOD14, TOD15, TOD16, TOD17, TOD18, TOD19, TOD20, TOD21, TOD22, TOD23, TOD24} TimeofDay;


//Compare Values
typedef enum : NSUInteger {
    COMPARE_UNKNOWN=0
    ,COMPARE_SERVICETIME=1
    ,COMPARE_NETSALES=2
    ,COMPARE_LABOR=3
    ,COMPARE_CASHOS=4
    ,COMPARE_ALL=99
} CompareVaules;

//EDIT FIELDS
typedef enum : NSInteger{
efUnknown = 0
    ,efSalesAmt = 1
    ,efHoursWorked = 2
    ,efServiceTime = 3
    ,efLaborRate = 4
}EditFields;


//Calculator Button
typedef enum : NSInteger{
    CBUnknown=0,
    CB0=100,
    CB1=110,
    CB2=120,
    CB3=130,
    CB4=140,
    CB5=150,
    CB6=160,
    CB7=170,
    CB8=180,
    CB9=190,
    CBDecimal=200,
    CBEquals=300,
    CBPlus=400,
    CBMinus=410,
    CBMultiply=420,
    CBDivide=430,
    CBPercent=440,
    CBPosOrNeg=450,
    CBMR=500,
    CBMC=510,
    CBMplus=520,
    CBMminus=530
} CalcButtons;

//DAILY FIELDS

typedef enum : NSInteger{
    DFNetSalesDAY=0
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
   ,DFUnknown=36
}DailyFields;
    




//hard coded values
extern NSString * const cfnValue;
extern NSString * const cfnEmployeeFoodAmt;
extern NSString * const cfnCashOsAmt;
extern NSString * const cfnCashAmt;
extern NSString * const cfnCreditCardAmt;
extern NSString * const cfnSalesTaxAmt;
extern NSString * const cfnMgmtVoidAmt;
extern NSString * const cfnPaidOutAmt;
extern NSString * const cfnTotalDepositAmt;
extern NSString * const cfnTimeOfDay;
extern NSString * const cfnSalesAmt;
extern NSString * const cfnHoursWorked;
extern NSString * const cfnServiceTime;
extern NSString * const cfnUpDownAmt;
extern NSString * const cfnLaborPercent;
extern NSString * const cfnLaborRate;

extern NSString * const cfnPredicate;

//hard coded table names
extern NSString* const ctnHourlyData;
extern NSString* const ctnDailyData;

//column names
extern NSString* const ccnData;
extern NSString* const ccnExtrainfo;
extern NSString* const ccnTimestamp;
extern NSString* const ccnUuid;


@interface Common : NSObject
+(NSString*) getTitleForDaily:(NSUInteger)value;
+(NSString*) getTitleForTimeOfDay:(NSUInteger)value;
+(NSString *) generateUuidString;
+(NSString*) today;
+(NSDate*) StringToDate:(NSString*) dateStr ;
+(NSString*) dateToDateTimeString:(NSDate*) value;
+(NSString*) dateToString:(NSDate*) value_;
+(NSString*) stringFromDate:(NSDate *)value_;
+(NSArray*) getTitlesForTimeofDay;
+(NSString*) formatNumberAsMoney:(NSNumber*) value;
+(NSString*) formatNumberAsPercent:(NSNumber*) value;
+(BOOL) canEditDaily:(NSUInteger) value;

@end

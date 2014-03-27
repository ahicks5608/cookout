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
    DFUnknown=0
   ,DFNetSalesDAY=1
   ,DFSalesTax=2
   ,DFGrossSales=3
   ,DFPaidOuts=4
   ,DFCreditCards=5
   ,DFCashSHForDep=6
   ,DFDeposit1=7
   ,DFDeposit2=8
   ,DFTotalDep=9
   ,DFCashOSDAY=10
   ,DFCashOSPercDAY91=11
   ,DFCashOSMONTH911=12
   ,DFCashOSPercMONTH1114=13
   ,DFNetSalesWEEK113=14
   ,DFNetSalesMONTH114=15
   ,DFLaborAmtDAYPaysh=16
   ,DFLaborAmtWEEK1516=17
   ,DFLaborAmtMONTH1517=18
   ,DFLaborPercDAY151=19
   ,DFLaborPercWEEK1613=20
   ,DFLaborPercMONTH1714=21
   ,DFMgvdTransvoid=22
   ,DFMgrvdPercDAY211=23
   ,DFMgrvdMONTH2123=24
   ,DFMgrvdPercMONTH2314=25
   ,DFDayServiceTime=26
   ,DFNightServiceTime=27
   ,DFTotalServiceTime=28
   ,DFFoodEmpForDay=29
   ,DFFoodEmpPercDAY281=30
   ,DFFoodEmpMONTH2830=31
   ,DFFoodEmpPercMONTH3014=32
   ,DFSalesLastWeekSameDay=33
   ,DFUpDownToday132=34
   ,DFNetSalesLastWEEKThruTODAY=35
   ,DFUpDownThisWEEK1334=36
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


@end

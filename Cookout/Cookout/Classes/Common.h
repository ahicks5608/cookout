//
//  Common.h
//  Cookout
//
//  Created by Alex Hicks on 2/12/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import <Foundation/Foundation.h>




typedef enum : NSUInteger {TOD0, TOD1, TOD2, TOD3, TOD4, TOD5, TOD6, TOD7, TOD8, TOD9, TOD10, TOD11, TOD12, TOD13, TOD14, TOD15, TOD16, TOD17, TOD18, TOD19, TOD20, TOD21, TOD22, TOD23, TOD24} TimeofDay;

typedef enum : NSUInteger {
    COMPARE_UNKNOWN=0
    ,COMPARE_SERVICETIME=1
    ,COMPARE_NETSALES=2
    ,COMPARE_LABOR=3
    ,COMPARE_CASHOS=4
    ,COMPARE_ALL=99
} CompareVaules;

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

    
    
//hard coded values
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


@end

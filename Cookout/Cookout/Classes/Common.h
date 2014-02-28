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

@interface Common : NSObject

+(NSString*) getTitleForTimeOfDay:(NSNumber*)value;


@end

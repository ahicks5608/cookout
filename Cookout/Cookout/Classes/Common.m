//
//  Common.m
//  Cookout
//
//  Created by Alex Hicks on 2/12/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import "Common.h"

NSString * const cfnEmployeeFoodAmt = @"empFoodAmt";
NSString * const cfnCashOsAmt = @"cashOsAmt";
NSString * const cfnCashAmt = @"cashAmt";
NSString * const cfnCreditCardAmt = @"creditCardAmt";
NSString * const cfnSalesTaxAmt = @"salesTaxAmt";
NSString * const cfnMgmtVoidAmt = @"mgmtVoidAmt";
NSString * const cfnPaidOutAmt = @"paidOutAmt";
NSString * const cfnTotalDepositAmt = @"totalDepositAmt";
NSString * const cfnTimeOfDay = @"timeOfDay";
NSString * const cfnSalesAmt = @"salesAmt";
NSString * const cfnHoursWorked = @"crewCount";
NSString * const cfnServiceTime = @"serviceTime";
NSString * const cfnUpDownAmt = @"upDownAmt";
NSString * const cfnLaborPercent = @"laborPercent"; 

@implementation Common

+(NSString*) getTitleForTimeOfDay:(NSNumber*)value {
    switch ([value intValue]) {
        case TOD0:
            return @"12:00am to 12:59am";
            break;
        case TOD1:
            return @"1:00am to 1:59am";
            break;
        case TOD2:
            return @"2:00am to 2:59am";
            break;
        case TOD3:
            return @"3:00am to 3:59am";
            break;
        case TOD4:
            return @"4:00am to 4:59am";
            break;
        case TOD5:
            return @"5:00am to 5:59am";
            break;
        case TOD6:
            return @"6:00am to 6:59am";
            break;
        case TOD7:
            return @"7:00am to 7:59am";
            break;
        case TOD8:
            return @"8:00am to 8:59am";
            break;
        case TOD9:
            return @"9:00am to 9:59am";
            break;
        case TOD10:
            return @"10:00am to 10:59am";
            break;
        case TOD11:
            return @"11:00am to 11:59am";
            break;
        case TOD12:
            return @"12:00pm to 12:59pm";
            break;
        case TOD13:
            return @"1:00pm to 1:59pm";
            break;
        case TOD14:
            return @"2:00pm to 2:59pm";
            break;
        case TOD15:
            return @"3:00pm to 3:59pm";
            break;
        case TOD16:
            return @"4:00pm to 4:59pm";
            break;
        case TOD17:
            return @"5:00pm to 5:59pm";
            break;
        case TOD18:
            return @"6:00pm to 6:59pm";
            break;
        case TOD19:
            return @"7:00pm to 7:59pm";
            break;
        case TOD20:
            return @"8:00pm to 8:59pm";
            break;
        case TOD21:
            return @"9:00pm to 9:59pm";
            break;
        case TOD22:
            return @"10:00pm to 10:59pm";
            break;
        case TOD23:
            return @"11:00pm to 11:59pm";
            break;
       default:
            return @"Happy Hour";
            break;
    }
}

@end

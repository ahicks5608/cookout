//
//  Common.m
//  Cookout
//
//  Created by Alex Hicks on 2/12/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import "Common.h"
//field names
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

NSString * const cfnPredicate = @"predicate";

//table names
NSString* const ctnHourlyData = @"HourlyData";
NSString* const ctnDailyData = @"DailyData";

//column names
NSString* const ccnData = @"data";;
NSString* const ccnExtrainfo = @"extraInfo";
NSString* const ccnTimestamp = @"timeStamp";
NSString* const ccnUuid = @"uuid";

//NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(date >= %@) AND (date <= %@)", startDate, endDate];
//NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(date == %@) OR (date == %@)", firstDate, secondDate];
//[NSPredicate predicateWithFormat:@"timeStamp IN %@", favoritePublishers];


@implementation Common

+(NSString*) getTitleForTimeOfDay:(NSUInteger)value {
    switch (value) {
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
+ (NSString *) generateUuidString {
    
    NSString *UUID = nil;
    CFUUIDRef UUIDRef = CFUUIDCreate(kCFAllocatorDefault);
    CFStringRef UUIDSRef = CFUUIDCreateString(kCFAllocatorDefault, UUIDRef);
    UUID = [NSString stringWithFormat:@"%@", UUIDSRef];
    CFRelease(UUIDRef);
    CFRelease(UUIDSRef);
    return UUID;
}

+(NSString*) today {
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [dateFormat setDateStyle:NSDateFormatterShortStyle];
    return [dateFormat stringFromDate:[NSDate date]];
    
}

+(NSDate*) StringToDate:(NSString*) dateStr {
    
    if ((dateStr == nil) | (dateStr.length == 0) ) {
        return [NSDate date];
    } else {
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"MM/dd/yyy"];
        return[dateFormat dateFromString:dateStr];
    }
}

+(NSString*) dateToDateTimeString:(NSDate*) value {
    
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MM/dd/yyyy hh:mma"];
    return [dateFormat stringFromDate:today];
}

+(NSString*) dateToString:(NSDate*) value_ {
    
    if (value_ == nil) {
        return @"";
    } else {
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
        [dateFormat setDateStyle:NSDateFormatterShortStyle];
        return [dateFormat stringFromDate:value_];
    }
}

+(NSString*) stringFromDate:(NSDate *)value_ {
    
    
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    NSCalendar* calendar = [NSCalendar currentCalendar];
    unsigned units = NSYearCalendarUnit | NSMonthCalendarUnit |NSDayCalendarUnit;
    NSDateComponents* comp1 = [calendar components:units fromDate:value_];
    NSDateComponents* comp2 = [calendar components:units fromDate:today];
    
    if ([comp1 day]== [comp2 day] &&[comp1 month] == [comp2 month] &&[comp1 year]== [comp2 year]) {
        [dateFormat setDateFormat:@"h:mm a"];
        NSString *val = [dateFormat stringFromDate:value_];
        return [NSString stringWithFormat:@"Today %@",val ];
    } else {
        [dateFormat setDateFormat:@"MMM dd yyyy"];
        return [dateFormat stringFromDate:value_];
    }
}




@end

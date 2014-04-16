//
//  Common.m
//  Cookout
//
//  Created by Alex Hicks on 2/12/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import "Common.h"
//field names


NSString * const cfnValue = @"value";
NSString * const cfnSalesAmt = @"salesAmt";
NSString * const cfnHoursWorked = @"crewCount";
NSString * const cfnServiceTime = @"serviceTime";
NSString * const cfnServiceTime2 = @"serviceTime2";
NSString * const cfnUpDownAmt = @"upDownAmt";
NSString * const cfnLaborPercent = @"laborPercent";
NSString * const cfnLaborRate = @"laborRate";
NSString * const cfnLabMoneyPaid = @"labMoneyPaid";
NSString * const cfnEmployeeFoodAmt = @"empFoodAmt";
NSString * const cfnCashOsAmt = @"cashOsAmt";

NSString * const cfnCreditCardAmt = @"creditCardAmt";
NSString * const cfnSalesTaxAmt = @"salesTaxAmt";
NSString * const cfnMgmtVoidAmt = @"mgmtVoidAmt";
NSString * const cfnPaidOutAmt = @"paidOutAmt";
NSString * const cfnTotalDepositAmt = @"totalDepositAmt";
NSString * const cfnTimeOfDay = @"timeOfDay";


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

+(NSInteger) dayOfWeek:(NSDate*) value {
    NSCalendar *gregorian = [NSCalendar currentCalendar];
    NSDateComponents *weekDayComponents = [gregorian components:NSWeekdayCalendarUnit fromDate:value];
    NSInteger mDay = [weekDayComponents weekday];
    NSLog(@"day number = %d" , mDay);
    return mDay;
}

+(NSString*) formatNumberAsMoney:(NSNumber*) value {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    return [formatter stringFromNumber:value];
    
}

+(NSString*) formatNumberAsPercent:(NSNumber*) value {
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    
    [numberFormatter setNumberStyle:NSNumberFormatterPercentStyle];
    [numberFormatter setMaximumFractionDigits:1];
    [numberFormatter setMultiplier:@1];

    
    return [numberFormatter stringFromNumber:value];
    
}






+(NSArray*) getTitlesForTimeofDay {
    return @[
             @"12:00am to 12:59am",
             @"1:00am to 1:59am",
             @"2:00am to 2:59am",
             @"3:00am to 3:59am",
             @"4:00am to 4:59am",
             @"5:00am to 5:59am",
             @"6:00am to 6:59am",
             @"7:00am to 7:59am",
             @"8:00am to 8:59am",
             @"9:00am to 9:59am",
             @"10:00am to 10:59am",
             @"11:00am to 11:59am",
             @"12:00pm to 12:59pm",
             @"1:00pm to 1:59pm",
             @"2:00pm to 2:59pm",
             @"3:00pm to 3:59pm",
             @"4:00pm to 4:59pm",
             @"5:00pm to 5:59pm",
             @"6:00pm to 6:59pm",
             @"7:00pm to 7:59pm",
             @"8:00pm to 8:59pm",
             @"9:00pm to 9:59pm",
             @"10:00pm to 10:59pm",
             @"11:00pm to 11:59pm"
             ];
    
}
+(BOOL) canEditDaily:(NSUInteger) value{
    switch (value) {
        
        case DFPaidOuts:
        case DFCreditCards:
        case DFDeposit1:
        case DFDeposit2:
        case DFTotalDep:
        case DFCashOSDAY:
        case DFMgvdTransvoid:
        case DFFoodEmpForDay:
            return YES;
        default:
            return NO;
            
    }
}

+(NSString*) getTitleForDaily:(NSUInteger)value {
    NSString * result;
    switch (value) {
            
        case DFNetSalesDAY:
            return @"Net Sales Day";
            break;
        case DFSalesTax:
            return @"Sales Tax";
            break;
        case DFGrossSales:
            return @"Gross Sales";
            break;
        case DFPaidOuts:
            return @"Paid Outs";
            break;
        case DFCreditCards:
            return @"Credit Cards";
            break;
        case DFCashSHForDep:
            return @"Cash s/h for Deposit";
            break;
        case DFDeposit1:
            return @"Deposit #1";
            break;
        case DFDeposit2:
            return @"Deposit #2";
            break;
        case DFTotalDep:
            return @"Total Deposit";
            break;
        case DFCashOSDAY:
            return @"Cash O/S for day";
            break;
        case DFCashOSPercDAY91:
            return @"Cash O/S % day 9:1";
            break;
        case DFCashOSMONTH911:
            return @"Cash O/S month 9+11";
            break;
        case DFCashOSPercMONTH1114:
            return @"Cash O/S % month 11:14";
            break;
        case DFNetSalesWEEK113:
            return @"Net Sales week 1+13";
            break;
        case DFNetSalesMONTH114:
            return @"Net Sales month 1+14";
            break;
        case DFLaborAmtDAYPaysh:
            return @"Labor $ day Paysh";
            break;
        case DFLaborAmtWEEK1516:
            return @"Labor $ week 15+16";
            break;
        case DFLaborAmtMONTH1517:
            return @"Labor $ month 15+17";
            break;
        case DFLaborPercDAY151:
            return @"Labor % day 15:1";
            break;
        case DFLaborPercWEEK1613:
            return @"Labor % week 16:13";
            break;
        case DFLaborPercMONTH1714:
            return @"Labor % month 17:14";
            break;
        case DFMgvdTransvoid:
            return @"Mgvd/Transvoids";
            break;
        case DFMgrvdPercDAY211:
            return @"Mgrvd % day 21:1";
            break;
        case DFMgrvdMONTH2123:
            return @"Mgrvd month 21+23";
            break;
        case DFMgrvdPercMONTH2314:
            return @"Mgrvd % month 23:14";
            break;
        case DFDayServiceTime:
            return @"Day Service Time";
            break;
        case DFNightServiceTime:
            return @"Night Service Time";
            break;
        case DFTotalServiceTime:
            return @"Total Service Time";
            break;
        case DFFoodEmpForDay:
            return @"Food Emp for day";
            break;
        case DFFoodEmpPercDAY281:
            return @"Food Emp % day 28:1";
            break;
        case DFFoodEmpMONTH2830:
            return @"Food Emp month 28+30";
            break;
        case DFFoodEmpPercMONTH3014:
            return @"Food Emp % month 30:14";
            break;
        case DFSalesLastWeekSameDay:
            return @"Sales last week, same day";
            break;
        case DFUpDownToday132:
            return @"Up-Down today 1-32";
            break;
        case DFNetSalesLastWEEKThruTODAY:
            return @"Net sales last week thru today";
            break;
        case DFUpDownThisWEEK1334:
            return @"Up-Down this week 13-34";
            break;
        default:
            result = @"NOT A VALID FIELD?";
            break;
    }
    return result;
}




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

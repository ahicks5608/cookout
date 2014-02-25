//
//  Daily.h
//  Cookout
//
//  Created by Alex Hicks on 2/13/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "CookOutAmounts.h"
#import "CookOutDaily.h"


@interface Daily: NSObject <CookOutAmounts, CookOutDaily>

@property(nonatomic, strong, getter = getNetSalesAmt, setter = setNetSalesAmt:) NSNumber* netSalesAmt;
@property (nonatomic, readonly, getter = getPayRate) NSNumber *payrate;
@property (nonatomic, readonly, getter = getStoreCode) NSString *storeCode;
@property (nonatomic, readonly, getter = getSalesAmount) NSNumber* salesAmt;
@property (nonatomic, readonly, getter = getCrewCount) NSNumber* crewCount;
@property (nonatomic, readonly, getter = getServiceTime) NSNumber* serviceTime;
@property (nonatomic, readonly, getter = getLaborPercent) NSNumber* laborPercent;
@property (nonatomic, readonly, getter = getUpDownAmount) NSNumber* upDownAmt;
@property (nonatomic, readonly, getter = getEmployeeFoodAmt) NSNumber*employeeFoodAmt;
@property (nonatomic, readonly, getter = getSalesTaxAmt) NSNumber*salesTaxAmt;



-(id) initWithHourly:(NSArray*) hourlies data:(NSDictionary*) values;

//


@end

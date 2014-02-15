//
//  Daily.h
//  Cookout
//
//  Created by Alex Hicks on 2/13/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "CookoutAmounts.h"



@interface Daily: NSObject <CookOutAmounts>

@property(nonatomic, strong, getter = getNetSalesAmt, setter = setNetSalesAmt:) NSNumber* netSalesAmt;
@property (nonatomic, readonly, getter = getPayRate) NSNumber *payrate;
@property (nonatomic, readonly, getter = getStoreCode) NSString *storeCode;
@property (nonatomic, readonly, getter = getSalesAmount) NSNumber* salesAmount;
@property (nonatomic, readonly, getter = getCrewCount) NSNumber* crewCount;
@property (nonatomic, readonly, getter = getServiceTime) NSNumber* serviceTime;
@property(nonatomic, strong) NSDate* createDate;


-(void) setNetSalesAmt:(NSNumber*) value;

//


-(NSNumber*) getEmployeeFoodAmt;
-(void) setEmployeeFood:(NSNumber *) value;

//

-(void) setTotalServiceTime : (NSNumber*) value;

//


-(void) setUpDownToday : (NSNumber*) value;

//




@end

//
//  Hourly.h
//  Cookout
//
//  Created by Alex Hicks on 2/10/14.
//  Copyright (c) 2014 iapps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Common.h"
#import "CookOutHourly.h"
#import "CookOutAmounts.h"

//THIS IS MY CLASS !!!
@interface Hourly : NSObject <CookOutHourly, CookOutAmounts>


//THESE ARE THE PROPERTIES OF THE CLASS

@property (nonatomic, readonly, getter = getPayRate) NSNumber *payrate;
@property (nonatomic, readonly, getter = getStoreCode) NSString *storeCode;

@property (nonatomic, readonly, getter = getSalesAmount) NSNumber* salesAmount;
@property (nonatomic, readonly, getter = getCrewCount) NSNumber* crewCount;
@property (nonatomic, readonly, getter = getServiceTime) NSNumber* serviceTime;
@property (nonatomic, readonly, getter = getTimeOfDay) NSNumber* timeOfDay;
@property (nonatomic, readonly, getter = getUpDownAmount) NSNumber* upDownAmount; 
@property (nonatomic, readonly, getter = getLaborPercent) NSNumber* laborPercent;


-(id) init:(NSUInteger)tod;
-(id) init:(NSNumber*) salesAmount crewCount:(NSNumber*) crewCount;


//THIS IS A CLASS METHOD
+(NSNumber*) getLaborPercentWithSalesAmount:(NSNumber*) salesAmount
                                  crewCount:(NSNumber*) crew;


@end

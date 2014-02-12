//
//  Hourly.h
//  Cookout
//
//  Created by Alex Hicks on 2/10/14.
//  Copyright (c) 2014 iapps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Common.h"


//THIS IS MY CLASS !!!
@interface Hourly : NSObject


//THESE ARE THE PROPERTIES OF THE CLASS
@property (nonatomic, readonly, getter = getStoreCode) NSString *storeCode;
@property (nonatomic, readonly, getter = getPayRate) NSNumber *payrate;
@property (nonatomic, strong) NSNumber* timeOfDay;
@property (nonatomic, strong) NSNumber* saleAmount;
@property (nonatomic, strong) NSNumber* crewCount;
@property (nonatomic, strong) NSNumber* serviceTime;

-(id) init:(NSUInteger)tod;




//THIS IS A INSTNACE METHOD AKA OBJECT METHOD
-(NSNumber*) laborPercent;






//THIS IS A CLASS METHOD
+(NSNumber*) getLaborPercentWithSalesAmount:(NSNumber*) salesAmount
                                  crewCount:(NSNumber*) crew;














@end

//
//  Hourly.h
//  Cookout
//
//  Created by Alex Hicks on 2/10/14.
//  Copyright (c) 2014 iapps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hourly : NSObject

@property (nonatomic, readonly, getter = getStoreCode) NSString *storeCode;
@property (nonatomic, readonly, getter = getPayRate) NSNumber *payrate;
@property (nonatomic,strong) NSNumber* saleAmount;
@property (nonatomic,strong) NSNumber* crewCount;
@property (nonatomic,strong) NSNumber * serviceTime;


-(NSNumber*) laborPercent;




@end

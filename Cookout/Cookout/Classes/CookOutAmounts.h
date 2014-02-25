//
//  CookoutAmounts.h
//  Cookout
//
//  Created by Alex Hicks on 2/15/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CookOutAmounts <NSObject>
@required
-(NSString*) getStoreCode;
-(NSNumber*) getSalesAmt;
-(NSNumber*) getCrewCount;
-(NSNumber*) getServiceTime;
-(NSNumber*) getLaborPercent;
-(NSNumber*) getUpDownAmt;

@end

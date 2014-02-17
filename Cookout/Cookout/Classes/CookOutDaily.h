//
//  CookOutDaily.h
//  Cookout
//
//  Created by Alex Hicks on 2/17/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CookOutDaily <NSObject>
@required

-(NSNumber*) getEmployeeFoodAmt;
-(NSNumber*) getCashOsAmt;
-(NSNumber*) getCashAmt;
-(NSNumber*) getCreditCardAmt;
-(NSNumber*) getSalesTaxAmt;
-(NSNumber*) getMgmtVoidAmt;
-(NSNumber*) getPaidOutAmt;
-(NSNumber*) getTotalDepositAmt;

//init
-(id) initWithHourly:(NSArray*) hourlies data:(NSDictionary*) values;

//methods
-(NSNumber*) compare:(NSObject*) daily what:(NSUInteger) whatToCompare;
-(NSNumber*) compareWithLastWeek:(NSUInteger) value;
-(NSNumber*) compareWithLastYear:(NSUInteger) value;
@end

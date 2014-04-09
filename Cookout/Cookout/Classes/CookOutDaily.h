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

-(NSNumber*) getNetSalesDAY;
-(NSNumber*) getSalesTax;
-(NSNumber*) getCashSHForDep;
-(NSNumber*) getDeposit1;
-(NSNumber*) getDeposit2;
-(NSNumber*) getPaidOutAmt;
-(NSNumber*) getCreditCardAmt;
-(NSNumber*) getTotalDepositAmt;
-(NSNumber*) getCashOsAmt;
-(NSNumber*) getMgmtVoidAmt;
-(NSNumber*) getEmployeeFoodAmt;

//init
-(id) initWithHourly:(NSArray*) hourlies data:(NSDictionary*) values;

//methods
-(NSNumber*) compare:(NSObject*) daily what:(NSUInteger) whatToCompare;
-(NSNumber*) compareWithLastWeek:(NSUInteger) value;
-(NSNumber*) compareWithLastYear:(NSUInteger) value;
@end

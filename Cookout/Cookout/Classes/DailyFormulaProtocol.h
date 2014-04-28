//
//  DailyFormulaProtocol.h
//  Cookout
//
//  Created by Alex Hicks on 4/3/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Daily.h"



@protocol DailyFormulaProtocol <NSObject>

+(NSString*) getValue:(Daily*) value;

+(NSNumber*) getFormulaResult:(Daily*) value;

-(NSUInteger) getFormulaId;

-(NSDictionary*) getvalues;

-(NSNumber*) getResult;


@end

//
//  Formula29.h
//  Cookout
//
//  Created by Alex Hicks on 5/1/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DailyFormulaProtocol.h"
#import "CookOutDaily.h"
#import "Daily.h"

@interface Formula29 : NSObject <DailyFormulaProtocol>

@property (nonatomic, assign) id<CookOutDaily> delegate;

@end

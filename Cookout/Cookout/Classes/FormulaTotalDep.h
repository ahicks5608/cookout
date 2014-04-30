//
//  FormulaTotalDep.h
//  Cookout
//
//  Created by Alex Hicks on 4/30/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DailyFormulaProtocol.h"
#import "CookOutDaily.h"
#import "Daily.h"

@interface FormulaTotalDep : NSObject <DailyFormulaProtocol>

@property (nonatomic, assign) id<CookOutDaily> delegate;

@end

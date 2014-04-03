//
//  Formula10.h
//  Cookout
//
//  Created by Alex Hicks on 4/3/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DailyFormulaProtocol.h"
#import "CookOutDaily.h"


@interface Formula10 : NSObject <DailyFormulaProtocol>

@property (nonatomic, assign) id<CookOutDaily> delegate;

@end

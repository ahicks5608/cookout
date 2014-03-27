//
//  HourlyData.h
//  Cookout
//
//  Created by Alex Hicks on 3/24/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "BaseEntity.h"


@interface HourlyData : BaseEntity

@property (nonatomic, retain) NSNumber * timeOfDay;

@end

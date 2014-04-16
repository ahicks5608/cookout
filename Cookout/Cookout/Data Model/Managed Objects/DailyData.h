//
//  DailyData.h
//  Cookout
//
//  Created by Alex Hicks on 4/16/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "BaseEntity.h"


@interface DailyData : BaseEntity

@property (nonatomic, retain) id data;
@property (nonatomic, retain) id extraInfo;

@end

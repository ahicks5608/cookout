//
//  BaseEntity.h
//  Cookout
//
//  Created by Alex Hicks on 3/12/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface BaseEntity : NSManagedObject

@property (nonatomic, retain) id data;
@property (nonatomic, retain) id extraInfo;
@property (nonatomic, retain) NSDate * timeStamp;
@property (nonatomic, retain) NSString * uuid;

@end

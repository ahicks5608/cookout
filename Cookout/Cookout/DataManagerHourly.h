//
//  DataManagerHourly.h
//  Cookout
//
//  Created by Alex Hicks on 3/6/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataManagerProtocol.h"

@interface DataManagerHourly : NSObject <DataManagerProtocol>

+(BOOL) find:(NSDictionary*) values context:(NSManagedObjectContext*)context;

@end

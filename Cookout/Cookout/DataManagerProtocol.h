//
//  DataManagerProtocol.h
//  Cookout
//
//  Created by Alex Hicks on 3/6/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/NSManagedObject.h>

@protocol DataManagerProtocol <NSObject>

@required
- (void) addNew:(NSDictionary*) values;
- (void) remove:(NSDictionary*) values;
- (void) update:(NSDictionary*) values;
- (NSManagedObject*) load:(NSDictionary*) values;
- (NSArray*) select:(NSDictionary*) values;

@end

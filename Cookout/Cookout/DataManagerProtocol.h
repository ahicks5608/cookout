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
- (NSManagedObject*) addNew:(NSDictionary*) values context:(NSManagedObjectContext*)context;
- (void) remove:(NSDictionary*) values context:(NSManagedObjectContext*)context;
- (void) update:(NSDictionary*) values context:(NSManagedObjectContext*)context;
- (NSManagedObject*) load:(NSDictionary*) values context:(NSManagedObjectContext*)context;
- (NSArray*) select:(NSDictionary*) values context:(NSManagedObjectContext*)context;
@optional
- (NSArray*) addNew:(NSDictionary*) values data:(NSArray*) data context:(NSManagedObjectContext*)context;
@end

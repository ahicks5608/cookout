//
//  CookOutDataTest.m
//  Cookout
//
//  Created by Alex Hicks on 3/7/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <CoreData/CoreData.h>
#import "Hourly.h"
#import "DataManagerHourly.h"


@interface CookOutDataTest : XCTestCase{
    NSManagedObjectModel *model;
    NSPersistentStoreCoordinator *coordinator;
    NSPersistentStore *store;
    NSManagedObjectContext *context;
    DataManagerHourly *dataManager;
}


@end

@implementation CookOutDataTest

- (void)setUp
{
    [super setUp];
    NSURL *applicationDocumentsDirectory = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    
    
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"DataModel" withExtension:@"momd"];
    model = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    NSURL *storeURL = [applicationDocumentsDirectory URLByAppendingPathComponent:@"cookout.db"];
    

    coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    NSError *error = nil;
    store = [coordinator addPersistentStoreWithType:NSInMemoryStoreType configuration:nil URL:storeURL options:nil error:&error];
            
    context = [[NSManagedObjectContext alloc] init];
    context.persistentStoreCoordinator = coordinator;
    
    dataManager = [[DataManagerHourly alloc] init];
}

- (void)tearDown
{
    
    context = nil;
    store = nil;
    coordinator = nil;
    model = nil;
    
    [super tearDown];
}

- (void)testExample
{
    Hourly *hourly1 = [[Hourly alloc] init:[NSNumber numberWithInt:10000] crewCount:[NSNumber numberWithInt:100]];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:hourly1];
    NSManagedObject *row = [dataManager addNew:@{ccnData: data} context:context];
    XCTAssertNotNil(row, @"row is nill");
    
    NSString *uuid = [row valueForKey:ccnUuid];
    //test
    row = [dataManager load:@{ccnUuid: uuid} context:context];
    XCTAssertNotNil(row, @"row is nill");
    
    NSString *uuid2 = [row valueForKey:ccnUuid];
    XCTAssertTrue([uuid isEqualToString:uuid2], @"id isnt equal");
    //XCTAssertEquals (uuid, uuid2, @"id isnt equal");

}

- (NSDate*) formatDate:(NSString*) value{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    [dateFormatter setLocale:locale];
    [dateFormatter setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss Z"];
    return [dateFormatter dateFromString:value];
    
}

- (void)testSelectWithoutPredicate
{

    NSDate *myDate1 = [self formatDate:@"Fri, 07 Mar 2014 01:00:00 -0900"];
    NSDate *myDate2 = [self formatDate:@"Fri, 07 Mar 2014 02:00:00 -0900"];
    NSDate *myDate3 = [self formatDate:@"Fri, 07 Mar 2014 03:00:00 -0900"];
    NSDate *myDate4 = [self formatDate:@"Fri, 07 Mar 2014 04:00:00 -0900"];
    
    
    Hourly *hourly1 = [[Hourly alloc] init:[NSNumber numberWithInt:10000] crewCount:[NSNumber numberWithInt:100]];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:hourly1];
    [dataManager addNew:@{ccnData: data, ccnTimestamp: myDate1} context:context];
    [dataManager addNew:@{ccnData: data, ccnTimestamp: myDate2} context:context];
    [dataManager addNew:@{ccnData: data, ccnTimestamp: myDate3} context:context];
    [dataManager addNew:@{ccnData: data, ccnTimestamp: myDate4} context:context];
    
    NSArray *items = [dataManager select:nil context:context];
    XCTAssertNotNil(items, @"itms are nil");
    XCTAssertTrue(([items count]==4),@"theres not 4" );
}

@end

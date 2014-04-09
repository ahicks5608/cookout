//
//  DataManagerHourly.m
//  Cookout
//
//  Created by Alex Hicks on 3/6/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import "DataManagerHourly.h"
#import "AppDelegate.h"
#import "Common.h"
#import "HourlyViewController.h"
#import "Hourly.h"

@implementation DataManagerHourly

- (void) summarizeData{
    
}


- (NSManagedObject*) addNew:(NSDictionary*) values {
    
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSManagedObject *hourlyData = [NSEntityDescription insertNewObjectForEntityForName:ctnHourlyData  inManagedObjectContext:appDelegate.managedObjectContext];
    Hourly *hourly = [values valueForKey:ccnData];
    NSDictionary *extraInfo = [values valueForKey:ccnExtrainfo];
    NSNumber *hourlyTOD = hourly.timeOfDay;
    
    [hourlyData setValue:[Common generateUuidString] forKey:ccnUuid];
    [hourlyData setValue:hourlyTOD forKey:cfnTimeOfDay];
     NSDate *timeStamp = [values valueForKey:ccnTimestamp];
    if (timeStamp == nil){
        timeStamp = [NSDate date];
    }
    [hourlyData setValue:timeStamp forKey:ccnTimestamp];
    [hourlyData setValue:hourly forKeyPath:ccnData];
    if (extraInfo != nil) {
        [hourlyData setValue:extraInfo forKey:ccnExtrainfo];
    }
    [appDelegate.managedObjectContext save:nil];
    return hourlyData;
    
}

/*- (void) createDaily:(NSManagedObjectContext*)context
{
    NSArray *_items =
    for (NSManagedObject *managedObject in items) {
    	[_managedObjectContext deleteObject:managedObject];
    	NSLog(@"%@ object deleted",entityDescription);
    }
}
*/
+ (BOOL) find:(NSDictionary*) values context:(NSManagedObjectContext*)context{
    NSNumber *value = [values valueForKey:cfnTimeOfDay];
    NSString *uuid = [values valueForKey:ccnUuid];
    NSPredicate *predicate =[NSPredicate predicateWithFormat:@"timeOfDay == %@ and uuid != %@", value, uuid];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:ctnHourlyData inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:ccnTimestamp ascending:NO];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    //
    [fetchRequest setSortDescriptors:sortDescriptors];
    [fetchRequest setPredicate:predicate];
    
    NSFetchedResultsController *fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:context sectionNameKeyPath:nil cacheName:nil];
    
    NSError *error = nil;
  //  NSUInteger count = [fetchedResultsController.fetchedObjects count];
    if ([fetchedResultsController performFetch:&error]) {
        return [fetchedResultsController.fetchedObjects count] > 0;
    }
    return NO;
}


- (NSManagedObject*) load:(NSDictionary*) values {
     AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSString *value = [values valueForKey:ccnUuid];
    NSPredicate *predicate =[NSPredicate predicateWithFormat:@"uuid == %@", value];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:ctnHourlyData inManagedObjectContext:appDelegate.managedObjectContext];
    [fetchRequest setEntity:entity];
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:ccnTimestamp ascending:NO];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    //
    [fetchRequest setSortDescriptors:sortDescriptors];
    [fetchRequest setPredicate:predicate];
    
    NSFetchedResultsController *fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:appDelegate.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    
    NSError *error = nil;
    if ([fetchedResultsController performFetch:&error]) {
        if([fetchedResultsController.fetchedObjects count] > 0) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
            
            return [fetchedResultsController objectAtIndexPath:indexPath];
        }
    }
    return nil;
}


- (void) remove:(NSDictionary*) values {

    NSManagedObject* item = [self load:values];
    if (item != nil) {
        AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        [appDelegate.managedObjectContext deleteObject:item];
        [appDelegate.managedObjectContext save:nil];
        
    }
}

- (void) update:(NSDictionary*) values{
    NSManagedObject* hourlyData = [self load:values ];
    if (hourlyData != nil) {
        AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        Hourly *hourly = [values valueForKey:ccnData];
        NSNumber *hourlyTOD = hourly.timeOfDay;
        NSDictionary *extraInfo = [values valueForKey:ccnExtrainfo];
        if (hourly != nil) {
            [hourlyData setValue:hourly forKeyPath:ccnData];
            [hourlyData setValue:hourlyTOD forKey:cfnTimeOfDay];
        }
        
        if (extraInfo != nil) {
            [hourlyData setValue:extraInfo forKey:ccnExtrainfo];
        }
        [appDelegate saveContext];
    }
}


+ (NSArray*) summarizeData {
    DataManagerHourly *mgr = [[DataManagerHourly alloc] init];
    return [mgr select:nil];
}


- (NSArray*) select:(NSDictionary*) values{
    NSPredicate *predicate = nil;
    if(values != nil) {
        predicate = (NSPredicate*) [values valueForKey:cfnPredicate];
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
     AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSEntityDescription *entity = [NSEntityDescription entityForName:ctnHourlyData inManagedObjectContext:appDelegate.managedObjectContext];
    [fetchRequest setEntity:entity];
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:ccnTimestamp ascending:NO];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    //
    [fetchRequest setSortDescriptors:sortDescriptors];
    if (predicate != nil){
        
        [fetchRequest setPredicate:predicate];
    }
    
    NSFetchedResultsController *fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:appDelegate.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    
    NSError *error = nil;
    if ([fetchedResultsController performFetch:&error]) {
        if([fetchedResultsController.fetchedObjects count] > 0) {
            return [NSArray arrayWithArray:[fetchedResultsController fetchedObjects]];

        }
    }
    return nil;
}

@end

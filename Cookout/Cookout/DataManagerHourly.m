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


@implementation DataManagerHourly

- (NSManagedObject*) addNew:(NSDictionary*) values context:(NSManagedObjectContext*)context {
    

    NSManagedObject *hourly = [NSEntityDescription insertNewObjectForEntityForName:ctnHourlyData  inManagedObjectContext:context];
    NSDictionary *data = [values valueForKey:ccnData];
    NSDictionary *extraInfo = [values valueForKey:ccnExtrainfo];
    
    [hourly setValue:[Common generateUuidString] forKey:ccnUuid];
     NSDate *timeStamp = [values valueForKey:ccnTimestamp];
    if (timeStamp == nil){
        timeStamp = [NSDate date];
    }
    [hourly setValue:timeStamp forKey:ccnTimestamp];
    [hourly setValue:data forKeyPath:ccnData];
    if (extraInfo != nil) {
        [hourly setValue:extraInfo forKey:ccnExtrainfo];
    }
    [context save:nil];
    return hourly;
    
}
- (NSManagedObject*) load:(NSDictionary*) values context:(NSManagedObjectContext*)context {
    
    NSString *value = [values valueForKey:ccnUuid];
    NSPredicate *predicate =[NSPredicate predicateWithFormat:@"uuid == %@", value];
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
    if ([fetchedResultsController performFetch:&error]) {
        if([fetchedResultsController.fetchedObjects count] > 0) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
            
            return [fetchedResultsController objectAtIndexPath:indexPath];
        }
    }
    return nil;
}


- (void) remove:(NSDictionary*) values context:(NSManagedObjectContext*)context{
    NSManagedObject* item = [self load:values context:context];
    if (item != nil) {
        [context deleteObject:item];
        [context save:nil];
        
    }
}

- (void) update:(NSDictionary*) values context:(NSManagedObjectContext*)context {
    NSManagedObject* hourly = [self load:values context:context];
    if (hourly != nil) {
        AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        NSDictionary *data = [values valueForKey:ccnData];
        NSDictionary *extraInfo = [values valueForKey:ccnExtrainfo];
        if (data != nil) {
            [hourly setValue:data forKeyPath:ccnData];
        }
        
        if (extraInfo != nil) {
            [hourly setValue:extraInfo forKey:ccnExtrainfo];
        }
        [appDelegate saveContext];
    }
}

- (NSArray*) select:(NSDictionary*) values context:(NSManagedObjectContext*)context{
    NSPredicate *predicate = nil;
    if(values != nil) {
        NSPredicate *predicate = (NSPredicate*) [values valueForKey:cfnPredicate];
    }
    
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
    if (predicate != nil){
        
        [fetchRequest setPredicate:predicate];
    }
    
    NSFetchedResultsController *fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:context sectionNameKeyPath:nil cacheName:nil];
    
    NSError *error = nil;
    if ([fetchedResultsController performFetch:&error]) {
        if([fetchedResultsController.fetchedObjects count] > 0) {
            return [NSArray arrayWithArray:[fetchedResultsController fetchedObjects]];

        }
    }
    return nil;
}

@end

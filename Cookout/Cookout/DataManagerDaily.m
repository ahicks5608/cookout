//
//  DataManagerDaily.m
//  Cookout
//
//  Created by Alex Hicks on 3/6/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import "DataManagerDaily.h"
#import "AppDelegate.h"
#import "Common.h"



@implementation DataManagerDaily

- (NSManagedObject*) addNew:(NSDictionary*) values;{
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = appDelegate.managedObjectContext;
    NSManagedObject *daily = [NSEntityDescription insertNewObjectForEntityForName:ctnDailyData  inManagedObjectContext:context];
    NSDictionary *data = [values valueForKey:ccnData];
    NSDictionary *extraInfo = [values valueForKey:ccnExtrainfo];
    
    [daily setValue:[Common generateUuidString] forKey:ccnUuid];
    [daily setValue:[NSDate date] forKey:ccnTimestamp];
    [daily setValue:data forKeyPath:ccnData];
    if (extraInfo != nil) {
        [daily setValue:extraInfo forKey:ccnExtrainfo];
    }
    [appDelegate saveContext];
    return daily;
}
     
- (void) remove:(NSDictionary*) values{
    NSManagedObject* item = [self load:values];
    if (item != nil) {
        AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        
        NSManagedObjectContext *context = appDelegate.managedObjectContext;
        [context deleteObject:item];
        [appDelegate saveContext];

    }
}

-(void) update:(NSDictionary*) values{
    NSManagedObject* daily = [self load:values];
    if (daily != nil) {
        AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        NSDictionary *data = [values valueForKey:ccnData];
        NSDictionary *extraInfo = [values valueForKey:ccnExtrainfo];
        if (data != nil) {
            [daily setValue:data forKeyPath:ccnData];
        }
        
        if (extraInfo != nil) {
            [daily setValue:extraInfo forKey:ccnExtrainfo];
        }
        [appDelegate saveContext];
    }
}



    
- (NSArray*) select:(NSDictionary*) values{
    
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context = appDelegate.managedObjectContext;
    
    NSPredicate *predicate = (NSPredicate*) [values valueForKey:cfnPredicate];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:ctnDailyData inManagedObjectContext:context];
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
            return [NSArray arrayWithArray:[fetchedResultsController fetchedObjects]];
            
        }
    }
    return nil;
}


- (NSManagedObject*) load:(NSDictionary*) values{
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context = appDelegate.managedObjectContext;
    
    NSString *value = [values valueForKey:ccnUuid];
    NSPredicate *predicate =[NSPredicate predicateWithFormat:@"uuid == %@", value];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:ctnDailyData inManagedObjectContext:context];
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

@end

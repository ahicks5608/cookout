//
//  DailyListViewController.m
//  Cookout
//
//  Created by Alex Hicks on 4/16/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import "DailyListViewController.h"
#import "Common.h"
#import "DataManagerDaily.h"
#import "DailyData.h"
#import "Daily.h"
#import "CommonPushSegue.h"
#import "DailyViewController.h"

@interface DailyListViewController (){
    NSArray *_items;
    NSDateFormatter *_dateFormatter;
}

@end

@implementation DailyListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    DataManagerDaily *daily = [[DataManagerDaily alloc] init];
    _items = [daily select:nil];
    _dateFormatter = [[NSDateFormatter alloc] init];
    [_dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    [_dateFormatter setDateStyle:NSDateFormatterMediumStyle];
        
}

- (void) showDaily:(NSUInteger) index {
    DailyData *item = (DailyData *) [_items objectAtIndex:index];
    Daily *data = [(Daily *) item valueForKey:ccnData];
        UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"daily" bundle:nil];
    DailyViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"DailyViewController"];
    controller.data = data;
    CommonPushSegue *segue = [[CommonPushSegue alloc] initWithIdentifier:@"masterToDetail"
                                                                    source:self
                                                               destination:controller];
    [self prepareForSegue:segue sender:self];
    [segue perform];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_items count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DailiesViewCell" forIndexPath:indexPath];
    NSManagedObject *item = [_items objectAtIndex:indexPath.row];
    NSDate *date = [item valueForKey:ccnTimestamp];
   
    cell.textLabel.text = [_dateFormatter stringFromDate:date];
    
    return cell;
}



-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self showDaily:indexPath.row];

    }
@end
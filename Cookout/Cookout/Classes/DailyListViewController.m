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
#import "AppDelegate.h"
#import "DataManagerDaily.h"
@interface DailyListViewController (){
    NSMutableArray *_items;
    NSDateFormatter *_dateFormatter;
    DataManagerDaily *_dataManager;
    UIBarButtonItem *_editButton;
    BOOL _newRecord;
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

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        DailyData *hd = (DailyData*) [_items objectAtIndex:indexPath.row];
        AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        [appDelegate.managedObjectContext deleteObject:hd];
        [appDelegate.managedObjectContext save:nil];
        DataManagerDaily *daily = [[DataManagerDaily alloc] init];
        if (_items == nil) {
            _items = [[NSMutableArray alloc] init];
        } else {
            [_items removeAllObjects];
        }
        [_items addObjectsFromArray:[daily select:nil]];
        _editButton.enabled = [_items count] >0;
        [self.tableView reloadData];
        
        
    }
}


-(void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer{
    if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft){
        self.tableView.editing = YES;
    }
}
- (void) doEdit:(id) sender {
    _newRecord = FALSE;
    if (self.tableView.editing == NO) {
        self.tableView.editing = YES;
    }
}



- (void) viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    
    UISwipeGestureRecognizer *swipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
    [swipeRecognizer setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    [self.tableView addGestureRecognizer:swipeRecognizer];


    NSMutableArray *buttons = [NSMutableArray arrayWithArray:self.navigationItem.leftBarButtonItems];
    _editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
                                                                target:self action: @selector(doEdit:)];
    
    
    [buttons insertObject:_editButton atIndex:0];
    self.navigationItem.leftItemsSupplementBackButton = YES;
    self.navigationItem.leftBarButtonItems = buttons;
    
    DataManagerDaily *daily = [[DataManagerDaily alloc] init];
    if (_items == nil) {
        _items = [[NSMutableArray alloc] init];
    } else {
        [_items removeAllObjects];
    }
    [_items addObjectsFromArray:[daily select:nil]];
    if (_dateFormatter == nil) {
        _dateFormatter = [[NSDateFormatter alloc] init];
        [_dateFormatter setTimeStyle:NSDateFormatterNoStyle];
        [_dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    }
}

- (void) showDaily:(NSUInteger) index {
    DailyData *item = (DailyData *) [_items objectAtIndex:index];
    Daily *data = [(Daily *) item valueForKey:ccnData];
    data.parentUUID = item.uuid;

   NSString *value = [data getValueAtIndex:DFPaidOuts];
    NSLog(@"value %@",value);
    
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
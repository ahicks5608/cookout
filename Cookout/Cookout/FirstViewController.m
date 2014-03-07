//
//  FirstViewController.m
//  Cookout
//
//  Created by David Hicks on 2/12/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import "FirstViewController.h"
#import "AppDelegate.h"
#import "HourlyTableViewCell.h"
#import "Common.h"
#import "DataManagerHourly.h"

@interface FirstViewController () {
    NSString* _cellIdentifier;
    NSArray* _items;
    DataManagerHourly* _dataManager;
    
}

@end

@implementation FirstViewController


- (void)addNew {
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _cellIdentifier = @"HourlyTableViewCell";
    _dataManager = [[DataManagerHourly alloc] init];
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context = appDelegate.managedObjectContext;
    _items = [_dataManager select:nil context:context];
    
    
    NSMutableArray *buttons = [NSMutableArray arrayWithArray:self.navigationItem.rightBarButtonItems];
    UIBarButtonItem *addButton =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                              target:self action: @selector(addNew)];
    
    [buttons insertObject:addButton atIndex:0];
    self.navigationItem.rightBarButtonItems = buttons;
    
    if (self.navigationItem != nil) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        label.backgroundColor = [UIColor clearColor];
        
        label.text = @"Hourly";
        [self.navigationItem setTitleView:label];
        [label sizeToFit];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.0f;
}

-(NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [Common getTitleForTimeOfDay:[NSNumber numberWithInt:section]];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [_items count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   // HourlyTableViewCell *cell = [tableView dequeueReusableCellWithReuseIdentifier: _cellIdentifier forIndexPath:indexPath];
    HourlyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_cellIdentifier forIndexPath:indexPath];
//    [cell configWithData:@{cfnServiceTime:@"87", cfnLaborPercent:@"%15.4", cfnHoursWorked:@"67", cfnSalesAmt:@"1768"}];
    return cell;
}

@end


























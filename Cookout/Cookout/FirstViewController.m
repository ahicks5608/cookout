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
#import "CommonModalSegue.h"
#import "DataManagerHourly.h"
#import "HourlyEditViewController.h"
#import "Hourly.h"
#import "DailyData.h"



@interface FirstViewController () {
    NSString* _cellIdentifier;
    NSArray* _items;
    DataManagerHourly* _dataManager;
    HourlyData *_selectedData;
    
    
}

@end

@implementation FirstViewController


- (void)addNew {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    HourlyEditViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"HourlyEditViewController"];
    controller.delegate = self;
    CommonModalSegue *segue = [[CommonModalSegue alloc] initWithIdentifier:@"masterToDetail"
                                      source:self
                                      destination:controller];
    [self prepareForSegue:segue sender:self];
    [segue perform];
}
- (void) reload{
        AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = appDelegate.managedObjectContext;
    _items = [_dataManager select:nil context:context];
    [_tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _cellIdentifier = @"HourlyTableViewCell";
    _dataManager = [[DataManagerHourly alloc] init];

    [self reload];
    
    
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
    return 150.0f;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [_items count];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    HourlyEditViewController *controller = (HourlyEditViewController*)[ segue destinationViewController];
  //   NSDictionary *hourly= ( NSDictionary*) [_selectedData valueForKey:ccnData];
    [controller configWithData:_selectedData];
    
        
    }



-(void) showEditor {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
   HourlyEditViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"HourlyEditViewController"];
    controller.delegate = self;
    CommonModalSegue *segue = [[CommonModalSegue alloc] initWithIdentifier:@"masterToDetail"
                                                                    source:self
                                                               destination:controller];
    [self prepareForSegue:segue sender:self];
    [segue perform];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   // HourlyTableViewCell *cell = [tableView dequeueReusableCellWithReuseIdentifier: _cellIdentifier forIndexPath:indexPath];
    HourlyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_cellIdentifier forIndexPath:indexPath];
    
    HourlyData *hd = (HourlyData*) [_items objectAtIndex:indexPath.row];
    NSDictionary *hourly= ( NSDictionary*) [hd valueForKey:ccnData];
    
    
    cell.fldSalesAmt.text = [hourly valueForKey:cfnSalesAmt];
    cell.fldHoursWorked.text = [hourly valueForKey:cfnHoursWorked];
    cell.fldServiceTime.text = [hourly valueForKey:cfnServiceTime];
    
    //cell.fldLaborPercent.text = [hourly valueForKey:cfnLaborPercent];
    NSNumber *value = [hourly valueForKey:cfnTimeOfDay];
    cell.fldTimeOfDay.text = [Common getTitleForTimeOfDay:[value intValue]];
    
   cell.fldLaborPercent.text = [Hourly getLaborPercentWithSalesAmount:[hourly valueForKey:cfnSalesAmt] crewCount:[hourly valueForKey:cfnHoursWorked]];
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    _selectedData = (HourlyData*) [_items objectAtIndex:indexPath.row];
    [self showEditor];
    
}

#pragma mark - Modal methods

- (void) willDismissViewController:(UIViewController*) controller
{
    HourlyEditViewController *viewController = (HourlyEditViewController*) controller;
    NSString *hoursWorked = viewController.fldHoursWorked.text;
    NSString *salesAmount = viewController.fldSalesAmt.text;
    NSString *serviceTime = viewController.fldServiceTime.text;
    NSInteger timeOfDay = [viewController.fldTimeOfDay selectedRowInComponent:0];
    
    //NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] init];
    
    NSDictionary *dict = @{cfnSalesAmt: salesAmount,
                           cfnHoursWorked: hoursWorked,
                           cfnServiceTime: serviceTime,
                           cfnUpDownAmt: [NSNumber numberWithInt:0],
                           cfnTimeOfDay:[NSNumber numberWithInt:timeOfDay]};
    
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
   
    Hourly *hourly = [[Hourly alloc] initWithDictionary:dict];
    [_dataManager addNew:@{ccnData: hourly} context:appDelegate.managedObjectContext];
    [self reload];
    

    //Hourly *hourly = [[Hourly alloc] initWithDictionary:dict];
    
    
    
    // - (NSManagedObject*) addNew:(NSDictionary*) values;
    
    /*
     _salesAmt = [decoder decodeObjectForKey:cfnSalesAmt];
     _crewCount = [decoder decodeObjectForKey:cfnHoursWorked];
     _timeOfDay = [decoder decodeObjectForKey:cfnTimeOfDay];
     _serviceTime = [decoder decodeObjectForKey:cfnTimeOfDay];
     _upDownAmt = [decoder decodeObjectForKey:cfnUpDownAmt];
     */
    
    
}

- (void) didDismissViewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


@end


























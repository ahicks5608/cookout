//
//  FirstViewController.m
//  Cookout
//
//  Created by David Hicks on 2/12/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import "HourlyViewController.h"
#import "AppDelegate.h"
#import "HourlyTableViewCell.h"
#import "Common.h"
#import "CommonModalSegue.h"
#import "DataManagerHourly.h"
#import "HourlyEditViewController.h"
#import "Hourly.h"
#import "DailyData.h"
#import "Daily.h"
#import "HourlyData.h"
#import "DataManagerDaily.h"


@interface HourlyViewController () {
    NSString* _cellIdentifier;
    NSArray* _items;
    DataManagerHourly* _dataManager;
    HourlyData *_selectedData;
    UIBarButtonItem *_editButton;
    BOOL _newRecord;
    
    
}

@end

@implementation HourlyViewController


- (void)addNew {
    _newRecord = TRUE;
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Hourly" bundle:nil];
    HourlyEditViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"HourlyEditViewController"];
    controller.delegate = self;
    CommonModalSegue *segue = [[CommonModalSegue alloc] initWithIdentifier:@"masterToDetail"
                                      source:self
                                      destination:controller];
    [self prepareForSegue:segue sender:self];
    [segue perform];
}
- (void) reload{
    _items = [_dataManager select:nil];
    _editButton.enabled = [_items count] >0;
    [_tableView reloadData];
}

- (void) doEdit:(id) sender {
    _newRecord = FALSE;
    if (self.tableView.editing == NO) {
        self.tableView.editing = YES;
    }
}

//GESTURE FOR DELETING

-(void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer{
    if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft){
        self.tableView.editing = YES;
        
        
        /*[UIAlertView alloc] initWithTitle: @"About to be delted" message: @"It turns out that you are playing Addicus!" delegate: nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];*/
    }
}

                                                                                            // SUMMARIZING THE VALUES FOR DAILY 

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 1) {
        
        float netSalesAmt = 0.00;
        int serviceTime1 = 0;  //average service before 5
        int serviceTime2 = 0;  //average sevice after 5
        float moneyPaid = 0;  //#15 lab$paysh                          !! Formula 15 !!
        int count1 = 0;
        int count = [_items count];
        for (HourlyData *item in _items) {
            Hourly *hourly = (Hourly*) item.data;
            netSalesAmt += [hourly.salesAmt floatValue];
            moneyPaid += [hourly.laborRate floatValue] * [hourly.crewCount intValue];
            
            int timeVal = [hourly.timeOfDay intValue];
            
            if ((timeVal >= TOD0) && (timeVal <= TOD17)) {
                serviceTime1 += [hourly.serviceTime intValue];
                count1 += 1;
                
            }else {
                serviceTime2 += [hourly.serviceTime intValue];
                
            }
            
        }
        if ((count > 0 ) && (count - count1 == 0)) {
            count1 = 0;
        }
        serviceTime2 = serviceTime2 / (count - count1);
        serviceTime1 = serviceTime1 / (count1==0?1:count1);
       // moneyPaid = moneyPaid / count;
        
        NSNumber *netSalesVal = [NSNumber numberWithFloat:netSalesAmt];
        
        NSNumber *serviceTime1Val = [NSNumber numberWithInt:serviceTime1];
        NSNumber *serviceTime2Val = [NSNumber numberWithInt:serviceTime2];
        NSNumber *moneyPaidVal = [NSNumber numberWithFloat:moneyPaid];
        
        NSDictionary *values = @{cfnSalesAmt: netSalesVal, cfnServiceTime: serviceTime1Val, cfnServiceTime2: serviceTime2Val, cfnLabMoneyPaid: moneyPaidVal};
        Daily *daily = [[Daily alloc] initWithData:values];
        DataManagerDaily *dataManagerDaily = [[DataManagerDaily alloc] init];
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:_items];
        NSManagedObject *newItem = [dataManagerDaily addNew:@{ccnData: daily, ccnExtrainfo: data}];
        NSString *uuid = [newItem valueForKey:ccnUuid];
        daily.parentUUID = uuid;
        
    } else{
        NSDate *today = [NSDate date];
        NSInteger dow = [Common dayOfWeek:today] -1;
        NSDate *sunday = [today dateByAddingTimeInterval:60*60*24*-dow];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];

        
        NSLog(@"sunday for locale %@: %@",
              [[dateFormatter locale] localeIdentifier], [dateFormatter stringFromDate:sunday]);
    }
    
}

- (void) endOfDay {
    UIAlertView *alert;
    if ( (_items == nil) || ([_items count] == 0)) {
        alert = [[UIAlertView alloc] initWithTitle:@"Create a Daily"
                                           message:@"A daily report requires at least one or more hourly records."
                                          delegate:nil
                                 cancelButtonTitle:@"Continue"
                                 otherButtonTitles:nil];
    }else {
        alert = [[UIAlertView alloc] initWithTitle:@"Create a Daily"
                                           message:@"Are you sure you want to close out current day ?"
                                          delegate:self
                                 cancelButtonTitle:@"Cancel"
                                 otherButtonTitles:@"OK",nil];
    }
    [alert show];
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //gesture for deleting
    UISwipeGestureRecognizer *swipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
    [swipeRecognizer setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    [_tableView addGestureRecognizer:swipeRecognizer];

    
	// Do any additional setup after loading the view, typically from a nib.
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _cellIdentifier = @"HourlyTableViewCell";
    _dataManager = [[DataManagerHourly alloc] init];


    
    // LEFT BAR BUTTON EDIT
    NSMutableArray *buttons = [NSMutableArray arrayWithArray:self.navigationItem.leftBarButtonItems];
    _editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
                                                                              target:self action: @selector(doEdit:)];
    
    
    [buttons insertObject:_editButton atIndex:0];
    self.navigationItem.leftItemsSupplementBackButton = YES;
    self.navigationItem.leftBarButtonItems = buttons;

    
    //RIGHT BAR BUTTON ADD
    buttons = [NSMutableArray arrayWithArray:self.navigationItem.rightBarButtonItems];
    UIBarButtonItem *addButton =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                              target:self action: @selector(addNew)];
    
    
    
    //#2 RIGHT BAR BUTTON END OF DAY
    UIBarButtonItem *endOfDayButton =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose
                                                                              target:self action: @selector(endOfDay)];
    
    [buttons insertObject:addButton atIndex:0];
    [buttons insertObject:endOfDayButton atIndex:1];
    
    
    self.navigationItem.rightBarButtonItems = buttons;
    
    if (self.navigationItem != nil) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        label.backgroundColor = [UIColor clearColor];
        
        label.text = @"Hourly";
        [self.navigationItem setTitleView:label];
        [label sizeToFit];
    }
        [self reload];
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
    //HourlyEditViewController *controller = (HourlyEditViewController*)[ segue destinationViewController];
  //   NSDictionary *hourly= ( NSDictionary*) [_selectedData valueForKey:ccnData];
  //  [controller configWithData:_selectedData];
    
        
    }



-(void) showEditor {
    _newRecord = FALSE;
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Hourly" bundle:nil];
   HourlyEditViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"HourlyEditViewController"];
    controller.delegate = self;
    CommonModalSegue *segue = [[CommonModalSegue alloc] initWithIdentifier:@"masterToDetail"
                                                                    source:self
                                                               destination:controller];
    [controller configWithData:_selectedData];
    [self prepareForSegue:segue sender:self];
    [segue perform];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   // HourlyTableViewCell *cell = [tableView dequeueReusableCellWithReuseIdentifier: _cellIdentifier forIndexPath:indexPath];
    HourlyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_cellIdentifier forIndexPath:indexPath];
    
    HourlyData *hd = (HourlyData*) [_items objectAtIndex:indexPath.row];
    id object = [hd valueForKeyPath:ccnData];
    
    //NSLog(@"class %@",NSStringFromClass([object class]));
    //Hourly *hourly = (Hourly*)object;
   // NSDictionary *hourly= ( NSDictionary*) [hd valueForKey:ccnData];
    Hourly *hourly = (Hourly*)object;
    
    cell.fldSalesAmt.text =  [Common formatNumberAsMoney:hourly.salesAmt]; //[hourly valueForKey:cfnSalesAmt];
    cell.fldHoursWorked.text = [hourly.crewCount stringValue]; //[hourly valueForKey:cfnHoursWorked];
    cell.fldServiceTime.text = [hourly.serviceTime stringValue];//[hourly valueForKey:cfnServiceTime];
    cell.fldLaborPercent.text = [Common formatNumberAsPercent:hourly.laborPercent];//[hourly valueForKeyPath:cfnLaborPercent];
 //  NSNumber *value =  //[hourly valueForKey:cfnTimeOfDay];
    cell.fldTimeOfDay.text = [Common getTitleForTimeOfDay:[hourly.timeOfDay intValue]];
    cell.fldLaborRate.text = [Common formatNumberAsMoney:hourly.laborRate];
//   cell.fldLaborPercent.text = [Hourly getLaborPercentWithSalesAmount:[hourly valueForKey:cfnSalesAmt] crewCount:[hourly valueForKey:cfnHoursWorked]];
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    _selectedData = (HourlyData*) [_items objectAtIndex:indexPath.row];
    [self showEditor];
    
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        HourlyData *hd = (HourlyData*) [_items objectAtIndex:indexPath.row];
        AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        [appDelegate.managedObjectContext deleteObject:hd];
        [appDelegate.managedObjectContext save:nil];
        _items = nil;
         _items = [_dataManager select:nil];
        _editButton.enabled = [_items count] >0;
        [self.tableView reloadData];
        
        
    }
}


#pragma mark - TAB BAR 

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    
}







#pragma mark - Modal methods

- (void) willDismissViewController:(UIViewController*) controller
{
    HourlyEditViewController *viewController = (HourlyEditViewController*) controller;
    NSString *hoursWorked = viewController.fldHoursWorked.text;
    NSString *str = viewController.fldSalesAmt.text;
    
   // NSString *salesAmount = [str substringWithRange:NSMakeRange(1, [str length]-1 )];
    NSString *salesAmount = [str stringByReplacingOccurrencesOfString:@"$" withString:@""];
    salesAmount = [salesAmount stringByReplacingOccurrencesOfString:@"," withString:@""];
    NSString *serviceTime = viewController.fldServiceTime.text;
    NSInteger timeOfDay = [viewController.fldTimeOfDay selectedRowInComponent:0];
    NSString *laborRate = viewController.fldLaborRate.text;
    laborRate = [laborRate stringByReplacingOccurrencesOfString:@"$" withString:@""];
    //NSString *laborRate= [str substringWithRange:NSMakeRange(1, [str length]-1 )];
    //NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] init];
    
    NSDictionary *dict = @{cfnSalesAmt: [NSNumber numberWithFloat:salesAmount.floatValue],
                           cfnHoursWorked: [NSNumber numberWithInt:hoursWorked.intValue],
                           cfnServiceTime: [NSNumber numberWithInt:serviceTime.intValue],
                           cfnUpDownAmt: [NSNumber numberWithInt:0],
                           cfnTimeOfDay:[NSNumber numberWithInt:timeOfDay],
                           cfnLaborRate: [NSNumber numberWithFloat:laborRate.floatValue]
                           };
    
    
   
    
    Hourly *hourly = [[Hourly alloc] initWithDictionary:dict];
    if (_newRecord == TRUE) {
        [_dataManager addNew:@{ccnData: hourly}];
    } else {
        NSMutableDictionary *dict2 = [[NSMutableDictionary alloc] initWithCapacity:2];
        NSString *value = [_selectedData valueForKey:ccnUuid];
        [dict2 setValue:value forKey:ccnUuid];
        [dict2 setValue:hourly forKey:ccnData];
        [_dataManager update:dict2];
        
    }
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


























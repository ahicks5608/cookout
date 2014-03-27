//
//  HourlyEditViewController.m
//  Cookout
//
//  Created by Alex Hicks on 3/7/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import "HourlyEditViewController.h"
#import "AppDelegate.h"
#import "Common.h"
#import "CommonModalSegue.h"
#import "CalculatorViewController.h"
#import "Hourly.h"
#import "FirstViewController.h"
#import "HourlyData.h"
#import "DataManagerHourly.h"


@interface HourlyEditViewController () {
    NSManagedObject *_data;
    NSInteger _tag;
    NSArray *_items;
    NSNumber *_selectedRow;
    NSString *_uuid;
}

@end

@implementation HourlyEditViewController


- (BOOL) isValidValues {
    
    NSInteger timeOfDay = [_fldTimeOfDay selectedRowInComponent:0];
    [NSNumber numberWithInt:timeOfDay];
    
    
     AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    if ([DataManagerHourly find:@{cfnTimeOfDay:[NSNumber numberWithInt:timeOfDay], ccnUuid:_uuid} context:appDelegate.managedObjectContext]) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hourly Report"
                                                        message:@"A report already exists for this time of day."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        return NO;

    } else {
      return  [super isValidValues];
    }
}

// saving contents of text field into calcVC.calResult
- (BOOL) isValidValue:(UIViewController*) controller  {
    CalculatorViewController *calcVC = (CalculatorViewController*) controller;
    NSString *alex = calcVC.calcResult.text;
    char character = '-';
    BOOL result = [alex rangeOfString:[NSString stringWithFormat:@"%c",character]].location == NSNotFound;
    if (result == NO) {
        NSString *title;
        switch (_tag) {
                
            case efHoursWorked:
                title =  _lblHoursWorked.text;
                break;
            case efSalesAmt:
                title = _lblSalesAmt.text;
                break;
            case efServiceTime:
                title = _lblServiceTime.text;
                break;
            case efLaborRate:
                title = _lblLaborRate.text ;
                break;
            default:
                break;
        }
        
        
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                        message:@"Value can not be less than zero."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];

    }
    return result;
}

- (void) willDismissViewController:(UIViewController *)controller {
    
    CalculatorViewController *calcVC = (CalculatorViewController*) controller;
    switch (_tag) {

        case efHoursWorked:
            _fldHoursWorked.text = calcVC.calcResult.text;
            break;
        case efSalesAmt:
            _fldSalesAmt.text = [Common formatNumberAsMoney:[NSNumber numberWithFloat:calcVC.calcResult.text.floatValue]];
            break;
        case efServiceTime:
            _fldServiceTime.text = calcVC.calcResult.text;
            break;
        case efLaborRate:
            _fldLaborRate.text = [Common formatNumberAsMoney:[NSNumber numberWithFloat:calcVC.calcResult.text.floatValue]];
            break;
        default:
            break;
    }
    
}

- (void) didDismissViewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - The Picker Delegate

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{

}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [_items count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [_items objectAtIndex:row];
}


/*
 - (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView
 {
 
 
 return 1;
 }
 
 - (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component
 {
 return [_yearArray count];
 }
 
 - (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
 {
 return [_yearArray objectAtIndex:row];
 }
 
 // Picker Delegate
 - (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
 {
 
 
 }
 */

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(id) init {
    if (self = [super init]) {
        _data = nil;

    }
    return self;
    
}

- (void) configWithData:(NSManagedObject*) data {
    _data = data;

            
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    CalculatorViewController *controller = (CalculatorViewController*)[ segue destinationViewController];
    switch (_tag) {
        case efSalesAmt:
            [controller configWithData:@{cfnValue: _fldSalesAmt.text}];
            break;
        case efHoursWorked:
            [controller configWithData:@{cfnValue: _fldHoursWorked.text}];
            break;
        case efServiceTime:
            [controller configWithData:@{cfnValue: _fldServiceTime.text}];
            break;
        case efLaborRate:
            [controller configWithData:@{cfnValue: _fldLaborRate.text}];
            break;
        default:
            break;
    }
}

-(void) showCalc {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Calc" bundle:nil];
    CalculatorViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"CalculatorViewController"];
    controller.delegate = self;
    CommonModalSegue *segue = [[CommonModalSegue alloc] initWithIdentifier:@"masterToDetail"
                                                                    source:self
                                                               destination:controller];
    [self prepareForSegue:segue sender:self];
    [segue perform];
}

- (void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

}

- (void) viewDidLoad
{
    [super viewDidLoad];
    _fldHoursWorked.delegate = self;
    _fldHoursWorked.text = @"0";
    _fldHoursWorked.tag = efHoursWorked;
    _fldSalesAmt.delegate = self;
    _fldSalesAmt.text = @"0.00";
    _fldSalesAmt.tag = efSalesAmt;
    _fldServiceTime.delegate = self;
    _fldServiceTime.text = @"0";
    _fldServiceTime.tag = efServiceTime;
    _fldLaborRate.delegate = self;
    _fldLaborRate.text = @"9.00"; //default from settings
    _fldLaborRate.tag = efLaborRate;
    _selectedRow = @0;
    _uuid = @"";
    _fldTimeOfDay.delegate = self;
    _fldTimeOfDay.dataSource = self;
            _items = [Common getTitlesForTimeofDay];
    if (_data != nil) {

        HourlyData *hd = (HourlyData*)_data;
        _uuid = [hd valueForKey:ccnUuid];
        Hourly *hourly = (Hourly*)[hd valueForKeyPath:ccnData];
        _fldSalesAmt.text =  [Common formatNumberAsMoney:hourly.salesAmt]; //[hourly valueForKey:cfnSalesAmt];
        _fldHoursWorked.text = [hourly.crewCount stringValue]; //[hourly valueForKey:cfnHoursWorked];
        _fldServiceTime.text = [hourly.serviceTime stringValue];//[hourly valueForKey:cfnServiceTime];
        _fldLaborRate.text = [Common formatNumberAsMoney:hourly.laborRate];//[hourly valueForKeyPath:cfnLaborPercent];
        _selectedRow =  [hourly valueForKey:cfnTimeOfDay];
        [_fldTimeOfDay selectRow:[_selectedRow intValue] inComponent:0 animated:YES];
    }

}

#pragma mark UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {


    _tag = textField.tag;
        [self showCalc];
    return NO;
    
    
}



@end

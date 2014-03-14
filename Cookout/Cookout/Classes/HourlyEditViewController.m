//
//  HourlyViewController.m
//  Cookout
//
//  Created by Alex Hicks on 3/7/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import "HourlyEditViewController.h"
#import "Common.h"
#import "CommonModalSegue.h"
#import "CalculatorViewController.h"



@interface HourlyEditViewController () {
    NSManagedObject *_data;
    NSInteger _tag;
}

@end

@implementation HourlyEditViewController

- (void) willDismissViewController:(UIViewController *)controller {
    
    CalculatorViewController *calcVC = (CalculatorViewController*) controller;
    switch (_tag) {
        case efHoursWorked:
            _fldHoursWorked.text = calcVC.calcResult.text;
            break;
        case efSalesAmt:
            _fldSalesAmt.text = calcVC.calcResult.text;
            break;
        case efServiceTime:
            _fldServiceTime.text = calcVC.calcResult.text;
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
    return 24;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [Common getTitleForTimeOfDay:row];
}


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


- (void) viewDidLoad
{
    [super viewDidLoad];
    _fldHoursWorked.delegate = self;
    _fldHoursWorked.tag = efHoursWorked;
    _fldSalesAmt.delegate = self;
    _fldSalesAmt.tag = efSalesAmt;
    _fldServiceTime.delegate = self;
    _fldServiceTime.tag = efServiceTime;

}

#pragma mark UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {


    _tag = textField.tag;
        [self showCalc];
    return NO;
    
    
}



@end

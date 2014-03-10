//
//  HourlyViewController.m
//  Cookout
//
//  Created by Alex Hicks on 3/7/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import "HourlyEditViewController.h"
#import "Common.h"

@interface HourlyEditViewController () {
    NSManagedObject *_data;
}

@end

@implementation HourlyEditViewController

#pragma mark - The Picker Data Source


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

- (void) onDonePressed
{
    [_delegate willDismissViewController:self];
    [_delegate didDismissViewController];
}

- (void) onCancelPressed
{
    [_delegate didDismissViewController];
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    _fldHoursWorked.delegate = self;
    _fldLaborPercent.delegate = self;
    _fldSalesAmt.delegate = self;
    _fldServiceTime.delegate = self;
    
    // NSMutableArray *buttons = [NSMutableArray arrayWithArray:self.navigationItem.rightBarButtonItems];
    UIBarButtonItem *doneButton =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                               target:self action: @selector(onDonePressed)];
    self.navigationItem.rightBarButtonItem = doneButton;
    ///
    
    
    
    UIBarButtonItem *cancelButton =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                 target:self action: @selector(onCancelPressed)];
    self.navigationItem.leftBarButtonItem = cancelButton;
    // Do any additional setup after loading the view.
}

@end

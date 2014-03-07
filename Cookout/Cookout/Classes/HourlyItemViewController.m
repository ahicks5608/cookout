//
//  HourlyEditViewController.m
//  Cookout
//
//  Created by Alex Hicks on 2/27/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import "HourlyItemViewController.h"
#import "Common.h"
#import "CalculatorViewController.h"
#import "CommonModalSegue.h"

@interface HourlyItemViewController ()

@end

@implementation HourlyItemViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _fldHoursWorked.delegate = self;
    _fldLaborPercent.delegate = self;
    _fldSalesAmt.delegate = self;
    _fldServiceTime.delegate = self;
    // Do any additional setup after loading the view.
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



-(void) configWithData:(NSDictionary*) values{
    _fldSalesAmt.text = [values valueForKey:cfnSalesAmt];
    _fldServiceTime.text = [values valueForKey:cfnServiceTime];
    _fldHoursWorked.text = [values valueForKey:cfnHoursWorked];
    _fldLaborPercent.text = [values valueForKey:cfnLaborPercent];
    
}

-(void) showInfo {
UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    CalculatorViewController* calcVC = [storyboard instantiateViewControllerWithIdentifier:@"CalculatorViewController"];
    
  CommonModalSegue *segue = [[CommonModalSegue alloc] initWithIdentifier:@"CalculatorView"
                                   source:self
                                   destination:calcVC];
    [self prepareForSegue:segue sender:self];
    [segue perform];
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    [self showInfo];
    return NO;
}



@end



//
//  DailyViewController.m
//  Cookout
//
//  Created by Alex Hicks on 3/31/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//
#import "AppDelegate.h"
#import "DailyViewController.h"
#import "DailyTableViewCell.h"
#import "Common.h"
#import "CalculatorViewController.h"
#import "CommonModalSegue.h"
#import "DailyFormulaViewController.h"
#import "CommonPushSegue.h"
#import "Daily.h"


@interface DailyViewController () {
    NSUInteger _selectedRow;
    
}

@end

@implementation DailyViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    ;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [_tableView reloadData];
}

/* case DFNightServiceTime: {
NSNumber *value = [_fields objectAtIndex:index];
return [value stringValue];
}
case DFLaborAmtDAYPaysh:
*/

- (void) willDismissViewController:(UIViewController*) controller {
    CalculatorViewController *calcVC = (CalculatorViewController*) controller;
    NSString *strVal = calcVC.calcResult.text;
    strVal = [strVal stringByReplacingOccurrencesOfString:@"$" withString:@""];
    [_data setValueAtIndex:_selectedRow value:[ NSNumber numberWithFloat:strVal.floatValue]];
    NSString *alex99 = [_data getValueAtIndex:_selectedRow];
    NSLog(@"value %@", alex99);
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    [appDelegate saveContext];


}


- (void) didDismissViewController{
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.tableView reloadData];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"masterToFormula"]) {
        DailyFormulaViewController *controller =  (DailyFormulaViewController*)segue.destinationViewController;
        [controller configWithData:_data fieldId:_selectedRow];
    } else if ([segue.identifier isEqualToString:@"masterToDetail"]) {
        CalculatorViewController *controller =  (CalculatorViewController*)segue.destinationViewController;
        [controller configWithData:@{cfnValue:[_data getValueAtIndex:_selectedRow]}];
    }
        
    
}

-(void) showFormula {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"DailyFormula" bundle:nil];
    DailyFormulaViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"DailyFormula"];
    CommonPushSegue *segue = [[CommonPushSegue alloc] initWithIdentifier:@"masterToFormula"
                                                                    source:self
                                                               destination:controller];
    [self prepareForSegue:segue sender:self];
    [segue perform];
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return 35;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   DailyTableViewCell *cell = (DailyTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"DailyTableViewCell" forIndexPath:indexPath];
    
    cell.header.text = [Common getTitleForDaily:indexPath.row];
    cell.value.text = [_data getValueAtIndex:indexPath.row];
    
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    _selectedRow = indexPath.row;
    if ([Common canEditDaily:indexPath.row]) {
        [self showCalc];
        
    }else if (indexPath.row == DFNetSalesDAY) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"NET SALES TOTALS"
                                               message:@"This is the combined sales amount from each hourly record."
                                              delegate:nil
                                     cancelButtonTitle:@"Continue"
                                     otherButtonTitles:nil];
        [alert show];

        
    }else if (indexPath.row == DFCashOSMONTH911) {
    
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Big Doubles are delicious"
                                                        message:@"O/S running total for the month not yet implemented"
                                                       delegate:nil
                                              cancelButtonTitle:@"Yes they are"
                                              otherButtonTitles:nil];
        [alert show];
        

    
    
    } else if (indexPath.row == DFNetSalesWEEK113)  {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Weekly Sums"
                                                        message:@"Weekly running totals not yet implemented"
                                                       delegate:nil
                                              cancelButtonTitle:@"Continue"
                                              otherButtonTitles:nil];
        [alert show];

    
    } else if (indexPath.row == DFNetSalesMONTH114)  {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Monthly Sums"
                                                        message:@"Monthly running totals not yet implemented"
                                                       delegate:nil
                                              cancelButtonTitle:@"Continue"
                                              otherButtonTitles:nil];
        [alert show];
        

    
    
    
    
    } else if (indexPath.row == DFLaborAmtWEEK1516)  {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Weekly Sums"
                                                        message:@"Weekly labor amount not yet implemented"
                                                       delegate:nil
                                              cancelButtonTitle:@"Continue"
                                              otherButtonTitles:nil];
        [alert show];
        
    
    
    } else if (indexPath.row == DFLaborAmtMONTH1517)  {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Monthly Sums"
                                                        message:@"Monthly labor amount not yet implemented"
                                                       delegate:nil
                                              cancelButtonTitle:@"Continue"
                                              otherButtonTitles:nil];
        [alert show];
        
        
        
    } else if (indexPath.row == DFMgrvdMONTH2123)  {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Monthly Sums"
                                                        message:@"Monthly voids not yet implemented"
                                                       delegate:nil
                                              cancelButtonTitle:@"Continue"
                                              otherButtonTitles:nil];
        [alert show];
        
        
        
    } else if (indexPath.row == DFFoodEmpMONTH2830)  {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Monthly Sums"
                                                        message:@"Monthly running totals not yet implemented"
                                                       delegate:nil
                                              cancelButtonTitle:@"Continue"
                                              otherButtonTitles:nil];
        [alert show];
        
        
        
        
        
        
    } else if (indexPath.row == DFSalesLastWeekSameDay)  {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Weekly Sums"
                                                        message:@"Weekly amounts not yet implemented"
                                                       delegate:nil
                                              cancelButtonTitle:@"Continue"
                                              otherButtonTitles:nil];
        [alert show];
        
        
        
    } else if (indexPath.row == DFNetSalesLastWEEKThruTODAY)  {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Weekly Sums"
                                                        message:@"Sales last week thru today not yet implemented"
                                                       delegate:nil
                                              cancelButtonTitle:@"Continue"
                                              otherButtonTitles:nil];
        [alert show];
        
        
        
    }




    
    
    else {
        [self showFormula];
}
}

@end

//
//  DailyViewController.m
//  Cookout
//
//  Created by Alex Hicks on 3/31/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

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


- (void) willDismissViewController:(UIViewController*) controller{
    //
}

- (void) didDismissViewController{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"masterToFormula"]) {
        DailyFormulaViewController *controller =  (DailyFormulaViewController*)segue.destinationViewController;

        [controller configWithData:_data fieldId:_selectedRow];
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
    }else{
        [self showFormula];
    }
}


@end

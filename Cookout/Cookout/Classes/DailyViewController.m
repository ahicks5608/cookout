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
        Daily *item = [[Daily alloc] init];
        [controller configWithData:item fieldId:_selectedRow];
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
    cell.value.text = @"$0.00";
    
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

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

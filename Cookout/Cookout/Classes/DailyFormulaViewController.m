//
//  DailyFormulaViewController.m
//  Cookout
//
//  Created by Alex Hicks on 4/2/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import "DailyFormulaViewController.h"
#import "Formula2.h"
#import "Formula3.h"
#import "Formula5.h"
#import "Formula6.h"
#import "Formula10.h"

#import "Common.h"
#import "CookOutDaily.h"


@interface DailyFormulaViewController (){
    Daily *_data;
    NSUInteger _formulaId;
    
}



@end

@implementation DailyFormulaViewController


- (void) configWithData:(Daily*) data fieldId:(NSUInteger) value{
    _data = data;
    _formulaId = value;

}


- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSDictionary *result;
    if (_formulaId == DFGrossSales) {
        Formula3 *f3 = [[Formula3 alloc] init];
        f3.delegate = _data;
        result = [f3 getvalues];
    } else if (_formulaId == DFCashSHForDep){
        Formula6 *f6 = [[Formula6 alloc] init];
        f6.delegate = _data;
        result = [f6 getvalues];
    } else if (_formulaId == DFSalesTax){
        Formula2 *f2 = [[Formula2 alloc] init];
        f2.delegate = _data;
        result = [f2 getvalues];
    } else if (_formulaId == DFCreditCards) {
        Formula5 *f5 = [[Formula5 alloc] init];
        f5.delegate = _data;
        result = [f5 getvalues];
    }
    
    NSArray *labels =  [result valueForKey:@"labels"];
    NSArray *values =  [result valueForKey:@"values"];
    
    _fldInput1.text = [values objectAtIndex:0];
    _fldInput2.text = [values objectAtIndex:1];
    _fldTotalInput.text = [values objectAtIndex:2];
    
    _lblInput1.text = [labels objectAtIndex:1];
    _lblInput2.text = [labels objectAtIndex:2];
    _lblTotalInput.text = @"Total";
    self.title = [labels objectAtIndex:0];
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return NO;
}


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
    _fldInput1.delegate = self;
    _fldInput2.delegate = self;
    _fldTotalInput.delegate =self;
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

@end

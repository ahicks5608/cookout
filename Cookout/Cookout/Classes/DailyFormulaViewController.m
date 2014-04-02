//
//  DailyFormulaViewController.m
//  Cookout
//
//  Created by Alex Hicks on 4/2/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import "DailyFormulaViewController.h"

@interface DailyFormulaViewController ()

@end

@implementation DailyFormulaViewController


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

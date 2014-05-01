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
#import "Formula6.h"
#import "FormulaTotalDep.h"
#import "Formula9.h"
#import "Formula10.h"
#import "Formula12.h"
#import "Formula18.h"
#import "Formula19.h"
#import "Formula20.h"
#import "Formula22.h"
#import "Formula24.h"
#import "Formula27.h"
#import "Formula29.h"
#import "Formula31.h"
#import "Formula33.h"
#import "Formula35.h"

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
        [_data setValueAtIndex:DFSalesTax value:[f2 getResult]];
    }else if (_formulaId == DFCashOSDAY) {
        Formula9 *f9 = [[Formula9 alloc] init];
        f9.delegate = _data;
        result = [f9 getvalues];
    }else if (_formulaId == DFTotalServiceTime) {
        Formula27 *f27 = [[Formula27 alloc] init];
        f27.delegate = _data;
        result = [f27 getvalues];
    }else if (_formulaId == DFCashOSPercDAY91) {
        Formula10 *f10 = [[Formula10 alloc] init];
        f10.delegate = _data;
        result = [f10 getvalues];
    }else if (_formulaId == DFCashOSPercMONTH1114) {
        Formula12 *f12 = [[Formula12 alloc] init];
        f12.delegate = _data;
        result = [f12 getvalues];
    }else if (_formulaId == DFTotalDep) {
        FormulaTotalDep *fTotalDep = [[FormulaTotalDep alloc] init];
        fTotalDep.delegate = _data;
        result = [fTotalDep  getvalues];
    }else if (_formulaId == DFLaborPercDAY151) {
        Formula18 *f18 = [[Formula18 alloc] init];
        f18.delegate = _data;
        result = [f18  getvalues];
    }else if (_formulaId == DFLaborPercWEEK1613) {
        Formula19 *f19 = [[Formula19 alloc] init];
        f19.delegate = _data;
        result = [f19  getvalues];
    }else if (_formulaId == DFLaborPercMONTH1714) {
        Formula20 *f20 = [[Formula20 alloc] init];
        f20.delegate = _data;
        result = [f20  getvalues];
    }else if (_formulaId == DFMgrvdPercDAY211) {
        Formula22 *f22 = [[Formula22 alloc] init];
        f22.delegate = _data;
        result = [f22  getvalues];
    }else if (_formulaId == DFMgrvdPercMONTH2314) {
        Formula24 *f24 = [[Formula24 alloc] init];
        f24.delegate = _data;
        result = [f24  getvalues];
    }else if (_formulaId == DFFoodEmpPercDAY281) {
        Formula29 *f29 = [[Formula29 alloc] init];
        f29.delegate = _data;
        result = [f29  getvalues];
    }else if (_formulaId == DFFoodEmpPercMONTH3014) {
        Formula31 *f31 = [[Formula31 alloc] init];
        f31.delegate = _data;
        result = [f31  getvalues];
    }else if (_formulaId == DFUpDownToday132) {
        Formula33 *f33 = [[Formula33 alloc] init];
        f33.delegate = _data;
        result = [f33  getvalues];
    }else if (_formulaId == DFUpDownThisWEEK1334) {
        Formula35 *f35 = [[Formula35 alloc] init];
        f35.delegate = _data;
        result = [f35  getvalues];
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

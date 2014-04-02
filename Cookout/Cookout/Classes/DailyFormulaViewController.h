//
//  DailyFormulaViewController.h
//  Cookout
//
//  Created by Alex Hicks on 4/2/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DailyFormulaViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UILabel *lblInput1;
@property (strong, nonatomic) IBOutlet UILabel *lblInput2;
@property (strong, nonatomic) IBOutlet UILabel *lblTotalInput;
@property (strong, nonatomic) IBOutlet UITextField *fldInput1;
@property (strong, nonatomic) IBOutlet UITextField *fldInput2;
@property (strong, nonatomic) IBOutlet UITextField *fldTotalInput;
@end

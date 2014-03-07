//
//  HourlyEditViewController.h
//  Cookout
//
//  Created by Alex Hicks on 2/27/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HourlyItemViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UILabel *lblSalesAmt;
@property (strong, nonatomic) IBOutlet UILabel *lblServiceTime;
@property (strong, nonatomic) IBOutlet UILabel *lblHoursWorked;
@property (strong, nonatomic) IBOutlet UILabel *lblLaborPercent;
@property (strong, nonatomic) IBOutlet UITextField *fldSalesAmt;
@property (strong, nonatomic) IBOutlet UITextField *fldServiceTime;
@property (strong, nonatomic) IBOutlet UITextField *fldHoursWorked;
@property (strong, nonatomic) IBOutlet UITextField *fldLaborPercent;



-(void) configWithData:(NSDictionary*) values;


@end

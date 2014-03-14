//
//  HourlyViewController.h
//  Cookout
//
//  Created by Alex Hicks on 3/7/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/NSManagedObject.h>
#import "BaseModalViewController.h"
#import "ModalDelegate.h"

@interface HourlyEditViewController : BaseModalViewController <UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate, ModalDelegate>

@property (strong, nonatomic) IBOutlet UILabel *lblSalesAmt;
@property (strong, nonatomic) IBOutlet UILabel *lblServiceTime;
@property (strong, nonatomic) IBOutlet UILabel *lblHoursWorked;

@property (strong, nonatomic) IBOutlet UITextField *fldSalesAmt;
@property (strong, nonatomic) IBOutlet UITextField *fldServiceTime;
@property (strong, nonatomic) IBOutlet UITextField *fldHoursWorked;
@property (strong, nonatomic) IBOutlet UIPickerView *fldTimeOfDay;








- (void) configWithData:(NSManagedObject*) data;

@end

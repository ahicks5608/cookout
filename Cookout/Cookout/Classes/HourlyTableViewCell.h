//
//  HourlyTableViewCell.h
//  Cookout
//
//  Created by Alex Hicks on 2/25/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HourlyTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *lblSalesAmt;
@property (strong, nonatomic) IBOutlet UILabel *lblServiceTime;
@property (strong, nonatomic) IBOutlet UILabel *lblHoursWorked;
@property (strong, nonatomic) IBOutlet UILabel *lblLaborPercent;
@property (strong, nonatomic) IBOutlet UILabel *fldSalesAmt;
@property (strong, nonatomic) IBOutlet UILabel *fldServiceTime;
@property (strong, nonatomic) IBOutlet UILabel *fldHoursWorked;
@property (strong, nonatomic) IBOutlet UILabel *fldLaborPercent;
@property (strong, nonatomic) IBOutlet UILabel *fldTimeOfDay;
@property (strong, nonatomic) IBOutlet UIImageView *arrowImage;




-(void) configWithData:(NSDictionary*) values;



@end

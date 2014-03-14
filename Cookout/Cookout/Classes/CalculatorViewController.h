//
//  iOSViewController.h
//  SimpleCalculator
//
//  Created by Arthur Knopper on 129//12.
//  Copyright (c) 2012 iOSCreator. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseModalViewController.h"

@interface CalculatorViewController : BaseModalViewController

@property (nonatomic) BOOL typingNumber;
@property (nonatomic) float firstNumber;
@property (nonatomic) float secondNumber;
@property (nonatomic, copy) NSString *operation;


@property (nonatomic, strong) IBOutlet UILabel *calcResult;

- (id) initWithData:(NSDictionary*) values;
- (void) configWithData:(NSDictionary*) values;

- (IBAction)numberPressed:(UIButton *)sender;

- (IBAction)calculationPressed:(id)sender;
- (IBAction)equalsPressed;
- (IBAction)clearPressed;
- (IBAction)percent:(id)sender;
- (IBAction)posOrNeg:(id)sender;

- (IBAction)memoryPressed:(id)sender;

- (IBAction)decimalPoint:(id)sender;

@end

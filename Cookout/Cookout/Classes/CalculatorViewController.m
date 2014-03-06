//
//  iOSViewController.m
//  SimpleCalculator
//
//  Created by Arthur Knopper on 129//12.
//  Copyright (c) 2012 iOSCreator. All rights reserved.
//

#import "CalculatorViewController.h"
#import "Common.h"



@interface CalculatorViewController () {
    NSUInteger _operatorTag;
    float _memValue;

}
@end

@implementation CalculatorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)posOrNeg:(id)sender {
    if (self.calculatorDisplay.text != nil) {
        if (self.calculatorDisplay.text.length > 0) {
            float  result = self.calculatorDisplay.text.floatValue;
            result = result * -1.0;
            self.calculatorDisplay.text = [NSString stringWithFormat:@"%0.2f", result];
        }
    }
}

- (IBAction)numberPressed:(UIButton *)sender {
    NSString *number = sender.currentTitle;
    if (sender.tag == 10){
        if (self.typingNumber == NO) {
            self.calculatorDisplay.text = @".";
             self.typingNumber = YES;
        } else if([self.calculatorDisplay.text rangeOfString:@"."].location == NSNotFound) {
            NSString *result = [NSString stringWithFormat:@"%@.",self.calculatorDisplay.text];
            self.calculatorDisplay.text = result;
            self.typingNumber = YES;
        }
        // }
    } else if (self.typingNumber) {
        self.calculatorDisplay.text = [self.calculatorDisplay.text
                                       stringByAppendingString:number];
    } else {
        self.calculatorDisplay.text = number;
        self.typingNumber = YES;
    }
    
}




- (IBAction)percent:(id)sender
{
    
    float  result = self.calculatorDisplay.text.floatValue;
    result = result / 100.00;
    self.calculatorDisplay.text = [NSString stringWithFormat:@"%0.2f", result];
    
    
}

- (IBAction)decimalPoint:(id)sender{
    if ([self.calculatorDisplay.text rangeOfString:@"."].location == NSNotFound) {
     NSString *result = [NSString stringWithFormat:@"%@.",self.calculatorDisplay.text];
    self.calculatorDisplay.text = result;
    }
}

- (IBAction)calculationPressed:(id)sender {
    UIButton *btn = (UIButton*) sender;
    _operatorTag = btn.tag;
    self.typingNumber = NO;
    self.firstNumber = [self.calculatorDisplay.text floatValue];
    self.operation = [sender currentTitle];
    
}

- (IBAction)equalsPressed {
    self.typingNumber = NO;
    self.secondNumber = [self.calculatorDisplay.text floatValue];
    
    float result = 0.0f;
    switch (_operatorTag) {
        case CBPlus:
            result = self.firstNumber + self.secondNumber;
            break;
        case CBMinus:
            result = self.firstNumber - self.secondNumber;
            break;
        case CBMultiply:
            result = self.firstNumber * self.secondNumber;
            break;
        case CBDivide:
            if (_secondNumber == 0) {
                result = 0;
            }else {
                result = self.firstNumber / self.secondNumber;
            }
            break;
            
        default:
            break;
    }

    
    self.calculatorDisplay.text = [NSString stringWithFormat:@"%0.2f", result];
    self.secondNumber = 0;
    
}


- (IBAction)memoryPressed:(id)sender {
    float currentValue = self.calculatorDisplay.text.floatValue;
    switch (_operatorTag) {
            
        case CBMR:
            self.calculatorDisplay.text = [NSString stringWithFormat:@"%f", _memValue];
            break;
        case CBMC:
            _memValue = 0;
            self.calculatorDisplay.text = [NSString stringWithFormat:@"%f", _memValue];
            break;
        case CBMminus:
            _memValue -= currentValue;
            break;
        case CBMplus:
            _memValue += currentValue;
            break;
            
        default:
            break;
    }
}







- (IBAction)clearPressed{
    self.calculatorDisplay.text = @"0";
    self.typingNumber = NO;
    self.secondNumber = 0;
}





@end

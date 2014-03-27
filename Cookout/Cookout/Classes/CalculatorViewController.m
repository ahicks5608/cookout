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
    NSString *_originalValue;

}
@end

@implementation CalculatorViewController

- (id) initWithData:(NSDictionary*) values{
    if (self = [super init]) {
        _calcResult.text = [values valueForKey:cfnValue];
    }
    return self;
}

- (void) configWithData:(NSDictionary*) values{

   _originalValue = [values valueForKey:cfnValue];

}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _calcResult.text = _originalValue;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)posOrNeg:(id)sender {
    if (_calcResult.text != nil) {
        if (_calcResult.text.length > 0) {
            float  result = _calcResult.text.floatValue;
            result = result * -1.0;
            _calcResult.text = [NSString stringWithFormat:@"%0.2f", result];
        }
    }
}

- (IBAction)numberPressed:(UIButton *)sender {
    NSString *number = sender.currentTitle;
    if (sender.tag == 10){
        if (self.typingNumber == NO) {
            _calcResult.text = @".";
             self.typingNumber = YES;
        } else if([_calcResult.text rangeOfString:@"."].location == NSNotFound) {
            NSString *result = [NSString stringWithFormat:@"%@.",_calcResult.text];
            _calcResult.text = result;
            self.typingNumber = YES;
        }
        // }
    } else if (self.typingNumber) {
        _calcResult.text = [_calcResult.text
                                       stringByAppendingString:number];
    } else {
        _calcResult.text = number;
        self.typingNumber = YES;
    }
    
}

- (IBAction)percent:(id)sender
{
    
    float  result = _calcResult.text.floatValue;
    result = result / 100.00;
    _calcResult.text = [NSString stringWithFormat:@"%0.2f", result];
    
    
}

- (IBAction)decimalPoint:(id)sender{
    if ([_calcResult.text rangeOfString:@"."].location == NSNotFound) {
     NSString *result = [NSString stringWithFormat:@"%@.",_calcResult.text];
    _calcResult.text = result;
    }
}

- (IBAction)calculationPressed:(id)sender {
    UIButton *btn = (UIButton*) sender;
    _operatorTag = btn.tag;
    self.typingNumber = NO;
    self.firstNumber = [_calcResult.text floatValue];
    self.operation = [sender currentTitle];
    
}

- (IBAction)equalsPressed {
    self.typingNumber = NO;
    self.secondNumber = [_calcResult.text floatValue];
    
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

    
    _calcResult.text = [NSString stringWithFormat:@"%0.2f", result];
    self.secondNumber = 0;
    
}


- (IBAction)memoryPressed:(id)sender {
    float currentValue = _calcResult.text.floatValue;
    switch (_operatorTag) {
            
        case CBMR:
            _calcResult.text = [NSString stringWithFormat:@"%f", _memValue];
            break;
        case CBMC:
            _memValue = 0;
            _calcResult.text = [NSString stringWithFormat:@"%f", _memValue];
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
    _calcResult.text = @"0";
    self.typingNumber = NO;
    self.secondNumber = 0;
}





@end

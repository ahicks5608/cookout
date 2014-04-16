//
//  Formula2.m
//  Cookout
//
//  Created by Alex Hicks on 4/9/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import "Formula2.h"
#import "Common.h"


@interface Formula2() {
    NSMutableArray *_labels;
    NSMutableArray *_values;
    NSMutableDictionary *_result;
    
}

@end


@implementation Formula2

-(id) init {
    if (self = [super init]) {
        _labels = [NSMutableArray arrayWithCapacity:4];
        _values = [NSMutableArray arrayWithCapacity:4];
        _result = [NSMutableDictionary dictionaryWithCapacity:2];
        [_labels addObject:[Common getTitleForDaily:DFNetSalesDAY]];
        [_labels addObject:@"Sales Tax Rate"];
        [_labels addObject:[Common getTitleForDaily:DFSalesTax]];
        
    }
    return self;
}



-(NSUInteger) getFormulaId{
    return DFGrossSales;
}


-(NSDictionary*) getvalues{
    [_result removeAllObjects];
    NSNumber *value1 = [_delegate getNetSalesDAY];
    NSNumber *value2 = @7.56f;
#warning SALES TAX RATE NEEDS WORK 
    float val = [value1 floatValue] + [value2 floatValue];
    NSNumber *value3 = [NSNumber numberWithFloat:val];
    
    
    NSString *formattedValue = [Common formatNumberAsMoney:value1];
    [_values addObject:formattedValue];
    formattedValue = [Common formatNumberAsMoney:value2];
    [_values addObject:formattedValue];
    formattedValue = [Common formatNumberAsMoney:value3];
    [_values addObject:formattedValue];
    
    [_result setValue:_labels forKey:@"labels"];
    [_result setValue:_values forKey:@"values"];
    
    return _result;
    
    
}

@end



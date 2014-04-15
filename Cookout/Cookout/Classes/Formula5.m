//
//  Formula5.m
//  Cookout
//
//  Created by Alex Hicks on 4/15/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import "Formula5.h"
#import "Common.h"


@interface Formula5() {
    NSMutableArray *_labels;
    NSMutableArray *_values;
    NSMutableDictionary *_result;
    
}

@end


@implementation Formula5

-(id) init {
    if (self = [super init]) {
        _labels = [NSMutableArray arrayWithCapacity:4];
        _values = [NSMutableArray arrayWithCapacity:4];
        _result = [NSMutableDictionary dictionaryWithCapacity:2];
        [_labels addObject:[Common getTitleForDaily:DFCreditCards]];
        [_labels addObject:[Common getTitleForDaily:DFGrossSales]];
        [_labels addObject:[Common getTitleForDaily:DFCashSHForDep]];
        
    }
    return self;
}



-(NSUInteger) getFormulaId{
    return DFGrossSales;
}


-(NSDictionary*) getvalues{
    [_result removeAllObjects];
    NSNumber *value1 = [_delegate getGrossSales];
    NSNumber *value2 = [_delegate getCashSHForDep];
    float val = [value1 floatValue] - [value2 floatValue];
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

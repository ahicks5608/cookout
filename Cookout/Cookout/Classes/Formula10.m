//
//  Formula10.m
//  Cookout
//
//  Created by Alex Hicks on 4/3/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import "Formula10.h"
#import "Common.h"
#import "Daily.h"




@interface Formula10() {
    NSMutableArray *_labels;
    NSMutableArray *_values;
    NSMutableDictionary *_result;
    
}

@end


@implementation Formula10

+(NSString*) getValue:(Daily *)value{
    return @"$0.00";
}


-(id) init {
    if (self = [super init]) {
        _labels = [NSMutableArray arrayWithCapacity:4];
        _values = [NSMutableArray arrayWithCapacity:4];
        _result = [NSMutableDictionary dictionaryWithCapacity:2];
        [_labels addObject:[Common getTitleForDaily:DFNetSalesDAY]];
        [_labels addObject:[Common getTitleForDaily:DFCashOSDAY]];
        [_labels addObject:[Common getTitleForDaily:DFCashOSPercDAY91]];
        
    }
    return self;
}



-(NSUInteger) getFormulaId{
    return DFGrossSales;
}


-(NSDictionary*) getvalues{
    [_result removeAllObjects];
    NSNumber *value1 = [NSNumber numberWithFloat:[[_delegate getNetSalesDAY] floatValue]];
    NSNumber *value2 = [NSNumber numberWithFloat:[[_delegate getCashOSDAY] floatValue]];
    float val = ([value2 floatValue] / [value1 floatValue]) * 100;
    NSNumber *value3 = [NSNumber numberWithFloat:val];
    [_values addObject:value3];
    [_values addObject:value1];
    [_values addObject:value2];
    
    [_result setValue:_labels forKey:@"labels"];
    [_result setValue:_values forKey:@"values"];
    
    return _result;
    
    
}

@end

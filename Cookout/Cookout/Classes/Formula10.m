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
    NSNumber *_formulaResult;

}

@end


@implementation Formula10

+(NSString*) getValue:(Daily *)value{
    Formula10 *f10 = [[Formula10 alloc] init];
    f10.delegate = value;
    NSDictionary *value1 = [f10 getvalues];
    NSArray *value2 = (NSArray*) [value1 valueForKey:@"values"];
    return [value2 objectAtIndex:2];
    
}
+(NSNumber*) getFormulaResult:(Daily *)value{
    Formula10 *f10 = [[Formula10 alloc] init];
    f10.delegate = value;
    [f10 getvalues];
    
    return [f10 getResult];
    
    
}


-(id) init {
    if (self = [super init]) {
        _labels = [NSMutableArray arrayWithCapacity:4];
        _values = [NSMutableArray arrayWithCapacity:4];
        _result = [NSMutableDictionary dictionaryWithCapacity:2];
        [_labels addObject:[Common getTitleForDaily:DFCashOSPercDAY91]];
        [_labels addObject:[Common getTitleForDaily:DFNetSalesDAY]];
        [_labels addObject:[Common getTitleForDaily:DFCashOSDAY]];
        
    }
    return self;
}



-(NSUInteger) getFormulaId{
    return DFCashOSPercDAY91;
}

-(NSNumber*) getResult {
    return _formulaResult;
}


-(NSDictionary*) getvalues{
    [_result removeAllObjects];
    NSNumber *value1 = [NSNumber numberWithFloat:[[_delegate getNetSalesDAY] floatValue]];
    NSNumber *value2 = [NSNumber numberWithFloat:[[_delegate getCashOSDAY] floatValue]];
    float val = ([value2 floatValue] / [value1 floatValue]) * 100;
    _formulaResult = [NSNumber numberWithFloat:val];
    
    NSString *formattedValue = [Common formatNumberAsMoney:value1];
    [_values addObject:formattedValue];
    formattedValue = [Common formatNumberAsMoney:value2];
    [_values addObject:formattedValue];
    formattedValue = [Common formatNumberAsMoney:_formulaResult];
    [_values addObject:formattedValue];

    
    [_result setValue:_labels forKey:@"labels"];
    [_result setValue:_values forKey:@"values"];
    
    return _result;
    
    
}

@end

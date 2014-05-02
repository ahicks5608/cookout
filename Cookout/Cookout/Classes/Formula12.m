//
//  Formula12.m
//  Cookout
//
//  Created by Alex Hicks on 4/30/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//


#import "Formula12.h"
#import "Common.h"
#import "Daily.h"

@interface Formula12() {
    NSMutableArray *_labels;
    NSMutableArray *_values;
    NSMutableDictionary *_result;
    NSNumber *_formulaResult;

}

@end


@implementation Formula12

+(NSString*) getValue:(Daily *)value{
    Formula12 *f12 = [[Formula12 alloc] init];
    f12.delegate = value;
    NSDictionary *value1 = [f12 getvalues];
    NSArray *value2 = (NSArray*) [value1 valueForKey:@"values"];
    return [value2 objectAtIndex:2];
    
}
+(NSNumber*) getFormulaResult:(Daily *)value{
    Formula12 *f12 = [[Formula12 alloc] init];
    f12.delegate = value;
    [f12 getvalues];
    
    return [f12 getResult];
    
    
}


-(id) init {
    if (self = [super init]) {
        _labels = [NSMutableArray arrayWithCapacity:4];
        _values = [NSMutableArray arrayWithCapacity:4];
        _result = [NSMutableDictionary dictionaryWithCapacity:2];
        [_labels addObject:[Common getTitleForDaily:DFCashOSPercMONTH1114]];
        [_labels addObject:[Common getTitleForDaily:DFCashOSMONTH911]];
        [_labels addObject:[Common getTitleForDaily:DFNetSalesMONTH114]];
        
    }
    return self;
}



-(NSUInteger) getFormulaId{
    return DFCashOSPercMONTH1114;
}

-(NSNumber*) getResult {
    return _formulaResult;
}



-(NSDictionary*) getvalues{
    [_result removeAllObjects];
    NSNumber *value1 = [_delegate getCashOSMONTH911];
    NSNumber *value2 = [_delegate getNetSalesMONTH114];
    float val = ([value1 floatValue] / ([value2 floatValue]==0.0f?1:[value2 floatValue])) * 100;
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

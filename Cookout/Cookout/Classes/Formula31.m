//
//  Formula31.m
//  Cookout
//
//  Created by Alex Hicks on 5/1/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//
#import "Formula31.h"
#import "Common.h"
#import "Daily.h"

@interface Formula31() {
    NSMutableArray *_labels;
    NSMutableArray *_values;
    NSMutableDictionary *_result;
    NSNumber *_formulaResult;

}

@end


@implementation Formula31

+(NSString*) getValue:(Daily *)value{
    Formula31 *f31 = [[Formula31 alloc] init];
    f31.delegate = value;
    NSDictionary *value1 = [f31 getvalues];
    NSArray *value2 = (NSArray*) [value1 valueForKey:@"values"];
    return [value2 objectAtIndex:2];
    
}
+(NSNumber*) getFormulaResult:(Daily *)value{
    Formula31 *f31 = [[Formula31 alloc] init];
    f31.delegate = value;
    [f31 getvalues];
    
    return [f31 getResult];
    
    
}


-(id) init {
    if (self = [super init]) {
        _labels = [NSMutableArray arrayWithCapacity:4];
        _values = [NSMutableArray arrayWithCapacity:4];
        _result = [NSMutableDictionary dictionaryWithCapacity:2];
        [_labels addObject:[Common getTitleForDaily:DFFoodEmpPercMONTH3014]];
        [_labels addObject:[Common getTitleForDaily:DFNetSalesMONTH114]];
        [_labels addObject:[Common getTitleForDaily:DFFoodEmpMONTH2830]];
        
    }
    return self;
}



-(NSUInteger) getFormulaId{
    return DFFoodEmpPercMONTH3014;
}

-(NSNumber*) getResult {
    return _formulaResult;
}



-(NSDictionary*) getvalues{
    [_result removeAllObjects];
    NSNumber *value1 = [_delegate getFoodEmpMONTH2830];
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

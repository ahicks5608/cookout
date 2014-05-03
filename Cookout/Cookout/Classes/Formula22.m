//
//  Formula22.m
//  Cookout
//
//  Created by Alex Hicks on 4/30/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import "Formula22.h"
#import "Common.h"
#import "Daily.h"

@interface Formula22() {
    NSMutableArray *_labels;
    NSMutableArray *_values;
    NSMutableDictionary *_result;
    NSNumber *_formulaResult;

}

@end


@implementation Formula22

+(NSString*) getValue:(Daily *)value{
    Formula22 *f22 = [[Formula22 alloc] init];
    f22.delegate = value;
    NSDictionary *value1 = [f22 getvalues];
    NSArray *value2 = (NSArray*) [value1 valueForKey:@"values"];
    return [value2 objectAtIndex:2];
    
}
+(NSNumber*) getFormulaResult:(Daily *)value{
    Formula22 *f22 = [[Formula22 alloc] init];
    f22.delegate = value;
    [f22 getvalues];
    
    return [f22 getResult];
    
    
}


-(id) init {
    if (self = [super init]) {
        _labels = [NSMutableArray arrayWithCapacity:4];
        _values = [NSMutableArray arrayWithCapacity:4];
        _result = [NSMutableDictionary dictionaryWithCapacity:2];
        [_labels addObject:[Common getTitleForDaily:DFMgrvdPercDAY211]];
        [_labels addObject:[Common getTitleForDaily:DFNetSalesDAY]];
        [_labels addObject:[Common getTitleForDaily:DFMgvdTransvoid]];
        
    }
    return self;
}



-(NSUInteger) getFormulaId{
    return DFMgrvdPercDAY211;
}

-(NSNumber*) getResult {
    return _formulaResult;
}



-(NSDictionary*) getvalues{
    [_result removeAllObjects];
    NSNumber *value1 = [_delegate getNetSalesDAY];
    NSNumber *value2 = [_delegate getMgvdTransvoid];
    float val = ([value2 floatValue] / [value1 floatValue]) * 100;
    _formulaResult = [NSNumber numberWithFloat:val];
    
    
    NSString *formattedValue = [Common formatNumberAsMoney:value1];
    [_values addObject:formattedValue];
    formattedValue = [Common formatNumberAsMoney:value2];
    [_values addObject:formattedValue];
    formattedValue = [Common formatNumberAsPercent:_formulaResult];
    [_values addObject:formattedValue];
    
    [_result setValue:_labels forKey:@"labels"];
    [_result setValue:_values forKey:@"values"];
    
    return _result;
    
    
}

@end

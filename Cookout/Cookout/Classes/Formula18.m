//
//  Formula18.m
//  Cookout
//
//  Created by Alex Hicks on 4/30/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import "Formula18.h"
#import "Common.h"
#import "Daily.h"

@interface Formula18() {
    NSMutableArray *_labels;
    NSMutableArray *_values;
    NSMutableDictionary *_result;
    NSNumber *_formulaResult;

}

@end


@implementation Formula18

+(NSString*) getValue:(Daily *)value{
    Formula18 *f18 = [[Formula18 alloc] init];
    f18.delegate = value;
    NSDictionary *value1 = [f18 getvalues];
    NSArray *value2 = (NSArray*) [value1 valueForKey:@"values"];
    return [value2 objectAtIndex:2];
    
}
+(NSNumber*) getFormulaResult:(Daily *)value{
    Formula18 *f18 = [[Formula18 alloc] init];
    f18.delegate = value;
    [f18 getvalues];
    
    return [f18 getResult];
    
    
}


-(id) init {
    if (self = [super init]) {
        _labels = [NSMutableArray arrayWithCapacity:4];
        _values = [NSMutableArray arrayWithCapacity:4];
        _result = [NSMutableDictionary dictionaryWithCapacity:2];
        [_labels addObject:[Common getTitleForDaily:DFLaborPercDAY151]];
        [_labels addObject:[Common getTitleForDaily:DFNetSalesDAY]];
        [_labels addObject:[Common getTitleForDaily:DFLaborAmtDAYPaysh]];
        
    }
    return self;
}



-(NSUInteger) getFormulaId{
    return DFLaborPercDAY151;
}

-(NSNumber*) getResult {
    return _formulaResult;
}



-(NSDictionary*) getvalues{
    [_result removeAllObjects];
    NSNumber *value1 = [_delegate getNetSalesDAY];
    NSNumber *value2 = [_delegate getLaborAmtDAYPaysh];
    float val = ([value2 floatValue] / ([value1 floatValue]==0.0f?1:[value1 floatValue]) ) * 100;
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

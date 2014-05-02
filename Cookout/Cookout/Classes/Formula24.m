//
//  Formula24.m
//  Cookout
//
//  Created by Alex Hicks on 4/30/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import "Formula24.h"
#import "Common.h"
#import "Daily.h"

@interface Formula24() {
    NSMutableArray *_labels;
    NSMutableArray *_values;
    NSMutableDictionary *_result;
    NSNumber *_formulaResult;

}

@end


@implementation Formula24

+(NSString*) getValue:(Daily *)value{
    Formula24 *f24 = [[Formula24 alloc] init];
    f24.delegate = value;
    NSDictionary *value1 = [f24 getvalues];
    NSArray *value2 = (NSArray*) [value1 valueForKey:@"values"];
    return [value2 objectAtIndex:2];
    
}
+(NSNumber*) getFormulaResult:(Daily *)value{
    Formula24 *f24 = [[Formula24 alloc] init];
    f24.delegate = value;
    [f24 getvalues];
    
    return [f24 getResult];
    
    
}


-(id) init {
    if (self = [super init]) {
        _labels = [NSMutableArray arrayWithCapacity:4];
        _values = [NSMutableArray arrayWithCapacity:4];
        _result = [NSMutableDictionary dictionaryWithCapacity:2];
        [_labels addObject:[Common getTitleForDaily:DFMgrvdPercMONTH2314]];
        [_labels addObject:[Common getTitleForDaily:DFNetSalesMONTH114]];
        [_labels addObject:[Common getTitleForDaily:DFMgrvdMONTH2123]];
        
    }
    return self;
}



-(NSUInteger) getFormulaId{
    return DFMgrvdPercMONTH2314;
}

-(NSNumber*) getResult {
    return _formulaResult;
}



-(NSDictionary*) getvalues{
    [_result removeAllObjects];
    NSNumber *value1 = [_delegate getMgrvdMONTH2123];
    NSNumber *value2 = [_delegate getNetSalesMONTH114];
    float val = ([value1 floatValue] / [value2 floatValue]) * 100;
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

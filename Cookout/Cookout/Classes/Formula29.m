//
//  Formula29.m
//  Cookout
//
//  Created by Alex Hicks on 5/1/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import "Formula29.h"
#import "Common.h"
#import "Daily.h"

@interface Formula29() {
    NSMutableArray *_labels;
    NSMutableArray *_values;
    NSMutableDictionary *_result;
    NSNumber *_formulaResult;

}

@end


@implementation Formula29

+(NSString*) getValue:(Daily *)value{
    Formula29 *f29 = [[Formula29 alloc] init];
    f29.delegate = value;
    NSDictionary *value1 = [f29 getvalues];
    NSArray *value2 = (NSArray*) [value1 valueForKey:@"values"];
    return [value2 objectAtIndex:2];
    
}
+(NSNumber*) getFormulaResult:(Daily *)value{
    Formula29 *f29 = [[Formula29 alloc] init];
    f29.delegate = value;
    [f29 getvalues];
    
    return [f29 getResult];
    
    
}


-(id) init {
    if (self = [super init]) {
        _labels = [NSMutableArray arrayWithCapacity:4];
        _values = [NSMutableArray arrayWithCapacity:4];
        _result = [NSMutableDictionary dictionaryWithCapacity:2];
        [_labels addObject:[Common getTitleForDaily:DFFoodEmpPercDAY281]];
        [_labels addObject:[Common getTitleForDaily:DFFoodEmpForDay]];
        [_labels addObject:[Common getTitleForDaily:DFNetSalesDAY]];
        
    }
    return self;
}



-(NSUInteger) getFormulaId{
    return DFFoodEmpPercDAY281;
}

-(NSNumber*) getResult {
    return @0;
}



-(NSDictionary*) getvalues{
    [_result removeAllObjects];
    NSNumber *value1 = [_delegate getFoodEmpForDay];
    NSNumber *value2 = [_delegate getNetSalesDAY];
    float val = ([value1 floatValue] / [value2 floatValue]) * 100;
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

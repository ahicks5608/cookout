//
//  Formula35.m
//  Cookout
//
//  Created by Alex Hicks on 5/1/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import "Formula35.h"
#import "Common.h"
#import "Daily.h"

@interface Formula35() {
    NSMutableArray *_labels;
    NSMutableArray *_values;
    NSMutableDictionary *_result;
    NSNumber *_formulaResult;

}

@end


@implementation Formula35

+(NSString*) getValue:(Daily *)value{
    Formula35 *f35 = [[Formula35 alloc] init];
    f35.delegate = value;
    NSDictionary *value1 = [f35 getvalues];
    NSArray *value2 = (NSArray*) [value1 valueForKey:@"values"];
    return [value2 objectAtIndex:2];
    
}
+(NSNumber*) getFormulaResult:(Daily *)value{
    Formula35 *f35 = [[Formula35 alloc] init];
    f35.delegate = value;
    [f35 getvalues];
    
    return [f35 getResult];
    
    
}


-(id) init {
    if (self = [super init]) {
        _labels = [NSMutableArray arrayWithCapacity:4];
        _values = [NSMutableArray arrayWithCapacity:4];
        _result = [NSMutableDictionary dictionaryWithCapacity:2];
        [_labels addObject:[Common getTitleForDaily:DFUpDownThisWEEK1334]];
        [_labels addObject:[Common getTitleForDaily:DFNetSalesWEEK113]];
        [_labels addObject:[Common getTitleForDaily:DFNetSalesLastWEEKThruTODAY]];
        
    }
    return self;
}



-(NSUInteger) getFormulaId{
    return DFUpDownThisWEEK1334;
}

-(NSNumber*) getResult {
    return @0;
}



-(NSDictionary*) getvalues{
    [_result removeAllObjects];
    NSNumber *value1 = [_delegate getNetSalesWEEK113];
    NSNumber *value2 = [_delegate getNetSalesLastWEEKThruTODAY];
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

//
//  Formula19.m
//  Cookout
//
//  Created by Alex Hicks on 4/30/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//
#import "Formula19.h"
#import "Common.h"
#import "Daily.h"

@interface Formula19() {
    NSMutableArray *_labels;
    NSMutableArray *_values;
    NSMutableDictionary *_result;
    
}

@end


@implementation Formula19

+(NSString*) getValue:(Daily *)value{
    Formula19 *f19 = [[Formula19 alloc] init];
    f19.delegate = value;
    NSDictionary *value1 = [f19 getvalues];
    NSArray *value2 = (NSArray*) [value1 valueForKey:@"values"];
    return [value2 objectAtIndex:2];
    
}
+(NSNumber*) getFormulaResult:(Daily *)value{
    Formula19 *f19 = [[Formula19 alloc] init];
    f19.delegate = value;
    [f19 getvalues];
    
    return [f19 getResult];
    
    
}


-(id) init {
    if (self = [super init]) {
        _labels = [NSMutableArray arrayWithCapacity:4];
        _values = [NSMutableArray arrayWithCapacity:4];
        _result = [NSMutableDictionary dictionaryWithCapacity:2];
        [_labels addObject:[Common getTitleForDaily:DFLaborPercWEEK1613]];
        [_labels addObject:[Common getTitleForDaily:DFNetSalesWEEK113]];
        [_labels addObject:[Common getTitleForDaily:DFLaborAmtWEEK1516]];
        
    }
    return self;
}



-(NSUInteger) getFormulaId{
    return DFLaborPercWEEK1613;
}

-(NSNumber*) getResult {
    return @0;
}



-(NSDictionary*) getvalues{
    [_result removeAllObjects];
    NSNumber *value1 = [_delegate getLaborAmtWEEK1516];
    NSNumber *value2 = [_delegate getNetSalesWEEK113];
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

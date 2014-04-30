//
//  Formula20.m
//  Cookout
//
//  Created by Alex Hicks on 4/30/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import "Formula20.h"
#import "Common.h"
#import "Daily.h"

@interface Formula20() {
    NSMutableArray *_labels;
    NSMutableArray *_values;
    NSMutableDictionary *_result;
    
}

@end


@implementation Formula20

+(NSString*) getValue:(Daily *)value{
    Formula20 *f20 = [[Formula20 alloc] init];
    f20.delegate = value;
    NSDictionary *value1 = [f20 getvalues];
    NSArray *value2 = (NSArray*) [value1 valueForKey:@"values"];
    return [value2 objectAtIndex:2];
    
}
+(NSNumber*) getFormulaResult:(Daily *)value{
    Formula20 *f20 = [[Formula20 alloc] init];
    f20.delegate = value;
    [f20 getvalues];
    
    return [f20 getResult];
    
    
}


-(id) init {
    if (self = [super init]) {
        _labels = [NSMutableArray arrayWithCapacity:4];
        _values = [NSMutableArray arrayWithCapacity:4];
        _result = [NSMutableDictionary dictionaryWithCapacity:2];
        [_labels addObject:[Common getTitleForDaily:DFLaborPercMONTH1714]];
        [_labels addObject:[Common getTitleForDaily:DFNetSalesMONTH114]];
        [_labels addObject:[Common getTitleForDaily:DFLaborAmtMONTH1517]];
        
    }
    return self;
}



-(NSUInteger) getFormulaId{
    return DFLaborPercMONTH1714;
}

-(NSNumber*) getResult {
    return @0;
}



-(NSDictionary*) getvalues{
    [_result removeAllObjects];
    NSNumber *value1 = [_delegate getLaborAmtMONTH1517];
    NSNumber *value2 = [_delegate getNetSalesMONTH114];
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

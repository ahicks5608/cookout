//
//  FormulaTotalDep.m
//  Cookout
//
//  Created by Alex Hicks on 4/30/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import "FormulaTotalDep.h"
#import "Common.h"
#import "Daily.h"

@interface FormulaTotalDep() {
    NSMutableArray *_labels;
    NSMutableArray *_values;
    NSMutableDictionary *_result;
    NSNumber *_formulaResult;

}

@end


@implementation FormulaTotalDep

+(NSString*) getValue:(Daily *)value{
    FormulaTotalDep *fTotalDep = [[FormulaTotalDep alloc] init];
    fTotalDep.delegate = value;
    NSDictionary *value1 = [fTotalDep getvalues];
    NSArray *value2 = (NSArray*) [value1 valueForKey:@"values"];
    return [value2 objectAtIndex:2];
    
}
+(NSNumber*) getFormulaResult:(Daily *)value{
    FormulaTotalDep *fTotalDep = [[FormulaTotalDep alloc] init];
    fTotalDep.delegate = value;
    [fTotalDep getvalues];
    
    return [fTotalDep getResult];
    
    
}


-(id) init {
    if (self = [super init]) {
        _labels = [NSMutableArray arrayWithCapacity:4];
        _values = [NSMutableArray arrayWithCapacity:4];
        _result = [NSMutableDictionary dictionaryWithCapacity:2];
        [_labels addObject:[Common getTitleForDaily:DFTotalDep]];
        [_labels addObject:[Common getTitleForDaily:DFDeposit1]];
        [_labels addObject:[Common getTitleForDaily:DFDeposit2]];
        
    }
    return self;
}



-(NSUInteger) getFormulaId{
    return DFTotalDep;
}

-(NSNumber*) getResult {
    return _formulaResult;
}



-(NSDictionary*) getvalues{
    [_result removeAllObjects];
    NSNumber *value1 = [_delegate getDeposit1];
    NSNumber *value2 = [_delegate getDeposit2];
    float val = [value1 floatValue] + [value2 floatValue];
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

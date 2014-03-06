//
//  CommonModalSegue.m
//  Cookout
//
//  Created by Alex Hicks on 3/4/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import "CommonModalSegue.h"


@implementation CommonModalSegue

-(void) perform {
    
   UINavigationController *modalViewNavController = [[UINavigationController alloc] initWithRootViewController:self.destinationViewController];
    modalViewNavController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    modalViewNavController.modalPresentationStyle = UIModalPresentationCurrentContext;
    [self.sourceViewController presentViewController:modalViewNavController animated:YES completion:nil];
    
}

@end



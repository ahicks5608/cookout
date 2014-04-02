//
//  CommonPushSegue.m
//  Cookout
//
//  Created by Alex Hicks on 4/2/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import "CommonPushSegue.h"

@implementation CommonPushSegue

-(void) perform {
    
UIViewController *src = (UIViewController *) self.sourceViewController;
    UIViewController *dst = (UIViewController *) self.destinationViewController;
    
  [UIView transitionWithView:src.navigationController.view duration:1
     options:UIViewAnimationOptionTransitionNone
         animations:^{
            [src.navigationController pushViewController:dst animated:YES];
             }
         completion:NULL];
    
}
@end

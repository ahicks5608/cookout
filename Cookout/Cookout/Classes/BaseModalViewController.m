//
//  BaseModalViewController.m
//  Cookout
//
//  Created by Alex Hicks on 3/14/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import "BaseModalViewController.h"

@interface BaseModalViewController ()

@end

@implementation BaseModalViewController


- (void) onDonePressed
{
    [_delegate willDismissViewController:self];
    [_delegate didDismissViewController];
}

- (void) onCancelPressed
{
    [_delegate didDismissViewController];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *doneButton =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                               target:self action: @selector(onDonePressed)];
    self.navigationItem.rightBarButtonItem = doneButton;
    
    UIBarButtonItem *cancelButton =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                 target:self action: @selector(onCancelPressed)];
    self.navigationItem.leftBarButtonItem = cancelButton;
    
}


@end

//
//  FirstViewController.h
//  Cookout
//
//  Created by David Hicks on 2/12/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModalDelegate.h"

@interface FirstViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, ModalDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;


@end

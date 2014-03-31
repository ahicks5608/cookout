//
//  DailyViewController.h
//  Cookout
//
//  Created by Alex Hicks on 3/31/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModalDelegate.h"

@interface DailyViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, ModalDelegate>

@property (strong, nonatomic) IBOutlet UITableView* tableView;

@end

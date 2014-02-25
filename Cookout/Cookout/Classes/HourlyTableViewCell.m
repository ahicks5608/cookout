//
//  HourlyTableViewCell.m
//  Cookout
//
//  Created by Alex Hicks on 2/25/14.
//  Copyright (c) 2014 Simple iApps. All rights reserved.
//

#import "HourlyTableViewCell.h"

@implementation HourlyTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

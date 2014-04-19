//
//  ResultsTableCell.m
//  MapSample
//
//  Created by Jaime Hernandez on 4/18/14.
//  Copyright (c) 2014 Jaime Hernandez. All rights reserved.
//

#import "ResultsTableCell.h"

@implementation ResultsTableCell

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

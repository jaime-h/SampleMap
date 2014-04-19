//
//  ResultsTableViewController.h
//  MapSample
//
//  Created by Jaime Hernandez on 4/18/14.
//  Copyright (c) 2014 Jaime Hernandez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#import "ResultsTableCell.h"
#import "RouteViewController.h"

@interface ResultsTableViewController : UITableViewController

@property (strong, atomic) NSArray *mapItems;

@end


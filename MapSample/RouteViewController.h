//
//  RouteViewController.h
//  MapSample
//
//  Created by Jaime Hernandez on 4/18/14.
//  Copyright (c) 2014 Jaime Hernandez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface RouteViewController : UIViewController <MKMapViewDelegate>

@property (weak, nonatomic)IBOutlet MKMapView *routeMap;
@property (strong, nonatomic) MKMapItem *destination;

@end

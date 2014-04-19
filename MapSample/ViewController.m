//
//  ViewController.m
//  MapSample
//
//  Created by Jaime Hernandez on 4/18/14.
//  Copyright (c) 2014 Jaime Hernandez. All rights reserved.
//

#import "ViewController.h"
#import "ResultsTableCell.h"
#import "ResultsTableViewController.h"
#import "RouteViewController.h"

#import <MapKit/MapKit.h>


@interface ViewController () <MKMapViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.mapView.showsUserLocation = YES;
    self.mapView.delegate          = self;
}

- (IBAction)zoomIn:(id)sender
{
    MKUserLocation *userLocation = self.mapView.userLocation;
    MKCoordinateRegion region    = MKCoordinateRegionMakeWithDistance(userLocation.location.coordinate, 20000, 20000); // numeric is in meters
    [self.mapView setRegion:region animated:NO];
}

- (IBAction)changeMapType:(id)sender
{
    if (self.mapView.mapType == MKMapTypeStandard)
    {
        self.mapView.mapType = MKMapTypeSatellite;
    }
    else
    {
        self.mapView.mapType = MKMapTypeHybrid;
    }
}

- (IBAction)textFieldReturn:(id)sender
{
    [sender resignFirstResponder];
    [self.mapView removeAnnotations:[self.mapView annotations]];
    [self performSearch];
}

- (void)performSearch
{
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
    request.naturalLanguageQuery = self.searchText.text;
    request.region = self.mapView.region;

    self.matchingItems = [[NSMutableArray alloc] init];

    MKLocalSearch *search = [[MKLocalSearch alloc]initWithRequest:request];
    [search startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
        if (response.mapItems.count == 0)
            NSLog(@"No Matches");
        else
            for (MKMapItem *item in response.mapItems)
            {
                [self.matchingItems addObject:item];
                MKPointAnnotation *annotation = [[MKPointAnnotation alloc]init];
                annotation.coordinate = item.placemark.coordinate;
                annotation.title = item.name;
                [self.mapView addAnnotation:annotation];
            }
    }];
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    self.mapView.centerCoordinate = userLocation.location.coordinate;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ResultsTableViewController *destination = [segue destinationViewController];
    destination.mapItems = self.matchingItems;
}



@end

//
//  CityDetailViewController.m
//  AssessmentWeek2
//
//  Created by Robert Figueras on 5/22/14.
//  Copyright (c) 2014 Robert Figueras. All rights reserved.
//

#import "CityDetailViewController.h"

@interface CityDetailViewController ()
@property (strong, nonatomic) IBOutlet UILabel *cityNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *stateNameLabel;

@end

@implementation CityDetailViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.cityNameLabel.text = self.passedInCity.cityName;
    self.stateNameLabel.text = self.passedInCity.stateName;
}



@end

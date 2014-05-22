//
//  ViewController.m
//  AssessmentWeek2
//
//  Created by Robert Figueras on 5/22/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "City.h"
#import "CityDetailViewController.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>

@property NSMutableArray *arrayOfCityObjects;
@property (strong, nonatomic) IBOutlet UITableView *cityTableView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *editButton;
@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    City* city1 = [[City alloc]init];
    city1.cityName = @"Springfield";
    city1.stateName = @"Illinois";
    City* city2 = [[City alloc]init];
    city2.cityName = @"Geneva";
    city2.stateName = @"Illinois";
    City* city3 = [[City alloc]init];
    city3.cityName = @"Akron";
    city3.stateName = @"Ohio";
    City* city4 = [[City alloc]init];
    city4.cityName = @"San Francisco";
    city4.stateName = @"California";
    City* city5 = [[City alloc]init];
    city5.cityName = @"Orlando";
    city5.stateName = @"Florida";

    self.arrayOfCityObjects = [[NSMutableArray alloc] initWithObjects:city1,city2, city3, city4, city5,nil];
}

#pragma mark - UITableViewDelegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrayOfCityObjects.count;
}


- (UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CityCellID"];
    City *myCity = [self.arrayOfCityObjects objectAtIndex:indexPath.row];
    cell.textLabel.text = myCity.cityName;
    return cell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(self.editing)
    {
        [self.arrayOfCityObjects removeObjectAtIndex:indexPath.row];
        [tableView reloadData];
    }
}

#pragma mark - Segue methods

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *myPath = [self.cityTableView indexPathForSelectedRow];
    City *selectedCity = [self.arrayOfCityObjects objectAtIndex:myPath.row];
    CityDetailViewController *nextVC = segue.destinationViewController;
    nextVC.passedInCity = selectedCity;
}

- (IBAction) unwindSegue:(UIStoryboardSegue *)sender
{
    [self.cityTableView reloadData];
}


#pragma mark - Button Action methods

- (IBAction)clickedEditButton:(id)sender
{
    self.editing = ! self.editing;
    if (self.editing) {
        [self.cityTableView setEditing:YES animated:YES];
        self.editButton.title = @"Done";
    }else{
        [self.cityTableView setEditing:NO animated:YES];
        self.editButton.title = @"Edit";
    }
}


@end

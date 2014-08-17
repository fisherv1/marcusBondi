//
//  ExerciseTableViewController.m
//  Fitness
//
//  Created by Matthew Lu on 16/08/2014.
//  Copyright (c) 2014 Matthew Lu. All rights reserved.
//

#import "ExerciseTableViewController.h"
#import "ExerciseFactory.h"
#import "ToolMethod.h"
#import "ExerciseTableViewCell.h"
#import "Exercise.h"
#import "CountDownMarco.h"
#import "ExerciseDetailViewController.h"
@interface ExerciseTableViewController ()
{
    NSArray *exerciseList;
}
@end

@implementation ExerciseTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    exerciseList  =[ExerciseFactory getExercises];
    
   // [ToolMethod configNavigationTitle:@"CHOOSE WORKOUT" titleColor:[UIColor blackColor]];
    
    
    UILabel* tlabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0, 200, 40)];
    [tlabel setTextAlignment:NSTextAlignmentCenter];
    tlabel.font = [UIFont fontWithName:FUTURA_FONT size:16.0];
    tlabel.textColor = [UIColor blackColor];
    tlabel.backgroundColor = [UIColor clearColor];
    tlabel.adjustsFontSizeToFitWidth = YES;
    tlabel.text =  EXERCISE_TABLE_NAVIGATION_TITLE;
    
    [tlabel sizeToFit];
    self.navigationItem.titleView = tlabel;

    self.view.backgroundColor = [[UIColor alloc]initWithRed:238.0/255.0 green:238.0/255.0 blue:238.0/255.0 alpha:1.0];
    
    self.navigationItem.leftBarButtonItem = [self navigationBackButton];

}

- (UIBarButtonItem *)navigationBackButton {
    UIImage *checkInImage = [UIImage imageNamed:@"leftArrow"];

    UIButton *checkInButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [checkInButton setBackgroundImage:checkInImage forState:UIControlStateNormal];
    
    [checkInButton addTarget:self
                      action:@selector(navitionBackAction:)
            forControlEvents:UIControlEventTouchUpInside];
    [checkInButton setShowsTouchWhenHighlighted:YES];
    
    //const CGFloat BarButtonOffset =-5.0f;//iOS 7 set -15.0f
    [checkInButton setFrame:CGRectMake(0, 0, 20, 35)];
    
    UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 35)];
    [containerView addSubview:checkInButton];
    
    //    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:containerView];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:checkInButton];
    
    return item;
}

-(void)navitionBackAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    
    return [exerciseList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *CellIdentifier = @"exerciseTableViewCell";
    
    ExerciseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[ExerciseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    Exercise *exercise = [exerciseList objectAtIndex:indexPath.row];
    cell.exerciseTitle.text = exercise.title;
    
    return cell;
}


-(void)tableView:(UITableView*) tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    //selectedExerciseIndex = indexPath.row;
    
    [self performSegueWithIdentifier:@"TableViewToDetailView" sender:self];
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"TableViewToDetailView"]) {
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        ExerciseDetailViewController * detailView = [segue destinationViewController];
        detailView.exercise = [exerciseList objectAtIndex:path.row] ;
    }
    
}


@end

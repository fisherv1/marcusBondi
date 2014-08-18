//
//  ViewController.m
//  Fitness
//
//  Created by Matthew Lu on 14/08/2014.
//  Copyright (c) 2014 Matthew Lu. All rights reserved.
//

#import "ViewController.h"
#import "CountDownView.h"
#import "CountDownMarco.h"
#import "ToolMethod.h"
@interface ViewController ()
{

}
@end

@implementation ViewController
@synthesize startWorkoutBtn,descLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

//    CountDownView *countDownView= [[CountDownView alloc]initWithFrame:CGRectMake(0, 100, 320, 200)];
//    countDownView.userInteractionEnabled = YES;
//
//    [self.view addSubview:countDownView];
    
//    UILabel* tlabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0, 200, 40)];
//    [tlabel setTextAlignment:NSTextAlignmentCenter];
//    tlabel.font = [UIFont fontWithName:FUTURA_FONT size:16.0];
//    tlabel.textColor = [UIColor blackColor];
//    tlabel.backgroundColor = [UIColor clearColor];
//    tlabel.adjustsFontSizeToFitWidth = YES;
//    tlabel.text = MARCUSBONDI;
//    
//    [tlabel sizeToFit];
//    self.navigationItem.titleView = tlabel;
//    
//    self.view.backgroundColor = [[UIColor alloc]initWithRed:238.0/255.0 green:238.0/255.0 blue:238.0/255.0 alpha:1.0];
    

    
    
    [self configDescLabel];
    [self configStartButton];
    
}

-(void)configDescLabel
{
    if (![ToolMethod isIPHONE5]) {
        
        descLabel.frame = CGRectMake(descLabel.frame.origin.x, descLabel.frame.origin.y+5, descLabel.frame.size.width, 300);
        descLabel.adjustsFontSizeToFitWidth = YES;
        
    }
}



-(void)configStartButton{
    
    [startWorkoutBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    
    if (![ToolMethod isIPHONE5]) {
        startWorkoutBtn.frame = CGRectMake(0, descLabel.frame.origin.y+descLabel.frame.size.height, DeviceWidth, 43);
    }
    
}

- (IBAction)startWorkoutAction:(id)sender {

    [self performSegueWithIdentifier:@"HomeToExerciseTable" sender:self];
}


    





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

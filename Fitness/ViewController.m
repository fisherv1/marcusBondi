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
@synthesize startWorkoutBtn,descLabel,weblinkLabel;


-(void)viewWillAppear:(BOOL)animated
{
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    //[[UIApplication sharedApplication] setStatusBarHidden:YES];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [[self navigationController] setNavigationBarHidden:NO animated:NO];
   // [[UIApplication sharedApplication] setStatusBarHidden:NO];
}



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
    

    
    [self configWeblinkLabel];
    [self configDescLabel];
    [self configStartButton];
    
}

-(void)configWeblinkLabel
{
    NSMutableAttributedString *commentString = [[NSMutableAttributedString alloc] initWithString:@"www.MarcusBondi.com"];
    
    UIColor* textColor = [UIColor blueColor];
    
    [commentString setAttributes:@{NSForegroundColorAttributeName:textColor,NSUnderlineStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle]} range:NSMakeRange(0,[commentString length])];
    
    
    // Or for adding Colored text use----------
    
    
    [weblinkLabel setAttributedTitle:commentString forState:UIControlStateNormal];}

- (IBAction)goToWeb:(id)sender {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.marcusbondi.com"]];
}


-(void)configDescLabel
{
    
    NSMutableAttributedString * instruction_description = [[NSMutableAttributedString alloc] initWithString:GetInfoString(@"instruction_description")];
    
    NSString* instruction_red_para1_start = GetInfoString(@"instruction_red_para1_start");
   
    NSString *instruction_red_para1 = GetInfoString(@"instruction_red_para1");
    

    NSString* instruction_red_para2_start = GetInfoString(@"instruction_red_para2_start");
    NSString* instruction_red_para2 = GetInfoString(@"instruction_red_para2");
    
//  NSString* instruction_bold_para_start = GetInfoString(@"instruction_bold_para_start");
//    NSString *instruction_bold_para = GetInfoString(@"instruction_bold_para");

                                        
    [instruction_description addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(instruction_red_para1_start.length,instruction_red_para1.length)];
    
    [instruction_description addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(instruction_red_para2_start.length,instruction_red_para2.length)];
    
    

//    UIFont *boldFont = [UIFont fontWithName:@"Futura-CondensedExtraBold" size:16];
//
//    [instruction_description setAttributes:@{NSFontAttributeName:boldFont} range:NSMakeRange(instruction_bold_para_start.length,instruction_bold_para.length)];
    
    
    
    descLabel.attributedText = instruction_description;
    
    
    if (![ToolMethod isIPHONE5]) {
        
        descLabel.frame = CGRectMake(descLabel.frame.origin.x, descLabel.frame.origin.y-5, descLabel.frame.size.width, 328);
        descLabel.adjustsFontSizeToFitWidth = YES;
        
    }
}



-(void)configStartButton{
    
    [startWorkoutBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    
    if (![ToolMethod isIPHONE5]) {
        startWorkoutBtn.frame = CGRectMake(0, descLabel.frame.origin.y+descLabel.frame.size.height, DeviceWidth, 40);
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

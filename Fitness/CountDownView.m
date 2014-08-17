//
//  CountDownView.m
//  Fitness
//
//  Created by Matthew Lu on 15/08/2014.
//  Copyright (c) 2014 Matthew Lu. All rights reserved.
//

#import "CountDownView.h"
#import "CountDownMarco.h"
#import "ToolMethod.h"
const int kBUTTON_FONT_SIZE = 16;
const float KBUTTON_BORDER_SIZE = 2.0f;


@interface CountDownView()
{
    circleButton *startButton;
    circleButton *endButton;
    UILabel *countDownLabel;
    
    int countDownTime;
    NSTimer *timer;
    BOOL isTimerPause;
    BOOL isTimerStart;
    
    UIActionSheet *sheetAlter;
}
@end



@implementation CountDownView
@synthesize delegate;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
      //  if ([ToolMethod isIPHONE5]) {
        self.frame = CGRectMake(frame.origin.x, frame.origin.y, DeviceWidth, 200);
       // }
//        else {
//        self.frame = CGRectMake(frame.origin.x, frame.origin.y, DeviceWidth, 150);
//        }
        
        
        
        isTimerPause = false;
        isTimerStart = false;
        
        
        [self setupCountDown];
        [self setupStartBtn];
        [self setupEndBtn];
        
    }
    return self;
}



-(void)setupStartBtn
{
    
    if ([ToolMethod isIPHONE5]) {
        startButton = [[circleButton alloc]initWithFrame:CGRectMake(65,countDownLabel.frame.origin.y+countDownLabel.frame.size.height+10, 70, 70)];
    }
    else
    {
        startButton = [[circleButton alloc]initWithFrame:CGRectMake(65,countDownLabel.frame.origin.y+countDownLabel.frame.size.height+5, 70, 70)];
    }


    
    startButton.borderColor = [UIColor greenColor];
    startButton.borderSize = KBUTTON_BORDER_SIZE;
    startButton.animateTap = NO;
    
    [startButton setTitle:START forState:UIControlStateNormal];
    
    [startButton addTarget:self action:@selector(startAction:) forControlEvents:UIControlEventTouchUpInside];
    
    startButton.titleLabel.font = [UIFont systemFontOfSize:kBUTTON_FONT_SIZE];

    [startButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    
    [self addSubview:startButton];
}

-(void)setupEndBtn
{
    endButton = [[circleButton alloc]initWithFrame:CGRectMake(startButton.frame.origin.x + startButton.frame.size.width+50, startButton.frame.origin.y, 70, 70)];

    endButton.borderColor =[UIColor blackColor];
    endButton.borderSize = KBUTTON_BORDER_SIZE;
    endButton.animateTap = NO;

    endButton.enabled = YES;
    
    [endButton setTitle:END forState:UIControlStateNormal];
    
    [endButton addTarget:self action:@selector(endAction:) forControlEvents:UIControlEventTouchUpInside];
    
    endButton.titleLabel.font = [UIFont systemFontOfSize:kBUTTON_FONT_SIZE];
    [endButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview:endButton];
}

-(void)setupCountDown{
    
    if ([ToolMethod isIPHONE5]) {
    countDownLabel =[[UILabel alloc]initWithFrame:CGRectMake(0, 0,DeviceWidth , 50)];
    }
    else
    {
    countDownLabel =[[UILabel alloc]initWithFrame:CGRectMake(0, 5,DeviceWidth , 50)];
    }
    
    countDownTime = kCOUNT_TIME;
    countDownLabel.textAlignment = NSTextAlignmentCenter;
    [countDownLabel setFont:[UIFont fontWithName:@"Futura-CondensedMedium" size:kCOUNT_DOWN_LABEL_FONT_SIZE]];
    
    countDownLabel.text = THIRTY_SECOND;
    
    [self addSubview:countDownLabel];
}


- (IBAction)startAction:(id)sender {
    
        if (isTimerPause) {
            isTimerPause = NO;
            [startButton setTitle:RESUME forState:UIControlStateNormal];
            startButton.titleLabel.text = RESUME;
            
            startButton.borderColor =[UIColor greenColor];
            [startButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
            [timer invalidate];
   
        }else{
            
            isTimerPause = YES;
            startButton.borderColor =[UIColor redColor];
            [startButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            
            [startButton setTitle:PAUSE forState:UIControlStateNormal];
            [self startTimer];
       }
    
    
    
    
//    
//    if (isTimerStart) {
//        
//        [self resetTimer];
//    }
//    else
//    {
//        startButton.borderColor =[UIColor grayColor];
//        [startButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//        
//        endButton.enabled = YES;
//        endButton.borderColor =[UIColor redColor];
//        [endButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//        
//        [startButton setTitle:PAUSE forState:UIControlStateNormal];
//        [self startTimer];
//        isTimerStart = true;
//        
//    }
    
    
}


-(void)startTimer{
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerFireMethod) userInfo:nil repeats:YES];
}

- (IBAction)endAction:(id)sender {
    
   // isTimerPause = YES;
    [timer invalidate];

    
    sheetAlter = [[UIActionSheet alloc] initWithTitle:@"" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"End Workout" otherButtonTitles:nil, nil];
    sheetAlter.delegate=self;

    [sheetAlter setActionSheetStyle:UIActionSheetStyleBlackTranslucent];
    [sheetAlter showInView:self.window];


//    
//    if (isTimerPause) {
//        isTimerPause = NO;
//        
//        [endButton setTitle:PAUSE forState:UIControlStateNormal];
//        
//        endButton.titleLabel.text = PAUSE;
//        [self startTimer];
//        
//    }else{
//        isTimerPause = YES;
//        [timer invalidate];
//      //  [endButton setTitle:RESUME forState:UIControlStateNormal];
//    }
    
}


-(void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0:
            if (delegate) {
                [delegate goBackToLastViewController];
            }
            break;
        case 1:
            if (isTimerPause) {
                [self startTimer];
            }
            //isTimerPause = NO;
            
      
            break;
    }
    
}





-(void)timerFireMethod{
    
    if (countDownTime >0) {
        countDownTime --;
        countDownLabel.text = [NSString stringWithFormat:@"00:%02d",countDownTime];
    }
    else
    {
        //Show alert and beep
        [ToolMethod playBeepSound];
        [self resetTimer];
        
        if (delegate) {
            [delegate finishedWorkout];
        }
        
        
    }
}


-(void)resetTimer{
    
    [timer invalidate];
    countDownTime = kCOUNT_TIME;
    [startButton setTitle:START forState:UIControlStateNormal];
    countDownLabel.text = THIRTY_SECOND;
    isTimerPause = NO;
    isTimerStart = NO;
    
    
    startButton.borderColor =[UIColor greenColor];
    [startButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    
  //  endButton.enabled = NO;
  //  endButton.borderColor =[UIColor grayColor];
   // [endButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

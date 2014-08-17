//
//  BreakView.m
//  Fitness
//
//  Created by Matthew Lu on 17/08/2014.
//  Copyright (c) 2014 Matthew Lu. All rights reserved.
//

#import "BreakView.h"
#import "CountDownMarco.h"
#import "ToolMethod.h"
@interface BreakView()
{
    UILabel *breakTextLabel;
    UILabel *countDownLabel;
    UIButton *nextButton;
    
    int countDownTime;
    NSTimer *timer;
}
@end


const int kBREAD_TEXT_FONT_SIZE = 25;
const int kNEXT_BUTTON_FONT_SIZE = 16;
@implementation BreakView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
       // self.frame = self.bounds;
       // self.backgroundColor = [UIColor redColor];
       // self.alpha = 0.5f;
    
        [self addBreadTextLabel];
        [self addCountDownLabel];
        [self addNextButton];
        [self startTimer];
    }
    return self;
}


-(void)addBreadTextLabel{

    breakTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, DeviceHeight/2-100, DeviceWidth, 20)];
    breakTextLabel.textAlignment = NSTextAlignmentCenter;
    [breakTextLabel setFont:[UIFont fontWithName:@"Futura-CondensedMedium" size:kBREAD_TEXT_FONT_SIZE]];
    
    breakTextLabel.text = BREAK;
    
    [self addSubview:breakTextLabel];
    
    
}

-(void)addCountDownLabel{
    countDownLabel =[[UILabel alloc]initWithFrame:CGRectMake(0, breakTextLabel.frame.origin.y+breakTextLabel.frame.size.height+10,DeviceWidth , 50)];
    
    
    countDownTime = kCOUNT_TIME;
    countDownLabel.textAlignment = NSTextAlignmentCenter;
    [countDownLabel setFont:[UIFont fontWithName:@"Futura-CondensedMedium" size:kCOUNT_DOWN_LABEL_FONT_SIZE]];
    
    countDownLabel.text = THIRTY_SECOND;
    
    [self addSubview:countDownLabel];
}

-(void)addNextButton{

    nextButton = [[UIButton alloc]initWithFrame:CGRectMake(110,countDownLabel.frame.origin.y+countDownLabel.frame.size.height+20, 100, 30)];


    
    [nextButton setTitle:NEXT forState:UIControlStateNormal];
    
    [nextButton addTarget:self action:@selector(nextAction:) forControlEvents:UIControlEventTouchUpInside];
    
    nextButton.titleLabel.font =  [UIFont fontWithName:@"Futura-CondensedMedium" size:kNEXT_BUTTON_FONT_SIZE];
    
    [nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    nextButton.backgroundColor = [UIColor blackColor];
    [self addSubview:nextButton];
}


- (IBAction)nextAction:(id)sender {
    [self removeView];
}


-(void)startTimer{
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerFireMethod) userInfo:nil repeats:YES];
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
        [self removeView];
    }
    
}


-(void)removeView
{
    [timer invalidate];
    [UIView animateWithDuration:1.0 animations:^{
        [self removeFromSuperview];
    }];
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

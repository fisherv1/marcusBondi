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
//#import "UIImage+ImageEffects.h"
@interface BreakView()
{
    UIImageView *backgroundView;
    UILabel *breakTextLabel;
    UILabel *countDownLabel;
    UIButton *nextButton;
    
    int countDownTime;
    NSTimer *timer;
}
@end


const int kBREAD_TEXT_FONT_SIZE = 35;
const int kNEXT_BUTTON_FONT_SIZE = 25;
@implementation BreakView

- (id)initWithFrame:(CGRect)frame andSnapshot :(UIImage*)snapshotImg
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
       // self.frame = self.bounds;
       // self.backgroundColor = [UIColor redColor];
       // self.alpha = 0.5f;
    
        [self addBackgroundImageView:snapshotImg];
        [self addBreadTextLabel];
        [self addCountDownLabel];
        [self addNextButton];
        [self startTimer];
    }
    return self;
}


-(void)addBackgroundImageView:(UIImage*)snapshotImg
{
    
    backgroundView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, DeviceWidth, DeviceHeight)];
    backgroundView.image =snapshotImg;
    backgroundView.userInteractionEnabled = YES;
    [self addSubview:backgroundView];
}

-(void)addBreadTextLabel{

    breakTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, DeviceHeight/2-100, DeviceWidth, 50)];
    breakTextLabel.textAlignment = NSTextAlignmentCenter;
    [breakTextLabel setFont:[UIFont fontWithName:FUTURA_FONT size:kBREAD_TEXT_FONT_SIZE]];
    
    breakTextLabel.text = BREAK;
    
    [self addSubview:breakTextLabel];
    
    
}

-(void)addCountDownLabel{
    countDownLabel =[[UILabel alloc]initWithFrame:CGRectMake(0, breakTextLabel.frame.origin.y+breakTextLabel.frame.size.height+30,DeviceWidth , 50)];
    
    
    countDownTime = kCOUNT_TIME;
    countDownLabel.textAlignment = NSTextAlignmentCenter;
    [countDownLabel setFont:[UIFont fontWithName:FUTURA_FONT size:kCOUNT_DOWN_LABEL_FONT_SIZE]];
    
    countDownLabel.text = THIRTY_SECOND;
    
    [self addSubview:countDownLabel];
}

-(void)addNextButton{

    nextButton = [[UIButton alloc]initWithFrame:CGRectMake(85,countDownLabel.frame.origin.y+countDownLabel.frame.size.height+40, 150, 50)];


    
    [nextButton setTitle:NEXT forState:UIControlStateNormal];
    
    [nextButton addTarget:self action:@selector(nextAction:) forControlEvents:UIControlEventTouchUpInside];
    
    nextButton.titleLabel.font =  [UIFont fontWithName:FUTURA_FONT size:kNEXT_BUTTON_FONT_SIZE];
    
    [nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    nextButton.backgroundColor = [UIColor blackColor];
    //[self addSubview:nextButton];
    
    [backgroundView addSubview:nextButton];
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

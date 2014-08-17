//
//  countDownViewGoBackDelegate.h
//  Fitness
//
//  Created by Matthew Lu on 17/08/2014.
//  Copyright (c) 2014 Matthew Lu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol countDownViewGoBackDelegate <NSObject>

@required
-(void)goBackToLastViewController;

-(void)finishedWorkout;
@end

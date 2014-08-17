//
//  ExerciseDetailViewController.h
//  Fitness
//
//  Created by Matthew Lu on 16/08/2014.
//  Copyright (c) 2014 Matthew Lu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "countDownViewGoBackDelegate.h"

@class Exercise;
@interface ExerciseDetailViewController : UIViewController<UIScrollViewDelegate,countDownViewGoBackDelegate>
{

    Exercise *exercise;
}

@property (strong,nonatomic) Exercise *exercise;

@end

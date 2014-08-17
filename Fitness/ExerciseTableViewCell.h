//
//  ExerciseTableViewCell.h
//  Fitness
//
//  Created by Matthew Lu on 16/08/2014.
//  Copyright (c) 2014 Matthew Lu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExerciseTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *exerciseTitle;
@property (weak, nonatomic) IBOutlet UILabel *exerciseDuration;

@end

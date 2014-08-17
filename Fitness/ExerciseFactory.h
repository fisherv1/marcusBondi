//
//  ExerciseFactory.h
//  Fitness
//
//  Created by Matthew Lu on 15/08/2014.
//  Copyright (c) 2014 Matthew Lu. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Exercise;
@interface ExerciseFactory : NSObject


+(NSArray*)getExercises;
+(NSString*)getIntroduction;

+(NSString*)getIntroductionTitle;

+(Exercise*)getWorkout:(int)workoutID;
@end

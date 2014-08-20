//
//  ExerciseFactory.m
//  Fitness
//
//  Created by Matthew Lu on 15/08/2014.
//  Copyright (c) 2014 Matthew Lu. All rights reserved.
//

#import "ExerciseFactory.h"
#import "Exercise.h"
#import "CountDownMarco.h"

@implementation ExerciseFactory

+(NSArray*)getExercises{
    //Ex1
    Exercise *ex1 = [[Exercise alloc]init];
    ex1.exerciseID = 1;
    ex1.title = GetInfoString(@"ex1_title");
    ex1.descriptions = GetInfoString(@"ex1_desc");
    
    ex1.ImagesArray =@[[UIImage imageNamed:@"1.jpg"]];
    
    //Ex2
    Exercise *ex2 = [[Exercise alloc]init];
    ex2.exerciseID = 2;
    ex2.title = GetInfoString(@"ex2_title");
    ex2.descriptions = GetInfoString(@"ex2_desc");
    ex2.ImagesArray =@[[UIImage imageNamed:@"2_1.jpg"],[UIImage imageNamed:@"2_2.jpg"]];

    //Ex3
    
    Exercise *ex3 = [[Exercise alloc]init];
    ex3.exerciseID = 3;
    ex3.title = GetInfoString(@"ex3_title");
    ex3.descriptions = GetInfoString(@"ex3_desc");
    ex3.ImagesArray =@[[UIImage imageNamed:@"3.jpg"]];
    
    //Ex4
    
    Exercise *ex4 = [[Exercise alloc]init];
    ex4.exerciseID = 4;
    ex4.title = GetInfoString(@"ex4_title");
    ex4.descriptions = GetInfoString(@"ex4_desc");
    ex4.ImagesArray =@[[UIImage imageNamed:@"4_1.jpg"],[UIImage imageNamed:@"4_2_1.jpg"]];
    //Ex5
    
    Exercise *ex5 = [[Exercise alloc]init];
    ex5.exerciseID = 5;
    ex5.title = GetInfoString(@"ex5_title");
    ex5.descriptions = GetInfoString(@"ex5_desc");
    ex5.ImagesArray =@[[UIImage imageNamed:@"5_1.jpg"],[UIImage imageNamed:@"5_2.jpg"]];
    //Ex6
    
    Exercise *ex6 = [[Exercise alloc]init];
    ex6.exerciseID = 6;
    ex6.title = GetInfoString(@"ex6_title");
    ex6.descriptions = GetInfoString(@"ex6_desc");
    ex6.ImagesArray =@[[UIImage imageNamed:@"6.jpg"]];
    NSArray *exerciesList = @[ex1,ex2,ex3,ex4,ex5,ex6];
    
    return exerciesList;
}

+(Exercise*)getWorkout:(int)workoutID
{
    NSArray *exercises = [ExerciseFactory getExercises];
    
    return [exercises objectAtIndex:workoutID-1];
}


+(NSString*)getIntroduction{
    return GetInfoString(@"instruction_description");
}


+(NSString*)getIntroductionTitle
{
    return GetInfoString(@"instruction_header");
}

@end

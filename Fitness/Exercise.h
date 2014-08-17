//
//  Exercise.h
//  Fitness
//
//  Created by Matthew Lu on 15/08/2014.
//  Copyright (c) 2014 Matthew Lu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Exercise : NSObject
{
    int exerciseID;
    NSString *title;
    NSString *descriptions;
    NSArray *ImagesArray;
   // UIImage *exerciseImgOne;
   // UIImage *exerciseImgTwo;
}
@property(nonatomic) int exerciseID;
@property(nonatomic,strong) NSString *title;
@property(nonatomic,strong) NSString *descriptions;
//@property(nonatomic,strong) UIImage *exerciseImgOne;
//@property(nonatomic,strong) UIImage *exerciseImgTwo;
@property(nonatomic,strong) NSArray *ImagesArray;

@end

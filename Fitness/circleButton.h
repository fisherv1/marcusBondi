//
//  circleButton.h
//  Fitness
//
//  Created by Matthew Lu on 15/08/2014.
//  Copyright (c) 2014 Matthew Lu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface circleButton : UIButton

@property (nonatomic, strong) UIColor *borderColor;
@property (nonatomic) BOOL animateTap;
@property (nonatomic) BOOL displayShading;
@property (nonatomic) CGFloat borderSize;

- (void)blink;

- (void)setImage:(UIImage *)image animated: (BOOL)animated;
@end

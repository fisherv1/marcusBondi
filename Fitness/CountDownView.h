//
//  CountDownView.h
//  Fitness
//
//  Created by Matthew Lu on 15/08/2014.
//  Copyright (c) 2014 Matthew Lu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "circleButton.h"
#import "countDownViewGoBackDelegate.h"

@interface CountDownView : UIView<UIActionSheetDelegate>
@property (nonatomic, assign) id<countDownViewGoBackDelegate> delegate;

@end

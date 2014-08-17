//
//  ToolMethod.h
//  Fitness
//
//  Created by Matthew Lu on 15/08/2014.
//  Copyright (c) 2014 Matthew Lu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"
#import <AVFoundation/AVAudioPlayer.h>
@interface ToolMethod : NSObject<AVAudioPlayerDelegate>

//
+(void)showAlertView:(NSString *)title : (NSString *)message : (NSString *) cancelBtnTitle;


//
+ (MBProgressHUD*)showHUD;
+ (void)hideHUD;

+ (UILabel *) configNavigationTitle:(NSString *)topString titleColor:(UIColor *)color;

+ (BOOL) isIPHONE5;
+ (BOOL) isIOS7;
+ (void) playBeepSound ;
@end

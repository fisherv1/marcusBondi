//
//  ToolMethod.m
//  Fitness
//
//  Created by Matthew Lu on 15/08/2014.
//  Copyright (c) 2014 Matthew Lu. All rights reserved.
//

#import "ToolMethod.h"
#import <AudioToolbox/AudioToolbox.h>

@implementation ToolMethod
{

}


#pragma mark judge is iphone5
+ (BOOL)isIPHONE5 {
    UIScreen *mainScreen = [UIScreen mainScreen];
    CGFloat scale = ([mainScreen respondsToSelector:@selector(scale)] ? mainScreen.scale : 1.0f);
    CGFloat pixelHeight = (CGRectGetHeight(mainScreen.bounds) * scale);
    
    if(pixelHeight == 1136.0f) {
        //NSLog(@"isIPHONE5");
        return TRUE;
    }
    
   // NSLog(@"isIPHONE4");
    return FALSE;
}
#pragma mark -
#pragma mark judge is ios 7
+ (BOOL)isIOS7 {
    
    return  [[[UIDevice currentDevice]systemVersion] floatValue] >= 7.0f;
}


#pragma mark navigationBar titleView
+ (UILabel *) configNavigationTitle:(NSString *)topString titleColor:(UIColor *)color {
    
    /*IOS6
     double topStringWidth = [topString sizeWithFont:[UIFont boldSystemFontOfSize:20]].width;
     */
    CGSize textSize = [topString sizeWithAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:20]}];
    
    double topStringWidth = textSize.width;
    
    
    UILabel *toplab=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, topStringWidth, 45)];
    if ([ToolMethod isIOS7]) {
     //   toplab.font=[UIFont boldSystemFontOfSize:18];
         toplab.font=[UIFont fontWithName:@"Futura-CondensedMedium" size:18];
    }
    else {
        //toplab.font=[UIFont boldSystemFontOfSize:20];
        toplab.font=[UIFont fontWithName:@"Futura-CondensedMedium" size:20];
    }
    
    if ([toplab.text length] >18) {
       // toplab.font=[UIFont boldSystemFontOfSize:18];
        toplab.font=[UIFont fontWithName:@"Futura-CondensedMedium" size:18];
    }
    
    toplab.adjustsFontSizeToFitWidth = TRUE;
    
    
    toplab.textColor=color;
    toplab.textAlignment= NSTextAlignmentCenter;
    toplab.text=topString;
    [toplab setBackgroundColor:[UIColor clearColor]];
    return toplab;
}



#pragma show alert
+(void)showAlertView:(NSString *)title : (NSString *)message : (NSString *) cancelBtnTitle
{
    UIAlertView *alertDialog;
    alertDialog = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:cancelBtnTitle otherButtonTitles:nil, nil];
    // alertDialog.alertViewStyle = UIAlertViewStyleDefault;
    [alertDialog show];
}

#pragma mark MBProgressHUD
+ (MBProgressHUD*)showHUD {
    //    window = [[[UIApplication sharedApplication] windows] lastObject];
    //    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    
    // __block MBProgressHUD *hud = nil; *hud = nil;
    // dispatch_async(dispatch_get_main_queue(), ^{
    UIWindow*  window = [[[UIApplication sharedApplication] windows] lastObject];
    MBProgressHUD *  HUD = [MBProgressHUD showHUDAddedTo:window animated:YES];
    //        hud.dimBackground = YES;//  alert一樣的背景
    // });
    
    return HUD;
}
+ (void)hideHUD {
    //    [MBProgressHUD hideHUDForView:window animated:YES];
    //  dispatch_async(dispatch_get_main_queue(), ^{
    UIWindow*  window = [[[UIApplication sharedApplication] windows] lastObject];
    [MBProgressHUD hideHUDForView:window animated:YES];
    
    //});
    
}


 + (void) playBeepSound {
//    NSURL *bgURL=[[NSURL alloc] initFileURLWithPath:[[NSBundle mainBundle] pathForResource:@"beep" ofType:@"mp3"]];
//    AVAudioPlayer *playerSound=[[AVAudioPlayer alloc] initWithContentsOfURL:bgURL error:nil];
//     [playerSound prepareToPlay];
//    playerSound.delegate=self;
//    [playerSound setVolume:1.0f];
//    [playerSound play];
    //[playerSound setNumberOfLoops:2];
     
     
     SystemSoundID soundID;
     NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/beep.mp3", [[NSBundle mainBundle] resourcePath]]];
     
     AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &soundID);
     AudioServicesPlaySystemSound (soundID);
}


@end

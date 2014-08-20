//
//  ExerciseDetailViewController.m
//  Fitness
//
//  Created by Matthew Lu on 16/08/2014.
//  Copyright (c) 2014 Matthew Lu. All rights reserved.
//

#import "ExerciseDetailViewController.h"
#import "Exercise.h"
#import "ExerciseFactory.h"
#import "CountDownView.h"
#import "CountDownMarco.h"
#import "BreakView.h"
#import "ToolMethod.h"
#import "UIImage+ImageEffects.h"

@interface ExerciseDetailViewController ()
{
  UIPageControl *pageControl;
    CountDownView *countDwonView;
      int currentPage;
    UIView* breadView;
}
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@end

@implementation ExerciseDetailViewController
@synthesize exercise,scrollView,descLabel;



-(UIImage *)blurredSnapshot
{
    // context
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, self.view.window.screen.scale);
    
    // the new api
    [self.view drawViewHierarchyInRect:self.view.frame afterScreenUpdates:NO];
    
    // get snapshots
    UIImage *snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
    
    
    // apple the blur effect to the image
    UIImage *blurredSnapshotImage = [snapshotImage applyLightEffect];
    
    // other effects
    // UIImage *blurredSnapshotImage = [snapshotImage applyDarkEffect];
    // UIImage *blurredSnapshotImage = [snapshotImage applyExtraLightEffect];
    
    
    UIGraphicsEndImageContext();
    
    return blurredSnapshotImage;
}






//delegate Method

-(void)goBackToLastViewController
{
 [self.navigationController popViewControllerAnimated:YES];
}


-(void)finishedWorkout
{

    if (exercise.exerciseID != 6) {
        [self changeWorkout];
        [self addBreadView];
    }
    else { //Finished all workouts
    
        [ToolMethod showAlertView:@"Well Done!" :@"You have finished all exercises" :@"OK"];
        
        [self goBackToLastViewController];
    }



}


-(void)changeWorkout{

    int nextExerciesID = exercise.exerciseID +1;
    //NSLog(@"%d",nextExerciesID);
    if (nextExerciesID != 7) {
     exercise = [ExerciseFactory getWorkout:exercise.exerciseID +1];
    }
   
    
    [scrollView setContentOffset:CGPointMake(0,0) animated:NO];
    
    currentPage = 0;
    pageControl.currentPage = currentPage;
    pageControl.numberOfPages = exercise.ImagesArray.count;
  //  [self configScrollView];
    
    [self resetScrollViewContentSize];
    [self resetDescLabelContent];


    [self showPageControl];
    
    [self addImageToScrollView];
    
}


-(void)addBreadView
{
    breadView = [[BreakView alloc] initWithFrame:CGRectMake(0, 0, DeviceWidth, DeviceHeight) andSnapshot:[self blurredSnapshot]];
    
//    breadView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.8];
//    breadView.alpha = 0.8;
    breadView.transform = CGAffineTransformMakeScale(0.8, 0.8);
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         breadView.alpha = 1;
                         breadView.transform = CGAffineTransformMakeScale(1.0, 1.0);
                     }];
    
    [self.view.window addSubview:breadView];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
           currentPage = 0;
    }
    return self;
}


-(void)viewWillAppear:(BOOL)animated
{
  [[self navigationController] setNavigationBarHidden:YES animated:YES];
  [[UIApplication sharedApplication] setStatusBarHidden:YES];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [[self navigationController] setNavigationBarHidden:NO animated:NO];
 [[UIApplication sharedApplication] setStatusBarHidden:NO];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.


    [self configScrollView];
    [self configDescLabel];
    [self configPageControl];
    
    [self showPageControl];
    
    [self addImageToScrollView];
    [self addCountDownView];
    
}


-(void)configDescLabel
{
    descLabel.text = exercise.descriptions;
      descLabel.adjustsFontSizeToFitWidth = YES;

    if (![ToolMethod isIPHONE5]) {
    
//        CGRect descLinesize=[descLabel.text boundingRectWithSize:CGSizeMake(descLabel.frame.size.width, CELL_MAX_HEIGHT) options:NSStringDrawingUsesLineFragmentOrigin
//                                                        attributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Futura-CondensedMedium" size:17],NSFontAttributeName, nil]  context:nil];
//        
//        
//        CGRect descLineRect = descLabel.frame;
//        descLabel.frame = CGRectMake(descLineRect.origin.x, descLineRect.origin.y, descLineRect.size.width, descLinesize.size.height);
        
        descLabel.frame = CGRectMake(descLabel.frame.origin.x, scrollView.frame.origin.y+scrollView.frame.size.height, descLabel.frame.size.width, descLabel.frame.size.height - 30);
        
    }
}

-(void)resetDescLabelContent
{
        descLabel.text = exercise.descriptions;
}

-(void)configScrollView{

    
    scrollView.pagingEnabled = YES;
    scrollView.clipsToBounds = NO;
    
    
    scrollView.contentSize = CGSizeMake(DeviceWidth* exercise.ImagesArray.count, 1);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    
    scrollView.delegate = self;
    
    if (![ToolMethod isIPHONE5]) {
    scrollView.frame = CGRectMake(scrollView.frame.origin.x, scrollView.frame.origin.y, scrollView.frame.size.width, scrollView.frame.size.height - 30);
    }

 
}

-(void)resetScrollViewContentSize
{
        scrollView.contentSize = CGSizeMake(DeviceWidth* exercise.ImagesArray.count, 1);
}

-(void)showPageControl
{
    
    if (exercise.ImagesArray.count > 1) {

        pageControl.hidden = NO;
    }
    else
    {
        pageControl.hidden = YES;
    }
}
-(void)configPageControl
{

  //  if (exercise.ImagesArray.count>1) {
    
    pageControl = [[UIPageControl alloc] init];
    
    pageControl.numberOfPages = exercise.ImagesArray.count;
    pageControl.currentPage = 0;
    pageControl.backgroundColor = [UIColor clearColor];
    [pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    
    pageControl.frame = CGRectMake(DeviceWidth/2-50, scrollView.frame.size.height-30, 111, 36);
    
    [self.view addSubview:pageControl];

    [self.view insertSubview:pageControl atIndex:0];

   // }
    
}

-(void)addImageToScrollView
{
    for (int i=0; i< exercise.ImagesArray.count; i++) {
        
        UIImage *img = [exercise.ImagesArray objectAtIndex:i];
        
        
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(i*DeviceWidth, 0, DeviceWidth , scrollView.frame.size.height)];
        
        //this is for exercise 4 , second image, it's protrait
        if (exercise.exerciseID == 4 && i==1) {
            int imageWidth = 200;
            imgView.frame =CGRectMake(imgView.frame.origin.x+DeviceWidth/2-imageWidth/2, 0, imageWidth , imgView.frame.size.height);
        }
        
        
        
        imgView.image = img;
        
       // pageControl.frame = CGRectMake(i*DeviceWidth+DeviceWidth/2-50, 230, 111, 36);
        [scrollView addSubview:imgView];
        [self.view  bringSubviewToFront:pageControl];
    }
}

-(void)addCountDownView
{
    
    if ([ToolMethod isIPHONE5]) {
    
    countDwonView = [[CountDownView alloc]initWithFrame:CGRectMake(0, descLabel.frame.origin.y+descLabel.frame.size.height+5, 320, 50)];
    }
    else
    {
    countDwonView = [[CountDownView alloc]initWithFrame:CGRectMake(0, descLabel.frame.origin.y+descLabel.frame.size.height-3, 320, 50)];
    }
    
    countDwonView.delegate = self;
    [self.view addSubview:countDwonView];
    
}



- (void) scrollViewDidScroll:(UIScrollView *)sender {
    CGFloat pageWidth=sender.frame.size.width;
    int page=floor((sender.contentOffset.x - pageWidth/2)/pageWidth)+1;
    pageControl.currentPage=page;
    
    if (currentPage != page) {
        currentPage = page;
    }

}


- (void) changePage:(id) sender {
    int page=pageControl.currentPage;
    
    CGRect frame=scrollView.frame;
    frame.origin.x=frame.size.width*page;
    frame.origin.y=0;
    [scrollView scrollRectToVisible:frame animated:YES];
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  ExerciseTableViewCell.m
//  Fitness
//
//  Created by Matthew Lu on 16/08/2014.
//  Copyright (c) 2014 Matthew Lu. All rights reserved.
//

#import "ExerciseTableViewCell.h"

@implementation ExerciseTableViewCell
@synthesize exerciseDuration,exerciseTitle;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

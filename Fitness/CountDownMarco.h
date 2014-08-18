//
//  CountDownMarco.h
//  Fitness
//
//  Created by Matthew Lu on 15/08/2014.
//  Copyright (c) 2014 Matthew Lu. All rights reserved.
//

#ifndef Fitness_CountDownMarco_h
#define Fitness_CountDownMarco_h

//#define STOP @"Stop"
#define CANCEL @"Cancel"
#define START @"Start"
#define PAUSE @"Pause"
#define RESUME @"Resume"
#define END @"End"
#define NEXT @"NEXT EXERCISE"

#define MARCUSBONDI @"MARCUS BONDI"
#define EXERCISE_TABLE_NAVIGATION_TITLE @"CHOOSE WORKOUT"

#define DeviceHeight [[UIScreen mainScreen] bounds].size.height
#define DeviceWidth [[UIScreen mainScreen] bounds].size.width
#define THIRTY_SECOND @"00:30";

#define FUTURA_FONT @"Futura-CondensedMedium"

#define GetInfoString(string) NSLocalizedStringFromTable(string, @"InfoPlist", nil)


#define BREAK @"Take a 30 sec break"
static const int kCOUNT_TIME = 2;
static const int kCOUNT_DOWN_LABEL_FONT_SIZE = 60;

#define CELL_MAX_HEIGHT 1000.f
#endif

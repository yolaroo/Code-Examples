//
//  PDViewController.h
//  Picture Dictionary
//
//  Created by Pi on 3/17/13.
//  Copyright (c) 2013 Yolaroo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataAction.h"
#import <QuartzCore/QuartzCore.h>

@class DataAction;

@interface PDViewController : UIViewController
{
    DataAction *DataAction;
}

@property (nonatomic, retain) DataAction*DataAction;

@property NSData * myData;
@property NSArray* myClassSet;
@property NSArray* myEnglishWordSet;
@property NSArray* coreLanguage;
@property NSString* myCoreLanguageName;

@property NSDictionary* myEnglishToMandarin;
@property NSDictionary* myEnglishToPinyin;

@property (strong, nonatomic) IBOutlet UIScrollView *myscrollview;

@property (strong, nonatomic) IBOutlet UISegmentedControl *mySegmentSelection;

@property (strong, nonatomic) IBOutlet UISlider *mySliderSelection;

@property (strong, nonatomic) IBOutlet UILabel *myCoreLanguageLabel;

@end

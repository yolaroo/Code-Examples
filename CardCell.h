//
//  CardCell.h
//  Picture Dictionary
//
//  Created by Pi on 6/2/13.
//  Copyright (c) 2013 Yolaroo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


@interface CardCell : UICollectionViewCell

@property (nonatomic) BOOL imageShowing;
@property (nonatomic) BOOL labelShowing;
@property (nonatomic) BOOL nameShowing;
@property (nonatomic) BOOL tapped;
@property (nonatomic) BOOL translated;


@property (strong, nonatomic) NSString* theCardWord;
@property (strong, nonatomic) NSString* thePictureWord;
@property (strong, nonatomic) NSString* theLabelWord;
@property (strong, nonatomic) NSString* theTranslatedWord;

@property (nonatomic) CGPoint theCenter;

@property (strong, nonatomic) NSNumber* theBackgroundColor;


@end

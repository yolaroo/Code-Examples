//
//  DataAction.h
//  Picture Dictionary
//
//  Created by Pi on 3/18/13.
//  Copyright (c) 2013 Yolaroo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface DataAction : NSObject


////////
//data
////////

- (NSData*) dataLoader: (NSString*)jsonFileName;
- (NSArray*) fetchedClassTypeData:(NSData *)responseData;
- (NSArray*) fetchedWordTypeData:(NSData *) responseData theClassType: (int)theClassType;
- (NSDictionary*) EnglishToMandarinData: (NSData *) responseData theClassType: (int)theClassType;
- (NSDictionary*) EnglishToPinyinData: (NSData *) responseData theClassType: (int)theClassType;

- (BOOL) checkLanguageAvailabilty: (NSString*) languageName;
- (NSArray*) fetchedLanguageData:(NSData *) responseData theClassType: (int)theClassType theLanguageType: (NSString*)insertLanguage;

////////
//view
////////

- (void) myButtonChange: (UIButton*) btn;
- (void) mySquareButtonChange: (UIButton*) btn;
- (void) buttonshadow: (UIButton*)btn;
- (void) imageshadow: (UIImageView*)img;
- (void) labelshadow: (UILabel*)lbl;
- (void) myLabelChange: (UILabel*) lbl;

////////
//extra
////////

- (NSArray*)shuffleArray:(NSArray*)array;
- (NSArray*)MutableShuffleArray:(NSMutableArray*)array;
- (NSMutableArray *)unMutableToMutable:(NSArray *)array;
- (NSArray*)stringToLetterArray:(NSString*)string;
- (NSArray*)fourChoiceArray;
- (NSArray*) numberArrayFromCount: (int) arrayCount;

- (void) SegmentedControlActionForModalStoryBoards:(UISegmentedControl *)sender mymainview:(UIViewController*)myview;

@end

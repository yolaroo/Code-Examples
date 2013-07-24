//
//  PDViewController.m
//  Picture Dictionary
//
//  Created by Pi on 3/17/13.
//  Copyright (c) 2013 Yolaroo. All rights reserved.
//

//you are making bingo!!!!!

#import "PDViewController.h"
#import "MyLongPress.h"

@interface PDViewController ()
{
    int classTypeNumber;
    Boolean menu01;
    Boolean menu02;
    BOOL soundSet;
    bool dismissing;
    
    BOOL ClickLanguageMandarin;
    BOOL ClickLanguagePinyin;
    BOOL ClickLanguageEnglish;
    
    int sliderNumber;
    
}

@property (strong, nonatomic) MyLongPressGestureRecognizer* longPressGesture;

@end

@implementation PDViewController

@synthesize DataAction = _DataAction;

- (void) myButtonStyleLoad {
   /*
    for(UIButton *btn in self.bigbuttongroup)
    {
        [self.DataAction myButtonChange:btn];
    }
    */
}

        #define IPHONE_MARGIN 10
        #define IPHONE_PADDING_LEFT 25
        #define IPHONE_BUTTON_WIDTH 100
        #define IPHONE_BUTTON_HEIGHT 66
        #define IPHONE_FONT_SIZE 12.0f
        #define IPHONE_MANDARIN_FONT_SIZE 16.0f
        #define IPAD_MARGIN 20
        #define IPAD_PADDING_LEFT 135
        #define IPAD_BUTTON_WIDTH 175
        #define IPAD_BUTTON_HEIGHT 115
        #define IPAD_FONT_SIZE 22.0f
        #define IPAD_MANDARIN_FONT_SIZE 32.0f

        #define IPHONE_MANDARIN [UIFont systemFontOfSize:IPHONE_MANDARIN_FONT_SIZE]
        #define IPHONE_PHOENIX [UIFont systemFontOfSize:IPHONE_FONT_SIZE]

        #define IPAD_MANDARIN [UIFont systemFontOfSize:IPAD_MANDARIN_FONT_SIZE]
        #define IPAD_PHOENIX [UIFont systemFontOfSize:IPAD_FONT_SIZE]

        #define PADDING_TOP 0
        #define BORDER_WIDTH 2.0f
        #define CORNER_RADIUS 10.0f

        #define BUTTON_MODULAR 4
        #define TAG_START_NUMBER 100

        #define BUTTON_ALPHA 0.6f
        #define BLUE_01 [UIColor colorWithRed:0.0f/255.0f green:0.0f/255.0f blue:150.0f/255.0f alpha:BUTTON_ALPHA]
        #define BLUE_02 [UIColor colorWithRed:0.0f/255.0f green:0.0f/255.0f blue:200.0f/255.0f alpha:BUTTON_ALPHA]
        #define BLUE_03 [UIColor colorWithRed:0.0f/255.0f green:0.0f/255.0f blue:255.0f/255.0f alpha:BUTTON_ALPHA]
        #define BLUE_04 [UIColor colorWithRed:0.0f/255.0f green:100.0f/255.0f blue:255.0f/255.0f alpha:BUTTON_ALPHA]

        #define PURPLE_01 [UIColor colorWithRed:100.0f/255.0f green:0.0f/255.0f blue:255.0f/255.0f alpha:BUTTON_ALPHA]
        #define PURPLE_02 [UIColor colorWithRed:150.0f/255.0f green:0.0f/255.0f blue:255.0f/255.0f alpha:BUTTON_ALPHA]
        #define PURPLE_03 [UIColor colorWithRed:200.0f/255.0f green:0.0f/255.0f blue:255.0f/255.0f alpha:BUTTON_ALPHA]
        #define PURPLE_04 [UIColor colorWithRed:200.0f/255.0f green:100.0f/255.0f blue:255.0f/255.0f alpha:BUTTON_ALPHA]

        #define RED_01 [UIColor colorWithRed:150.0f/255.0f green:0.0f/255.0f blue:0.0f/255.0f alpha:BUTTON_ALPHA]
        #define RED_02 [UIColor colorWithRed:200.0f/255.0f green:0.0f/255.0f blue:0.0f/255.0f alpha:BUTTON_ALPHA]
        #define RED_03 [UIColor colorWithRed:255.0f/255.0f green:.0f/255.0f blue:0.0f/255.0f alpha:BUTTON_ALPHA]
        #define RED_04 [UIColor colorWithRed:255.0f/255.0f green:100.0f/255.0f blue:0.0f/255.0f alpha:BUTTON_ALPHA]

        #define ORANGE_01 [UIColor colorWithRed:255.0f/255.0f green:100.0f/255.0f blue:0/255.0f alpha:BUTTON_ALPHA]
        #define ORANGE_02 [UIColor colorWithRed:255.0f/255.0f green:150.0f/255.0f blue:0/255.0f alpha:BUTTON_ALPHA]
        #define ORANGE_03 [UIColor colorWithRed:255.0f/255.0f green:200.0f/255.0f blue:0/255.0f alpha:BUTTON_ALPHA]
        #define ORANGE_04 [UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:0/255.0f alpha:BUTTON_ALPHA]

        #define GREEN_01 [UIColor colorWithRed:0.0f/255.0f green:150.0f/255.0f blue:0.0f/255.0f alpha:BUTTON_ALPHA]
        #define GREEN_02 [UIColor colorWithRed:0.0f/255.0f green:200.0f/255.0f blue:0.0f/255.0f alpha:BUTTON_ALPHA]
        #define GREEN_03 [UIColor colorWithRed:0.0f/255.0f green:255.0f/255.0f blue:0.0f/255.0f alpha:BUTTON_ALPHA]
        #define GREEN_04 [UIColor colorWithRed:100.0f/255.0f green:255.0f/255.0f blue:0.0f/255.0f alpha:BUTTON_ALPHA]

        #define BLACK_01 [UIColor colorWithRed:40.0f/255.0f green:40.0f/255.0f blue:40.0f/255.0f alpha:.65]

        #define isDeviceIPad UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad
        #define isDeviceIPhone UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone
        #define isDeviceIPhone5 (isDeviceIPhone && [[UIScreen mainScreen] bounds].size.height == 568.0f)

#pragma  mark - Data Load

- (void) setMyVariables {

    menu01 = true;
    classTypeNumber = 0;
    self.myData = [self.DataAction dataLoader:@"dictionarydata"];
    self.myClassSet = [self.DataAction fetchedClassTypeData:self.myData];
}

- (void) setMyEnglishWord {
    self.myEnglishWordSet = [self.DataAction fetchedWordTypeData:self.myData theClassType: classTypeNumber];
    self.myEnglishToMandarin = [self.DataAction EnglishToMandarinData: self.myData theClassType: classTypeNumber];
    self.myEnglishToPinyin = [self.DataAction EnglishToPinyinData: self.myData theClassType: classTypeNumber];
    ClickLanguageMandarin = true;
    self.myCoreLanguageName = @"english";
    
    [self setMyCoreLangauge];
}

- (void) setMyCoreLangauge{
    
    if ([self.DataAction checkLanguageAvailabilty: self.myCoreLanguageName])
    {
        self.coreLanguage = [self.DataAction fetchedLanguageData:self.myData theClassType:classTypeNumber theLanguageType:self.myCoreLanguageName];
    }
    else {
        self.coreLanguage = self.myEnglishWordSet;
    }    
}

#pragma  mark - Writer

- (void) myButtonWriter {
    
    [self removeMenu];
    UIButton* wordbuttons;
    CGRect buttonframe;

                int margin;
                int paddingtop;
                int paddingleft;
                paddingtop = PADDING_TOP;

                if(isDeviceIPhone){
                    margin = IPHONE_MARGIN;
                    paddingleft = IPHONE_PADDING_LEFT;
                    buttonframe.size.width = IPHONE_BUTTON_WIDTH;
                    buttonframe.size.height = IPHONE_BUTTON_HEIGHT;
                }
                else if (isDeviceIPad){
                    margin = IPAD_MARGIN;
                    paddingleft = IPAD_PADDING_LEFT;
                    buttonframe.size.width = IPAD_BUTTON_WIDTH;
                    buttonframe.size.height = IPAD_BUTTON_HEIGHT;
                }
                CGSize screenSize = [[UIScreen mainScreen] bounds].size;
                int totalWidth;
                totalWidth = screenSize.width;
                int wordCount;

        if (menu01){
            wordCount = [self.myClassSet count];
            self.mySliderSelection.hidden=true;
            self.mySegmentSelection.hidden=true;
            self.myCoreLanguageLabel.hidden=true;
        }
        else if (menu02){
            wordCount = [self.myEnglishWordSet count];
            self.mySliderSelection.hidden=false;
            self.mySegmentSelection.hidden=false;
            self.myCoreLanguageLabel.hidden=false;

        }
        else {
            wordCount=0;
        }
    
        int count = 0;
    
    for (int i=0; i<wordCount; i++)
    {
        buttonframe.origin.x = paddingleft +(count*(buttonframe.size.width+margin));
        buttonframe.origin.y = paddingtop;
        
        count ++;
        if (count > BUTTON_MODULAR-1)
        {
            count = 0;
            paddingtop = paddingtop + buttonframe.size.height + margin;
        }
        //add style
        wordbuttons = [UIButton buttonWithType:UIButtonTypeCustom];
        [wordbuttons setTitleShadowColor:[UIColor grayColor] forState:UIControlStateNormal];
        UIColor*colortemp;
        wordbuttons.titleLabel.shadowOffset = CGSizeMake(1, 1);
        wordbuttons.frame = buttonframe;
        wordbuttons.tag=TAG_START_NUMBER+i;
        // add function
        [wordbuttons addTarget:self action:@selector(myButtonPress:) forControlEvents:UIControlEventTouchUpInside];
        
        // add text
        if (menu01){
            [wordbuttons setTitle:[self.myClassSet objectAtIndex:i] forState:UIControlStateNormal];
            if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
            {
                wordbuttons.titleLabel.font = IPAD_PHOENIX;
            }
            else {
                wordbuttons.titleLabel.font = IPAD_MANDARIN;
            }
        }
        else if (menu02){
           [wordbuttons setTitle:[self.coreLanguage objectAtIndex:i] forState:UIControlStateNormal];
        }
                    //style
                    colortemp = [self colorSetter:i];

                    if(isDeviceIPhone){
                        if ([self.myCoreLanguageName isEqualToString:@"mandarin"])
                        {
                            wordbuttons.titleLabel.font = IPHONE_MANDARIN;
                        }
                        else {
                            wordbuttons.titleLabel.font = IPHONE_PHOENIX;
                        }
                    }
                    else if (isDeviceIPad){
                        if ([self.myCoreLanguageName isEqualToString:@"mandarin"])
                        {
                            wordbuttons.titleLabel.font = IPAD_MANDARIN;
                        }
                        else {
                            wordbuttons.titleLabel.font = IPAD_PHOENIX;
                        }
                    }
                    
                    [wordbuttons.layer setBorderColor:[colortemp CGColor]];
                    wordbuttons.backgroundColor = colortemp;
        
        // add buttons
        [self.myscrollview addSubview:wordbuttons];
        
        //gloss
        if (menu01){
            [self.DataAction myButtonChange:wordbuttons];
        }
        else if (menu02)
        {
            [self.DataAction buttonshadow:wordbuttons];
        }
    }
    
    //gobutton
    if (menu02)
    {
        buttonframe.origin.x = paddingleft +(count*(buttonframe.size.width+margin));
        buttonframe.origin.y = paddingtop;
        count ++;
        if (count > BUTTON_MODULAR-1)
        {
            count = 0;
            paddingtop = paddingtop + buttonframe.size.height + margin;
        }
                    //add style
                    if(isDeviceIPhone){
                        wordbuttons.titleLabel.font = [UIFont systemFontOfSize:IPHONE_FONT_SIZE];
                    }
                    else if (isDeviceIPad){
                        wordbuttons.titleLabel.font = [UIFont systemFontOfSize:IPAD_FONT_SIZE];
                    }
                    wordbuttons = [UIButton buttonWithType:UIButtonTypeCustom];
                    [wordbuttons setClipsToBounds:YES];
                    [[wordbuttons layer] setBorderWidth:BORDER_WIDTH];
                    [[wordbuttons layer] setCornerRadius:CORNER_RADIUS];
                    
                    [wordbuttons setTitleShadowColor:[UIColor grayColor] forState:UIControlStateNormal];
                    wordbuttons.backgroundColor = [UIColor colorWithRed:150.0f/255.0f green:150.0f/255.0f blue:150.0f/255.0f alpha:.5];
                    wordbuttons.titleLabel.shadowOffset = CGSizeMake(1, 1);
                    wordbuttons.frame = buttonframe;
                    wordbuttons.tag=TAG_START_NUMBER+wordCount;
                    
        //add text
        [wordbuttons setTitle:@"go" forState:UIControlStateNormal];
        if(isDeviceIPhone){
            wordbuttons.titleLabel.font = [UIFont systemFontOfSize:IPHONE_FONT_SIZE];
        }
        else if (isDeviceIPad){
            wordbuttons.titleLabel.font = [UIFont systemFontOfSize:IPAD_FONT_SIZE];
        }
            // add function
            [wordbuttons addTarget:self action:@selector(segueToGame) forControlEvents:UIControlEventTouchUpInside];
        
        //add button
        [self.myscrollview addSubview:wordbuttons];
    }
    
    //backbutton
    if (!menu01)
    {
        buttonframe.origin.x = paddingleft +(count*(buttonframe.size.width+margin));
        buttonframe.origin.y = paddingtop;
        count ++;
        if (count > 3)
        {
            count = 0;
            paddingtop = paddingtop + buttonframe.size.height + margin;
        }
        //add style
        wordbuttons = [UIButton buttonWithType:UIButtonTypeCustom];
        [wordbuttons setClipsToBounds:YES];
        //[wordbuttons.layer setBorderColor:[[UIColor blackColor] CGColor]];
        [[wordbuttons layer] setBorderWidth:2.0f];
        [[wordbuttons layer] setCornerRadius:10.0f];
        
        [wordbuttons setTitleShadowColor:[UIColor grayColor] forState:UIControlStateNormal];
        wordbuttons.backgroundColor = [UIColor colorWithRed:50.0f/255.0f green:50.0f/255.0f blue:50.0f/255.0f alpha:.5];
        wordbuttons.titleLabel.shadowOffset = CGSizeMake(1, 1);
        wordbuttons.frame = buttonframe;
        wordbuttons.tag=100+wordCount+1;
        
        //add text
        [wordbuttons setTitle:@"←" forState:UIControlStateNormal];
        
        if(isDeviceIPhone){
            wordbuttons.titleLabel.font = [UIFont systemFontOfSize:18.0];
        }
        else if (isDeviceIPad){
            wordbuttons.titleLabel.font = [UIFont systemFontOfSize:30.0];
        }
        
        // add function
        [wordbuttons addTarget:self action:@selector(myBackButtonPress:) forControlEvents:UIControlEventTouchUpInside];
        
        //add button
        [self.myscrollview addSubview:wordbuttons];
    }
    
    double myScrollOffset;
    if (isDeviceIPhone) {
        int totalpagesize = ( BUTTON_MODULAR + (wordCount / BUTTON_MODULAR) ) * (buttonframe.size.height + margin);
        myScrollOffset =  totalpagesize / self.myscrollview.frame.size.height ;
    }
    else {
        int totalpagesize = (( .3*BUTTON_MODULAR + wordCount / BUTTON_MODULAR) ) * (buttonframe.size.height + margin);
        myScrollOffset =  totalpagesize / self.myscrollview.frame.size.height ;

    }
    
    // set scroll
    self.myscrollview.contentSize = CGSizeMake(self.myscrollview.frame.size.width, (self.myscrollview.frame.size.height * myScrollOffset));
    [self.myscrollview setContentOffset:CGPointMake(0,0) animated:YES];
}

- (UIColor*) colorSetter: (int)myInt {
    UIColor*colortemp;
    NSArray* colorArray = [NSArray arrayWithObjects: (id)BLUE_01, (id)BLUE_02, (id)BLUE_03, (id)BLUE_04, (id)PURPLE_01,(id)PURPLE_02,(id)PURPLE_03,(id)PURPLE_04,(id)RED_01,(id)RED_02,(id)RED_03,(id)RED_04,(id)ORANGE_01,(id)ORANGE_02,(id)ORANGE_03,(id)ORANGE_04,(id)GREEN_01,(id)GREEN_02,(id)GREEN_03,(id)GREEN_04, nil];
    if (myInt >= [colorArray count]) myInt = myInt % [colorArray count];
    colortemp = [colorArray objectAtIndex:myInt];
    return colortemp;
}

#pragma  mark - Actions

- (IBAction) mySliderOptionsPress:(UISlider *)sender {
    self.mySliderSelection.continuous = NO;
    NSUInteger index = self.mySliderSelection.value;
    NSString* languageName;
    [self.mySliderSelection setValue:index animated:NO];

    if (sliderNumber != index)
    {
        if (index == 0)
        {
            languageName = @"English";
            self.myCoreLanguageName = @"english";
            self.myCoreLanguageLabel.text = languageName;
            [self setMyCoreLangauge];
            if(menu02)
            {
                [self reWriteButtons];
            }
            sliderNumber = 0;
        }
        else if (index == 1)
        {
            languageName = @"中文";
            self.myCoreLanguageName = @"mandarin";
            self.myCoreLanguageLabel.text = languageName;
            [self setMyCoreLangauge];
            if(menu02)
            {
                [self reWriteButtons];
            }
            sliderNumber = 1;
        }
        else if (index == 2)
        {
            languageName = @"Pīnyīn";
            self.myCoreLanguageName = @"pinyin";
            self.myCoreLanguageLabel.text = languageName;
            [self setMyCoreLangauge];
            if(menu02)
            {
                [self reWriteButtons];
            }
            sliderNumber = 2;
        }
    }
}

- (IBAction) mySegmentedOptionsPress:(UISegmentedControl *)sender {
    if (self.mySegmentSelection.selectedSegmentIndex == 0)
    {
        ClickLanguageMandarin = true;
        ClickLanguagePinyin = false;
        ClickLanguageEnglish = false;
    }
    else if (self.mySegmentSelection.selectedSegmentIndex == 1)
    {
        ClickLanguagePinyin = true;
        ClickLanguageMandarin = false;
        ClickLanguageEnglish = false;
    }
    else {
        ClickLanguageEnglish = true;
        ClickLanguagePinyin = false;
        ClickLanguageMandarin = false;
    }
}

#pragma  mark - Font

- (void) reWriteButtons {
    UIButton* mybutton;
    for (int i = 0; i < [self.myEnglishWordSet count]; i++)
    {
        mybutton = (UIButton *)[self.view viewWithTag:TAG_START_NUMBER +i];
        mybutton.backgroundColor = [self colorSetter:i];
        
        if(isDeviceIPhone) {
            if ([self.myCoreLanguageName isEqualToString:@"mandarin"]) {
                mybutton.titleLabel.font = IPHONE_MANDARIN;
            }
            else {
                mybutton.titleLabel.font = IPHONE_PHOENIX;
            }
        }
        else if (isDeviceIPad) {
            if ([self.myCoreLanguageName isEqualToString:@"mandarin"]) {
                mybutton.titleLabel.font = IPAD_MANDARIN;
            }
            else {
                mybutton.titleLabel.font = IPAD_PHOENIX;
            }
        }
        
        [UIView transitionWithView:mybutton
                          duration:2
                           options:UIViewAnimationOptionTransitionCurlDown
                        animations:^{
                            [mybutton setTitle:[self.coreLanguage objectAtIndex:i] forState:UIControlStateNormal];
                        }
                        completion:NULL];
    }
}

- (void) fontSizeSetter: (UIButton*)mybutton {
    if (isDeviceIPhone) {
        if (ClickLanguageMandarin) {
            mybutton.titleLabel.font = IPHONE_MANDARIN;
        }
        else if (ClickLanguagePinyin) {
            mybutton.titleLabel.font = IPHONE_PHOENIX;
        }
        else if (ClickLanguageEnglish) {
            mybutton.titleLabel.font = IPHONE_PHOENIX;
        }
        else {
            if ([self.myCoreLanguageName isEqualToString:@"mandarin"]) {
                mybutton.titleLabel.font = IPHONE_MANDARIN;
            }
            else {
                mybutton.titleLabel.font = IPHONE_PHOENIX;
            }
        }
    }
    else {
        if (ClickLanguageMandarin) {
            mybutton.titleLabel.font = IPAD_MANDARIN;
        }
        else if (ClickLanguagePinyin) {
            mybutton.titleLabel.font = IPAD_PHOENIX;
        }
        else if (ClickLanguageEnglish) {
            mybutton.titleLabel.font = IPAD_PHOENIX;
        }
        else {
            if ([self.myCoreLanguageName isEqualToString:@"mandarin"]) {
                mybutton.titleLabel.font = IPAD_MANDARIN;
            }
            else {
                mybutton.titleLabel.font = IPAD_PHOENIX;
            }
        }
    }
}

#pragma  mark - Menu Button Press

- (void) myButtonPress: (id)sender {
    UIButton *mybutton = (UIButton*)sender;
    int myint;

    if (menu01) {
        myint = mybutton.tag - TAG_START_NUMBER;
        classTypeNumber = myint;
        [self setMyEnglishWord];
        [self removeMenu];
        [self performSelector:@selector(myButtonWriter) withObject:nil afterDelay:.3];
        menu01 = false;
        menu02 = true;
    }
    else if (menu02) {        
        myint = mybutton.tag - TAG_START_NUMBER;        
        NSString* mycurrentstring = mybutton.currentTitle;
        NSString* temp;
        if ([mycurrentstring isEqualToString:[self.coreLanguage objectAtIndex:myint]]) {
            if (ClickLanguageMandarin) {
                temp = [self.myEnglishToMandarin objectForKey:[self.myEnglishWordSet objectAtIndex:myint]];
                [self fontSizeSetter:mybutton ];
            }
            else if (ClickLanguagePinyin) {
                temp = [self.myEnglishToPinyin objectForKey:[self.myEnglishWordSet objectAtIndex:myint]];
                [self fontSizeSetter:mybutton ];
            }
            else if (ClickLanguageEnglish) {
                temp = [self.myEnglishWordSet objectAtIndex:myint];
                [self fontSizeSetter:mybutton ];
            }
            else {
                temp = [self.myEnglishWordSet objectAtIndex:myint];
                if ([self.myCoreLanguageName isEqualToString:@"mandarin"]) {
                    [self fontSizeSetter:mybutton ];
                }
                else {
                    [self fontSizeSetter:mybutton ];
                }
            }
        }
        else {
            temp = [self.coreLanguage objectAtIndex:myint];
            
            if (isDeviceIPhone) {
                if ([self.myCoreLanguageName isEqualToString:@"mandarin"]) {
                    mybutton.titleLabel.font = IPHONE_MANDARIN;
                }
                else {
                mybutton.titleLabel.font = IPHONE_PHOENIX;
                }
            }
            else {
                if ([self.myCoreLanguageName isEqualToString:@"mandarin"]) {
                    mybutton.titleLabel.font = IPAD_MANDARIN;
                }
                else {
                    mybutton.titleLabel.font = IPAD_PHOENIX;
                }
            }
        }
        
        [UIView transitionWithView:mybutton
                            duration:0.5
                            options:UIViewAnimationOptionTransitionCurlUp
                            animations:^ {
                            [mybutton setTitle:temp forState:UIControlStateNormal];
                                if ([mybutton.backgroundColor isEqual:BLACK_01]) {
                                    mybutton.backgroundColor = [self colorSetter:myint];
                                }
                                else {
                                  mybutton.backgroundColor = BLACK_01;  
                                }                                
                            }
                            completion:NULL];

        if (!soundSet)
        {
            //[self.DataAction soundActionWord:[self.wordsetmenu objectAtIndex:myint]];
        }
    }
}

- (void) myBackButtonPress: (id)sender {
    if (menu01) {
    }
    else if (menu02){
        menu01 = true;
        menu02 = false;
    }
    [self removeMenu];
    [self performSelector:@selector(myButtonWriter) withObject:nil afterDelay:.3];
}

#pragma  mark - Long Press

- (void) setLongPressGesture:(MyLongPressGestureRecognizer *)longPressGesture {
    _longPressGesture = longPressGesture;
}

- (void)longPressHandler:(MyLongPressGestureRecognizer *)recognizer {
    if (menu01 && !dismissing) {
        if (self.longPressGesture.touchView.tag >= TAG_START_NUMBER) {
            dismissing = true;
            classTypeNumber = self.longPressGesture.touchView.tag - TAG_START_NUMBER;
            [self segueToGame];
        }
    }
    else if (menu02) {
        menu01 = true;
        menu02 = false;
        [self removeMenu];
        [self performSelector:@selector(myButtonWriter) withObject:nil afterDelay:.3];
    }
}

- (void) removeMenu {
    for(UIView *subview in [self.myscrollview subviews])
    {
        if([subview isKindOfClass:[UIButton class]])
        {
            if (subview.tag >=TAG_START_NUMBER)
            {
                [subview removeFromSuperview];
            }
        }
        else
        {}
    }
}

#pragma mark - Swipe Load

- (void) swipeLoad
{
    UISwipeGestureRecognizer *oneFingerSwipeRight =
    [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(oneFingerSwipeRight:)];
    [oneFingerSwipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [[self view] addGestureRecognizer:oneFingerSwipeRight];
    
    UISwipeGestureRecognizer *oneFingerSwipeLeft =
    [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(oneFingerSwipeLeft:)];
    [oneFingerSwipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [[self view] addGestureRecognizer:oneFingerSwipeLeft];
}

#pragma mark - Swipe

- (void) oneFingerSwipeRight:(UISwipeGestureRecognizer *)recognizer {
    if (menu02) {
        [self goToPreviousWordType];
    }
}

- (void) oneFingerSwipeLeft:(UISwipeGestureRecognizer *)recognizer {
    if (menu02) {
        [self goToNextWordType];
    }
}

- (void) goToPreviousWordType {
    classTypeNumber -- ;
    if (classTypeNumber < 0) {
        classTypeNumber = [self.myClassSet count]-1;
    }
    //NSLog(@"%d",classTypeNumber);
    [self performSelector:@selector(loadForSwipe) withObject:nil afterDelay:.3];
}

- (void) goToNextWordType {
    classTypeNumber ++ ;
    if (classTypeNumber >= [self.myClassSet count]) {
        classTypeNumber = 0;
    }
    //NSLog(@"%d",self.classTypeNumber);
    [self performSelector:@selector(loadForSwipe) withObject:nil afterDelay:.3];
}

- (void) loadForSwipe {
    self.myEnglishWordSet = [self.DataAction fetchedWordTypeData:self.myData theClassType: classTypeNumber];
    self.myEnglishToMandarin = [self.DataAction EnglishToMandarinData: self.myData theClassType: classTypeNumber];
    self.myEnglishToPinyin = [self.DataAction EnglishToPinyinData: self.myData theClassType: classTypeNumber];
    [self setMyCoreLangauge];
    [self removeMenu];
    [self performSelector:@selector(myButtonWriter) withObject:nil afterDelay:.3];
}

#pragma  mark - Seque

- (IBAction) dismissViewPress:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) segueToGame {
    [self saveClassDefaults];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma  mark - Save Defaults

- (void) saveClassDefaults {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:classTypeNumber forKey:@"classType"];
    [defaults synchronize];
}

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //init
    self.DataAction = [[DataAction alloc] init];
    
    [self swipeLoad];
    
    [self setMyVariables];
    
    [self myButtonWriter];
    
    self.longPressGesture =[[MyLongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressHandler:)];
    self.longPressGesture.minimumPressDuration = 1.2;
    [[self view] addGestureRecognizer:self.longPressGesture];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self myButtonStyleLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

//
//  DataAction.m
//  Picture Dictionary
//
//  Created by Pi on 3/18/13.
//  Copyright (c) 2013 Yolaroo. All rights reserved.
//

#import "DataAction.h"

@implementation DataAction

////////////
// data
////////////
#define isDeviceIPad UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad
#define isDeviceIPhone UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone
#define isDeviceIPhone5 (isDeviceIPhone && [[UIScreen mainScreen] bounds].size.height == 568.0f)


-(NSData*) dataLoader: (NSString*)jsonFileName
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource: jsonFileName ofType:@"txt"];
    NSData *myData = [NSData dataWithContentsOfFile:filePath];
    return myData;
}

//class
- (NSArray*) fetchedClassTypeData:(NSData *)responseData
{
    NSError* error;
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:responseData
                                                         options:kNilOptions
                                                           error:&error];
    
    NSArray* classArray = [json objectForKey:@"dictionary"]; //1st level count
    int classArrayCount = [classArray count];

    NSString*classByType;
    NSMutableArray *temparray = [NSMutableArray arrayWithCapacity:classArrayCount];
    for(int i=0;i<classArrayCount;i++)
    {
        classByType = [[[
            json objectForKey:@"dictionary"]
            objectAtIndex:i]
            objectForKey:@"type"];
        [temparray addObject:classByType];
    }
    return [NSArray arrayWithArray:temparray];
}

//english word
- (NSArray*) fetchedWordTypeData:(NSData *) responseData theClassType: (int)theClassType
{
    NSError* error;
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:responseData
                                                         options:kNilOptions
                                                           error:&error];
    
    NSArray* classArray = [json objectForKey:@"dictionary"]; //1st level count
    NSDictionary* classDictionary = [classArray objectAtIndex:theClassType];
    NSArray *wordArray = [classDictionary objectForKey:@"list"]; //2nd level count   
    int wordArrayCount = [wordArray count];

    NSString*theWord;
    NSMutableArray *temparray = [NSMutableArray arrayWithCapacity:wordArrayCount];
    for(int i=0;i<wordArrayCount;i++)
    {
        theWord = [[[[[
            json objectForKey:@"dictionary"]
            objectAtIndex:theClassType]
            objectForKey:@"list"]
            objectAtIndex:i]
            objectForKey: @"root"];
        
        [temparray addObject:theWord];
    }
    return [NSArray arrayWithArray:temparray];
}

- (BOOL) checkLanguageAvailabilty: (NSString*) languageName
{
    NSArray*languageArray;
    languageArray = [NSArray arrayWithObjects:@"mandarin",@"pinyin", nil];
    
    if ([languageArray containsObject: languageName]) {
        return TRUE;
    }
    else {
        return false;
    }
}

- (NSArray*) fetchedLanguageData:(NSData *) responseData theClassType: (int)theClassType theLanguageType: (NSString*)insertLanguage
{
    NSError* error;
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:responseData
                                                         options:kNilOptions
                                                           error:&error];
    
    NSArray* classArray = [json objectForKey:@"dictionary"]; //1st level count
    NSDictionary* classDictionary = [classArray objectAtIndex:theClassType];
    NSArray *wordArray = [classDictionary objectForKey:@"list"]; //2nd level count
    int wordArrayCount = [wordArray count];
    
    NSString*theWord;
    NSMutableArray *temparray = [NSMutableArray arrayWithCapacity:wordArrayCount];
    for(int i=0;i<wordArrayCount;i++)
    {
        theWord = [[[[[[[
            json objectForKey:@"dictionary"]
            objectAtIndex:theClassType]
            objectForKey:@"list"]
            objectAtIndex:i]
            objectForKey: @"languages"]
            objectAtIndex:0]
            objectForKey:insertLanguage];
        
        [temparray addObject:theWord];
    }
    return [NSArray arrayWithArray:temparray];
}

- (NSDictionary*) EnglishToMandarinData: (NSData *) responseData theClassType: (int)theClassType
{
    NSError* error;
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:responseData
                                                         options:kNilOptions
                                                           error:&error];
    
    NSArray* classArray = [json objectForKey:@"dictionary"]; //1st level count
    NSDictionary* classDictionary = [classArray objectAtIndex:theClassType];
    NSArray *wordArray = [classDictionary objectForKey:@"list"]; //2nd level count
    int wordArrayCount = [wordArray count];
    
    NSString*theWord;
    NSString*theMandarinWord;
    NSMutableArray *temparray01 = [NSMutableArray arrayWithCapacity:wordArrayCount];
    NSMutableArray *temparray02 = [NSMutableArray arrayWithCapacity:wordArrayCount];

    NSMutableDictionary *myDictionary = [[NSMutableDictionary alloc] init];

    for(int i=0;i<wordArrayCount;i++)
    {
        theWord = [[[[[
            json objectForKey:@"dictionary"]
            objectAtIndex:theClassType]
            objectForKey:@"list"]
            objectAtIndex:i]
            objectForKey: @"root"];
        
        theMandarinWord = [[[[[[[
            json objectForKey:@"dictionary"]
            objectAtIndex:theClassType]
            objectForKey:@"list"]
            objectAtIndex:i]
            objectForKey: @"languages"]
            objectAtIndex:0]
            objectForKey:@"mandarin"];
        
        [temparray01 addObject:theWord];
        [temparray02 addObject:theMandarinWord];

        [myDictionary setObject:theMandarinWord forKey:theWord];

    }

    return [NSDictionary dictionaryWithDictionary: myDictionary];
}

- (NSDictionary*) EnglishToPinyinData: (NSData *) responseData theClassType: (int)theClassType
{
    NSError* error;
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:responseData
                                                         options:kNilOptions
                                                           error:&error];
    
    NSArray* classArray = [json objectForKey:@"dictionary"]; //1st level count
    NSDictionary* classDictionary = [classArray objectAtIndex:theClassType];
    NSArray *wordArray = [classDictionary objectForKey:@"list"]; //2nd level count
    int wordArrayCount = [wordArray count];
    
    NSString*theWord;
    NSString*thePinyinWord;
    NSMutableArray *temparray01 = [NSMutableArray arrayWithCapacity:wordArrayCount];
    NSMutableArray *temparray02 = [NSMutableArray arrayWithCapacity:wordArrayCount];
    
    NSMutableDictionary *myDictionary = [[NSMutableDictionary alloc] init];
    
    for(int i=0;i<wordArrayCount;i++)
    {
        theWord = [[[[[
            json objectForKey:@"dictionary"]
            objectAtIndex:theClassType]
            objectForKey:@"list"]
            objectAtIndex:i]
            objectForKey: @"root"];
        
        thePinyinWord = [[[[[[[
            json objectForKey:@"dictionary"]
            objectAtIndex:theClassType]
            objectForKey:@"list"]
            objectAtIndex:i]
            objectForKey: @"languages"]
            objectAtIndex:0]
            objectForKey:@"pinyin"];
        
        [temparray01 addObject:theWord];
        [temparray02 addObject:thePinyinWord];
        
        [myDictionary setObject:thePinyinWord forKey:theWord];
        
    }
    
    return [NSDictionary dictionaryWithDictionary: myDictionary];
}


////////////
// view
////////////

- (void) myButtonChange: (UIButton*) btn
{
    [btn setTitleColor:[UIColor colorWithRed:100.0f/255.0f green:200.0f/255.0f blue:255.0f/255.0f alpha:.6f] forState:UIControlStateHighlighted];
    
    CAGradientLayer *btnGradient = [CAGradientLayer layer];
    btnGradient.frame = btn.bounds;
    btnGradient.colors = [NSArray arrayWithObjects:
                          (id)[[UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:.6f] CGColor],
                          (id)[[UIColor colorWithRed:200.0f/255.0f green:200.0f/255.0f blue:200.0f/255.0f alpha:.4f] CGColor],
                          (id)[[UIColor colorWithRed:150.0f/255.0f green:150.0f/255.0f blue:150.0f/255.0f alpha:.4f] CGColor],
                          (id)[[UIColor colorWithRed:100.0f/255.0f green:100.0f/255.0f blue:100.0f/255.0f alpha:.4f] CGColor],
                          (id)[[UIColor colorWithRed:50.0f/255.0f green:50.0f/255.0f blue:50.0f/255.0f alpha:.4f] CGColor],
                          (id)[[UIColor colorWithRed:5.0f/255.0f green:5.0f/255.0f blue:5.0f/255.0f alpha:.4f] CGColor],
                          
                          nil];
    [btn.layer insertSublayer:btnGradient atIndex:0];
    
    CAGradientLayer *glossLayer = [CAGradientLayer layer];
    glossLayer.frame = btn.bounds;
    glossLayer.colors = [NSArray arrayWithObjects:
                         (id)[UIColor colorWithWhite:1.0f alpha:0.4f].CGColor,
                         (id)[UIColor colorWithWhite:1.0f alpha:0.1f].CGColor,
                         (id)[UIColor colorWithWhite:0.75f alpha:0.0f].CGColor,
                         (id)[UIColor colorWithWhite:1.0f alpha:0.1f].CGColor,
                         nil];
    glossLayer.locations = [NSArray arrayWithObjects:
                            [NSNumber numberWithFloat:0.0f],
                            [NSNumber numberWithFloat:0.5f],
                            [NSNumber numberWithFloat:0.5f],
                            [NSNumber numberWithFloat:1.0f],
                            nil];
    [btn.layer insertSublayer:glossLayer atIndex:0];
    
    CALayer *btnLayer = [btn layer];
    [btnLayer setMasksToBounds:YES];
    
    UIColor*mycolor = btn.backgroundColor;
    [btn.layer setBorderColor:[mycolor CGColor]];
    [[btn layer] setBorderWidth:2.0f];
    [[btn layer] setCornerRadius:10.0f];
}



- (void) mySquareButtonChange: (UIButton*) btn
{
    [btn setTitleColor:[UIColor colorWithRed:100.0f/255.0f green:200.0f/255.0f blue:255.0f/255.0f alpha:.6f] forState:UIControlStateHighlighted];
    
    CAGradientLayer *btnGradient = [CAGradientLayer layer];
    btnGradient.frame = btn.bounds;
    btnGradient.colors = [NSArray arrayWithObjects:
                          (id)[[UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:.6f] CGColor],
                          (id)[[UIColor colorWithRed:200.0f/255.0f green:200.0f/255.0f blue:200.0f/255.0f alpha:.4f] CGColor],
                          (id)[[UIColor colorWithRed:150.0f/255.0f green:150.0f/255.0f blue:150.0f/255.0f alpha:.4f] CGColor],
                          (id)[[UIColor colorWithRed:100.0f/255.0f green:100.0f/255.0f blue:100.0f/255.0f alpha:.4f] CGColor],
                          (id)[[UIColor colorWithRed:50.0f/255.0f green:50.0f/255.0f blue:50.0f/255.0f alpha:.4f] CGColor],
                          (id)[[UIColor colorWithRed:5.0f/255.0f green:5.0f/255.0f blue:5.0f/255.0f alpha:.4f] CGColor],
                          
                          nil];
    [btn.layer insertSublayer:btnGradient atIndex:0];
    
    CAGradientLayer *glossLayer = [CAGradientLayer layer];
    glossLayer.frame = btn.bounds;
    glossLayer.colors = [NSArray arrayWithObjects:
                         (id)[UIColor colorWithWhite:1.0f alpha:0.4f].CGColor,
                         (id)[UIColor colorWithWhite:1.0f alpha:0.1f].CGColor,
                         (id)[UIColor colorWithWhite:0.75f alpha:0.0f].CGColor,
                         (id)[UIColor colorWithWhite:1.0f alpha:0.1f].CGColor,
                         nil];
    glossLayer.locations = [NSArray arrayWithObjects:
                            [NSNumber numberWithFloat:0.0f],
                            [NSNumber numberWithFloat:0.5f],
                            [NSNumber numberWithFloat:0.5f],
                            [NSNumber numberWithFloat:1.0f],
                            nil];
    [btn.layer insertSublayer:glossLayer atIndex:0];
    
    //CALayer *btnLayer = [btn layer];
    //[btnLayer setMasksToBounds:YES];
    //[btnLayer setCornerRadius:10.0f];
    
    //[btnLayer setBorderColor:[[UIColor lightGrayColor] CGColor]];
}

- (void) buttonshadow: (UIButton*)btn {
    [[btn layer] setCornerRadius:10.0f];
    btn.layer.borderWidth = 1.0f;
    
    btn.layer.shadowOpacity = 1;
    btn.layer.shadowRadius = 3;
    btn.layer.shadowOffset = CGSizeMake(3.0f, 3.0f);
    
    btn.layer.shadowColor = [[UIColor colorWithRed:5.0f/255.0f green:5.0f/255.0f blue:5.0f/255.0f alpha:.8f] CGColor];
    //btn.layer.shadowColor = [UIColor greenColor].CGColor;
}

- (void) imageshadow: (UIImageView*)img {
    [[img layer] setCornerRadius:10.0f];
    img.layer.borderWidth = 1.0f;
    img.layer.shadowOpacity = 1;
    img.layer.shadowRadius = 3;
    img.layer.shadowOffset = CGSizeMake(3.0f, 3.0f);
    
    img.layer.shadowColor = [[UIColor colorWithRed:5.0f/255.0f green:5.0f/255.0f blue:5.0f/255.0f alpha:.8f] CGColor];
    //btn.layer.shadowColor = [UIColor greenColor].CGColor;
}

- (void) labelshadow: (UILabel*)lbl {
    [[lbl layer] setCornerRadius:10.0f];
    lbl.layer.borderWidth = 1.0f;
    //lbl.clipsToBounds = NO;
    lbl.layer.borderColor = [[UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:.4f] CGColor];
    
    lbl.layer.shadowOpacity = 1;
    lbl.layer.shadowRadius = 3;
    lbl.layer.shadowOffset = CGSizeMake(3.0f, 3.0f);
    
    lbl.layer.shadowColor = [[UIColor colorWithRed:5.0f/255.0f green:5.0f/255.0f blue:5.0f/255.0f alpha:1.0f] CGColor];
    //lbl.layer.shadowColor = [UIColor greenColor].CGColor;
}

- (void) myLabelChange: (UILabel*) lbl {
    
    CAGradientLayer *lblBradient = [CAGradientLayer layer];
    lblBradient.frame = lbl.bounds;
    lblBradient.colors = [NSArray arrayWithObjects:
                          (id)[[UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:.6f] CGColor],
                          (id)[[UIColor colorWithRed:200.0f/255.0f green:200.0f/255.0f blue:200.0f/255.0f alpha:.2f] CGColor],
                          (id)[[UIColor colorWithRed:150.0f/255.0f green:150.0f/255.0f blue:150.0f/255.0f alpha:.2f] CGColor],
                          (id)[[UIColor colorWithRed:100.0f/255.0f green:100.0f/255.0f blue:100.0f/255.0f alpha:.2f] CGColor],
                          (id)[[UIColor colorWithRed:50.0f/255.0f green:50.0f/255.0f blue:50.0f/255.0f alpha:.2f] CGColor],
                          (id)[[UIColor colorWithRed:5.0f/255.0f green:5.0f/255.0f blue:5.0f/255.0f alpha:.2f] CGColor],
                          nil];
    
    [lbl.layer insertSublayer:lblBradient atIndex:0];
    
    CAGradientLayer *glossLayer = [CAGradientLayer layer];
    glossLayer.frame = lbl.bounds;
    glossLayer.colors = [NSArray arrayWithObjects:
                         (id)[UIColor colorWithWhite:1.0f alpha:0.4f].CGColor,
                         (id)[UIColor colorWithWhite:1.0f alpha:0.1f].CGColor,
                         (id)[UIColor colorWithWhite:0.75f alpha:0.0f].CGColor,
                         (id)[UIColor colorWithWhite:1.0f alpha:0.1f].CGColor,
                         nil];
    
    glossLayer.locations = [NSArray arrayWithObjects:
                            [NSNumber numberWithFloat:0.0f],
                            [NSNumber numberWithFloat:0.5f],
                            [NSNumber numberWithFloat:0.5f],
                            [NSNumber numberWithFloat:1.0f],
                            nil];
    
    [lbl.layer insertSublayer:glossLayer atIndex:0];
    
    UIColor*mycolor = lbl.backgroundColor;
    [lbl.layer setBorderColor:[mycolor CGColor]];
    [[lbl layer] setBorderWidth:1.0f];
}

//////////
//extra
//////////

//randomizer
- (NSArray*) shuffleArray:(NSArray*)array
{
    NSMutableArray *temp = [[NSMutableArray alloc] initWithArray:array];
    for(NSUInteger i = [array count]; i > 1; i--) {
        NSUInteger j = arc4random_uniform(i);
        [temp exchangeObjectAtIndex:i-1 withObjectAtIndex:j];
    }
    return [NSArray arrayWithArray:temp];
}

//randomizer
- (NSArray*) MutableShuffleArray:(NSMutableArray*)array
{
    NSMutableArray *temp = [[NSMutableArray alloc] initWithArray:array];
    for(NSUInteger i = [array count]; i > 1; i--) {
        NSUInteger j = arc4random_uniform(i);
        [temp exchangeObjectAtIndex:i-1 withObjectAtIndex:j];
    }
    return [NSArray arrayWithArray:temp];
}

//array quality switcher
- (NSMutableArray *) unMutableToMutable:(NSArray *)array
{
    return [NSMutableArray arrayWithArray:array];
}

//string to letter
- (NSArray*) stringToLetterArray:(NSString*)string
{
    NSUInteger characterCount = [string length];
    NSMutableArray *temparray = [NSMutableArray arrayWithCapacity:[string length]];
    for (int i = 0; i<characterCount; i++)
    {
        [temparray addObject:[string substringWithRange:NSMakeRange (i,1)]];
    }
    return [temparray copy];
}

//four choice
- (NSArray*) fourChoiceArray
{
    NSArray*temparray;
    temparray = [NSArray arrayWithObjects:@"0",@"1",@"2",@"3",nil];
    return [self shuffleArray: temparray];
}

//number array from count
- (NSArray*) numberArrayFromCount: (int) arrayCount
{
    NSMutableArray*numberArray =[NSMutableArray arrayWithCapacity:arrayCount];
    for (int i = 0; i < arrayCount; i++)
    {
        [numberArray addObject:[NSNumber numberWithInt:i]];
    }
    return [numberArray copy];
}

#pragma mark - GAME

- (void) SegmentedControlActionForModalStoryBoards:(UISegmentedControl *)sender mymainview:(UIViewController*)myview
{
    UIStoryboard *storyboard;
    if (isDeviceIPhone) {
        storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    }
    else {
        storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPad" bundle:nil];
    }
    //mysegmentedControl = sender;
    if (sender.selectedSegmentIndex == 0)
    {
        UIViewController *myVC = (UIViewController *)[storyboard instantiateViewControllerWithIdentifier:@"OptionMenu"];
        if (myVC != NULL)
        {
            [myview presentViewController:myVC animated:YES completion:nil];
        }
    }
    else if (sender.selectedSegmentIndex == 1)
    {
        
        UIViewController *myVC = (UIViewController *)[storyboard instantiateViewControllerWithIdentifier:@"WordMenu"];
        if (myVC != NULL)
        {
            [myview presentViewController:myVC animated:YES completion:nil];
        }
    }
}




@end

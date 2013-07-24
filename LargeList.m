//
//  LargeList.m
//  Picture Dictionary
//
//  Created by Pi on 6/2/13.
//  Copyright (c) 2013 Yolaroo. All rights reserved.
//

#import "LargeList.h"
#import "CardCell.h"
#import "CardObject.h"

@interface LargeList () <UICollectionViewDataSource,UICollectionViewDelegate>
{
    int rownumber;
}
@property (strong, nonatomic) IBOutlet UICollectionView *myCollectionView;

@property (strong, nonatomic) IBOutlet CardObject *CorrectPictureCard;


@end

@implementation LargeList

#define isDeviceIPad UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad
#define isDeviceIPhone UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone
#define isDeviceIPhone5 (isDeviceIPhone && [[UIScreen mainScreen] bounds].size.height == 568.0f)
#define BLACK_01 20

#pragma mark - Tap Cell

-(void) loadTap
{
    UITapGestureRecognizer *cellTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cellTap:)];
    [cellTap setNumberOfTapsRequired:1];
    [self.myCollectionView addGestureRecognizer:cellTap];
}

- (IBAction)cellTap:(UISwipeGestureRecognizer *)gesture
{
    CGPoint taplocation = [gesture locationInView:self.myCollectionView];
    NSIndexPath *indexPath = [self.myCollectionView indexPathForItemAtPoint:taplocation];
    if (indexPath) {
        CardCell * aCell = (CardCell *)[self collectionView:self.myCollectionView cellForItemAtIndexPath:indexPath];
        NSString*mystring;
        rownumber = indexPath.row;
        mystring = aCell.thePictureWord;
        
        self.CorrectPictureCard.theLabelWord = aCell.theLabelWord;
        self.CorrectPictureCard.theCardWord = aCell.theCardWord;
        self.CorrectPictureCard.thePictureWord = aCell.thePictureWord;
        self.CorrectPictureCard.theTranslatedWord = aCell.theTranslatedWord;

        [UIView transitionWithView:self.CorrectPictureCard
                          duration:1
                           options:UIViewAnimationOptionTransitionCrossDissolve
                        animations:^{
                            self.CorrectPictureCard.hidden = false;
                        }
                        completion:NULL];

        //NSLog(@"%@",mystring);
    }
}

#pragma mark - Card Data

- (void) setCorrectPictureCard:(CardObject *)CorrectPictureCard {
    _CorrectPictureCard = CorrectPictureCard;
    CorrectPictureCard.theBackgroundColor = [NSNumber numberWithInteger: BLACK_01];
    CorrectPictureCard.imageShowing = true;
    CorrectPictureCard.labelShowing = true;
}

#pragma mark - Correct Card Gesture

- (IBAction)correctCardTap:(UITapGestureRecognizer *)sender {
    [UIView transitionWithView:self.CorrectPictureCard
                      duration:1
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        self.CorrectPictureCard.hidden = true;
                    }
                    completion:NULL];
}

- (IBAction)correctCardDownSwipe:(UISwipeGestureRecognizer *)sender {
    self.CorrectPictureCard.translated = !self.CorrectPictureCard.translated;
}

- (IBAction)correctCardNextSwipe:(UISwipeGestureRecognizer *)sender {
    rownumber++;
    
    if (rownumber >= [self.myEnglishWordSet count]) {
        rownumber = 0;
    }
    [UIView transitionWithView:self.CorrectPictureCard
                      duration:1
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{
                        [self correctCardWrite];
                    }
                    completion:NULL];
}

- (IBAction)correctCardPreviousSwipe:(UISwipeGestureRecognizer *)sender {
    rownumber--;
    if (rownumber < 0) {
        rownumber = [self.myEnglishWordSet count]-1;
    }
    [UIView transitionWithView:self.CorrectPictureCard
                      duration:1
                       options:UIViewAnimationOptionTransitionFlipFromRight
                    animations:^{
                        [self correctCardWrite];
                    }
                    completion:NULL];}

- (void) correctCardWrite {
    self.CorrectPictureCard.hidden = false;
    self.CorrectPictureCard.theLabelWord = [self.secondLanguage objectAtIndex:rownumber];
    self.CorrectPictureCard.theCardWord = [self.coreLanguage objectAtIndex:rownumber];
    self.CorrectPictureCard.thePictureWord = [self.myEnglishWordSet objectAtIndex:rownumber];
    self.CorrectPictureCard.theTranslatedWord = [self.translatedLanguage objectAtIndex:rownumber];
}

#pragma mark - Swipe

- (void) oneFingerSwipeRight:(UISwipeGestureRecognizer *)recognizer {
}

- (void) oneFingerSwipeLeft:(UISwipeGestureRecognizer *)recognizer {
}

- (void) goToPreviousWordType {
    self.classTypeNumber -- ;
    if (self.classTypeNumber < 0) {
        self.classTypeNumber = [self.myClassSet count]-1;
    }
    [self performSelector:@selector(loadForSwipe) withObject:nil afterDelay:.3];
}

- (void) goToNextWordType {
    self.classTypeNumber ++ ;
    if (self.classTypeNumber >= [self.myClassSet count]) {
        self.classTypeNumber = 0;
    }
    [self performSelector:@selector(loadForSwipe) withObject:nil afterDelay:.3];
}

- (void) loadForSwipe {
    self.navigationItem.title = [[self.DataAction fetchedClassTypeData:self.myData] objectAtIndex:self.classTypeNumber];
    [self loadMyWordsFromClass];
    [self loadMyCoreLanguage];
    [self loadMyTranslatedLanguage];
    [self loadMySecondLanguage];
    

    [UIView transitionWithView:self.myCollectionView
                      duration:2
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        [self.view setNeedsDisplay];
                        [self.myCollectionView reloadData];
                    }
                    completion:NULL];
    
    
    
    
    
    
    //[self.myCollectionView scrollToItemAtIndexPath:0 atScrollPosition:UICollectionViewScrollPositionCenteredVertically animated:YES];
    //[self.myCollectionView setContentOffset:CGPointZero animated:YES];
    [self.myCollectionView setContentOffset:CGPointZero animated:YES];

    self.CorrectPictureCard.hidden = true;
}

- (void) twoFingerSwiperight:(UISwipeGestureRecognizer *)recognizer {
    [self.myCollectionView setContentOffset:CGPointZero animated:YES];
    [self goToPreviousWordType];   
}

- (void) twoFingerSwipeLeft:(UISwipeGestureRecognizer *)recognizer {
    [self.myCollectionView setContentOffset:CGPointZero animated:YES];
    [self goToNextWordType];
}

#pragma mark - Segmented Option Load

- (IBAction)segmentedControlNavigationItem:(UISegmentedControl *)sender
{
    [self segmentedControlActionForModalStoryBoards:sender];
}

#pragma mark - Collection View Settings

        - (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
        {
            return [self.myEnglishWordSet count];
            //NSLog(@"%d",[self.myEnglishWordSet count]);
        }

        -(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
        {
            CardCell* aCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"myCardCell" forIndexPath:indexPath];
            
            aCell.theBackgroundColor = [NSNumber numberWithInteger: BLACK_01];
            
            aCell.theLabelWord = [self.secondLanguage objectAtIndex:indexPath.row];
            aCell.theCardWord = [self.coreLanguage objectAtIndex:indexPath.row];
            aCell.thePictureWord = [self.myEnglishWordSet objectAtIndex:indexPath.row];
            aCell.theTranslatedWord = [self.translatedLanguage objectAtIndex:indexPath.row];
            
            //aCell.nameShowing = true;
            aCell.labelShowing = true;
            aCell.imageShowing = true;
            
            //NSLog(@"%d",indexPath.row);
            
            return aCell;
        }

        /*
         -(void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
         [self.view setNeedsDisplay]; // force drawRect:
         }
         */

        #define IPHONE_CELLSIZE CGSizeMake(68, 75)
        #define IPAD_CELLSIZE CGSizeMake(112.5, 125)

        - (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
            
            if (isDeviceIPad) {
                return IPAD_CELLSIZE;
            }
            else {
                return IPHONE_CELLSIZE;
            }
        }

#pragma mark - Life Cycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma  mark - Save Defaults

- (void)viewWillDisappear:(BOOL)animated {
    [self saveClassDefaults];
}

- (void) saveClassDefaults {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.classTypeNumber forKey:@"classType"];
    [defaults synchronize];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadTap];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.view setNeedsDisplay];
    [self.myCollectionView reloadData];
    [self.myCollectionView scrollToItemAtIndexPath:0 atScrollPosition:UICollectionViewScrollPositionCenteredVertically animated:YES];
    self.CorrectPictureCard.hidden = true;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

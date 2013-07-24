//
//  CardCell.m
//  Picture Dictionary
//
//  Created by Pi on 6/2/13.
//  Copyright (c) 2013 Yolaroo. All rights reserved.
//

#import "CardCell.h"

@implementation CardCell


#define BUTTON_ALPHA 0.6f
//1-1
#define BLUE_01 [UIColor colorWithRed:0.0f/255.0f green:0.0f/255.0f blue:150.0f/255.0f alpha:BUTTON_ALPHA]
#define BLUE_02 [UIColor colorWithRed:0.0f/255.0f green:0.0f/255.0f blue:200.0f/255.0f alpha:BUTTON_ALPHA]
#define BLUE_03 [UIColor colorWithRed:0.0f/255.0f green:0.0f/255.0f blue:255.0f/255.0f alpha:BUTTON_ALPHA]
#define BLUE_04 [UIColor colorWithRed:0.0f/255.0f green:100.0f/255.0f blue:255.0f/255.0f alpha:BUTTON_ALPHA]
//4-1
#define PURPLE_01 [UIColor colorWithRed:100.0f/255.0f green:0.0f/255.0f blue:255.0f/255.0f alpha:BUTTON_ALPHA]
#define PURPLE_02 [UIColor colorWithRed:150.0f/255.0f green:0.0f/255.0f blue:255.0f/255.0f alpha:BUTTON_ALPHA]
#define PURPLE_03 [UIColor colorWithRed:200.0f/255.0f green:0.0f/255.0f blue:255.0f/255.0f alpha:BUTTON_ALPHA]
#define PURPLE_04 [UIColor colorWithRed:200.0f/255.0f green:100.0f/255.0f blue:255.0f/255.0f alpha:BUTTON_ALPHA]
//8-1
#define RED_01 [UIColor colorWithRed:150.0f/255.0f green:0.0f/255.0f blue:0.0f/255.0f alpha:BUTTON_ALPHA]
#define RED_02 [UIColor colorWithRed:200.0f/255.0f green:0.0f/255.0f blue:0.0f/255.0f alpha:BUTTON_ALPHA]
#define RED_03 [UIColor colorWithRed:255.0f/255.0f green:.0f/255.0f blue:0.0f/255.0f alpha:BUTTON_ALPHA]
#define RED_04 [UIColor colorWithRed:255.0f/255.0f green:100.0f/255.0f blue:0.0f/255.0f alpha:BUTTON_ALPHA]
//12-1
#define ORANGE_01 [UIColor colorWithRed:255.0f/255.0f green:100.0f/255.0f blue:0/255.0f alpha:BUTTON_ALPHA]
#define ORANGE_02 [UIColor colorWithRed:255.0f/255.0f green:150.0f/255.0f blue:0/255.0f alpha:BUTTON_ALPHA]
#define ORANGE_03 [UIColor colorWithRed:255.0f/255.0f green:200.0f/255.0f blue:0/255.0f alpha:BUTTON_ALPHA]
#define ORANGE_04 [UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:0/255.0f alpha:BUTTON_ALPHA]
//16-1
#define GREEN_01 [UIColor colorWithRed:0.0f/255.0f green:150.0f/255.0f blue:0.0f/255.0f alpha:BUTTON_ALPHA]
#define GREEN_02 [UIColor colorWithRed:0.0f/255.0f green:200.0f/255.0f blue:0.0f/255.0f alpha:BUTTON_ALPHA]
#define GREEN_03 [UIColor colorWithRed:0.0f/255.0f green:255.0f/255.0f blue:0.0f/255.0f alpha:BUTTON_ALPHA]
#define GREEN_04 [UIColor colorWithRed:100.0f/255.0f green:255.0f/255.0f blue:0.0f/255.0f alpha:BUTTON_ALPHA]

//21-1
#define BLACK_01 [UIColor colorWithRed:40.0f/255.0f green:40.0f/255.0f blue:40.0f/255.0f alpha:BUTTON_ALPHA]

#define BLACK_SHADOW [UIColor colorWithRed:40.0f/255.0f green:40.0f/255.0f blue:40.0f/255.0f alpha:1]
#define SHADOW_COLOR [UIColor colorWithRed:40.0f/255.0f green:40.0f/255.0f blue:40.0f/255.0f alpha:0.2f]

#define VIEW_SHADOW [[UIColor colorWithRed:5.0f/255.0f green:5.0f/255.0f blue:5.0f/255.0f alpha:.8f] CGColor]

#define CORNER_RADIUS 10
#define FONT_SIZE 12
#define LABEL_X 0
#define LABEL_Y 0.65
#define NAME_Y 0.01
#define FONT_HELVETICA @"Helvetica-Light"
#define IMAGE_SCALE 0.90
#define SHADOW_SCALE 0.91

#pragma mark - Draw

- (void)drawRect:(CGRect)rect
{
    UIBezierPath * roundedRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:CORNER_RADIUS];
    
    [roundedRect addClip];
    
        [[self setMyColor] setFill];
        self.layer.borderColor = [[self setMyColor] CGColor];
    
    [[self setMyColor] setFill];
    self.layer.borderColor = [[self setMyColor] CGColor];
    
    UIRectFill(self.bounds);
    
    [[self setMyColor] setStroke];
    [roundedRect stroke];
    
    self.layer.shadowOpacity = 1;
    self.layer.shadowRadius = 3;
    self.layer.shadowOffset = CGSizeMake(3.0f, 3.0f);
    self.layer.shadowColor = VIEW_SHADOW;
    
    [self cleanTheSubview];
    
    if (self.imageShowing)
    {
        [self drawShadow];
        [self drawImage];
    }
    else{
    }
    
    if (self.labelShowing)
    {
        [self drawLabel];
    }
    else{
    }
    
    if(self.nameShowing)
    {
        [self drawNameLabel];
    }
    else{
    }
}

#pragma mark - Clear


- (void) cleanTheSubview
{
    
    for(UIView *subview in [self subviews])
    {
        if([subview isKindOfClass:[UIImageView class]])
        {
            [subview removeFromSuperview];
        }
        else if([subview isKindOfClass:[UILabel class]])
        {
            [subview removeFromSuperview];
        }
        else if([subview isKindOfClass:[UIImage class]])
        {
            [subview removeFromSuperview];
        }
        else
        {}
    }
    
}

#pragma mark - Color

#define GLOSS_ZINDEX 1
#define GRADIENT_ZINDEX 1
#define SHADOW_ZINDEX 2
#define PICTURE_ZINDEX 4
#define NAME_ZINDEX 5
#define LABEL_ZINDEX 5


- (void) setMyGradient
{
    CAGradientLayer *btnGradient = [CAGradientLayer layer];
    btnGradient.frame = self.bounds;
    btnGradient.colors = [NSArray arrayWithObjects:
                          (id)[[UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:.6f] CGColor],
                          (id)[[UIColor colorWithRed:200.0f/255.0f green:200.0f/255.0f blue:200.0f/255.0f alpha:.4f] CGColor],
                          (id)[[UIColor colorWithRed:150.0f/255.0f green:150.0f/255.0f blue:150.0f/255.0f alpha:.4f] CGColor],
                          (id)[[UIColor colorWithRed:100.0f/255.0f green:100.0f/255.0f blue:100.0f/255.0f alpha:.4f] CGColor],
                          (id)[[UIColor colorWithRed:50.0f/255.0f green:50.0f/255.0f blue:50.0f/255.0f alpha:.4f] CGColor],
                          (id)[[UIColor colorWithRed:5.0f/255.0f green:5.0f/255.0f blue:5.0f/255.0f alpha:.4f] CGColor],
                          nil];
    
    [btnGradient setMasksToBounds:YES];
    btnGradient.cornerRadius = CORNER_RADIUS;
    [self.layer insertSublayer:btnGradient atIndex:GRADIENT_ZINDEX];
    
    CAGradientLayer *glossLayer = [CAGradientLayer layer];
    glossLayer.frame = self.bounds;
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
    
    [glossLayer setMasksToBounds:YES];
    glossLayer.cornerRadius = CORNER_RADIUS;
    
    glossLayer.borderWidth = 1;
    self.layer.borderColor = [[self setMyColor] CGColor];
    [self.layer insertSublayer:glossLayer atIndex:GLOSS_ZINDEX];
}


- (UIColor*) setMyColor
{
    NSArray* colorArray = [NSArray arrayWithObjects: (id)BLUE_01, (id)BLUE_02, (id)BLUE_03, (id)BLUE_04, (id)PURPLE_01,(id)PURPLE_02,(id)PURPLE_03,(id)PURPLE_04,(id)RED_01,(id)RED_02,(id)RED_03,(id)RED_04,(id)ORANGE_01,(id)ORANGE_02,(id)ORANGE_03,(id)ORANGE_04,(id)GREEN_01,(id)GREEN_02,(id)GREEN_03,(id)GREEN_04,BLACK_01, nil];
    int myInt = [self.theBackgroundColor integerValue];
    if (myInt >= [colorArray count]) myInt = myInt % [colorArray count];
    
    UIColor*mycolor;
    mycolor =[colorArray objectAtIndex:myInt];
    if (!mycolor)
    {
        mycolor = BLUE_02;
    }
    return mycolor;
}

#pragma mark - Image

- (void) drawImage
{
    NSString *fileName = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"pic/%@",self.thePictureWord] ofType:@"jpg"];
    UIImage *image = [UIImage imageWithContentsOfFile:fileName];
    //UIImage* image = [UIImage imageNamed:[NSString stringWithFormat:@"pic/%@.jpg",self.thePictureWord]];
    UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
    
    imageView.frame = CGRectMake(self.bounds.size.width *(1.0-IMAGE_SCALE)*.5,
                                 self.bounds.size.height * (1.0-IMAGE_SCALE)*.5,
                                 self.bounds.size.width*IMAGE_SCALE,
                                 self.bounds.size.height*IMAGE_SCALE);
    
    imageView.clipsToBounds = true;
    [[imageView layer] setCornerRadius:CORNER_RADIUS];
    
    [self insertSubview:imageView atIndex:PICTURE_ZINDEX];
}

- (void) drawShadow
{
    CGRect textBounds = CGRectMake(self.bounds.size.width *(1.0-SHADOW_SCALE)*.7,
                                   self.bounds.size.height * (1.0-SHADOW_SCALE)*.7,
                                   self.bounds.size.width*SHADOW_SCALE,
                                   self.bounds.size.height*SHADOW_SCALE);
    
    UILabel *mylabel = [[UILabel alloc] initWithFrame:textBounds];
    
    //mylabel.layer.borderWidth = 1.0f;
    mylabel.layer.shadowOpacity = 1;
    mylabel.layer.shadowRadius = 5;
    mylabel.layer.shadowOffset = CGSizeMake(0.0f, 5.0f);
    mylabel.backgroundColor = SHADOW_COLOR;
    mylabel.layer.cornerRadius = CORNER_RADIUS;
    
    //mylabel.layer.shadowColor = [BLACK_SHADOW CGColor];
    
    [self insertSubview:mylabel atIndex:SHADOW_ZINDEX];
}

#pragma mark - Label

- (void) drawLabel
{
    CGRect textBounds;
    textBounds.origin = CGPointMake(LABEL_X, self.bounds.size.height*LABEL_Y);
    textBounds.size.width =  self.bounds.size.width;
    textBounds.size.height =  self.bounds.size.height*(1-LABEL_Y);
    
    UILabel *mylabel = [[UILabel alloc] initWithFrame:textBounds];
    if (self.translated) {
        mylabel.text = self.theTranslatedWord;
        mylabel.font = [UIFont fontWithName:FONT_HELVETICA size:FONT_SIZE*(self.bounds.size.width/60)*[self fontResize: self.theTranslatedWord]];
    }
    else {
        mylabel.text = self.theLabelWord;
        mylabel.font = [UIFont fontWithName:FONT_HELVETICA size:FONT_SIZE*(self.bounds.size.width/60)*[self fontResize: self.theLabelWord]];
    }
    mylabel.textColor = [UIColor whiteColor];
    mylabel.textAlignment = NSTextAlignmentCenter;
    mylabel.shadowColor = BLACK_SHADOW;
    mylabel.layer.shadowOffset = CGSizeMake(1.0, 1.0);
    mylabel.layer.shadowRadius = 1;
    mylabel.layer.shadowOpacity = 1;
    mylabel.backgroundColor = [UIColor clearColor];
    
    [self insertSubview:mylabel atIndex:LABEL_ZINDEX];
}

- (void) drawNameLabel
{
    CGRect textBounds;
    textBounds.origin = CGPointMake(LABEL_X, self.bounds.size.height*NAME_Y);
    textBounds.size.width =  self.bounds.size.width;
    textBounds.size.height =  self.bounds.size.height*(1-NAME_Y);
    
    UILabel *mylabel = [[UILabel alloc] initWithFrame:textBounds];
    if (self.translated) {
        mylabel.text = self.theTranslatedWord;
        mylabel.font = [UIFont fontWithName:FONT_HELVETICA size:FONT_SIZE*(self.bounds.size.width/60)*[self fontResize: self.theTranslatedWord]];
    }
    else {
        mylabel.text = self.theCardWord;
        mylabel.font = [UIFont fontWithName:FONT_HELVETICA size:FONT_SIZE*(self.bounds.size.width/60)*[self fontResize: self.theCardWord]];
    }
    mylabel.textColor = [UIColor whiteColor];
    mylabel.textAlignment = NSTextAlignmentCenter;
    mylabel.shadowColor = BLACK_SHADOW;
    mylabel.layer.shadowOffset = CGSizeMake(1.0, 1.0);
    mylabel.layer.shadowRadius = 1;
    mylabel.layer.shadowOpacity = 1;
    mylabel.backgroundColor = [UIColor clearColor];
    
    [self insertSubview:mylabel atIndex:NAME_ZINDEX];
}

- (double) fontResize: (NSString*) theString
{
    int myInt;
    myInt = theString.length;
    
    if (myInt > 8)
    {
        double myDouble;
        myDouble =  8.0f/myInt;
        return  myDouble;
    }
    else{
        return 1.0f;
    }
}

#pragma mark - BOOL

-(void) setImageShowing:(BOOL)imageShowing
{
    _imageShowing =imageShowing;
    [self setNeedsDisplay];
}

-(void) setLabelShowing:(BOOL)labelShowing
{
    _labelShowing =labelShowing;
    [self setNeedsDisplay];
}

-(void) setNameShowing:(BOOL)nameShowing
{
    _nameShowing =nameShowing;
    [self setNeedsDisplay];
}

-(void) setTapped:(BOOL)tapped
{
    _tapped =tapped;
    [self setNeedsDisplay];
}

-(void) setTranslated:(BOOL)translated
{
    _translated =translated;
    [self setNeedsDisplay];
}

#pragma mark - Setters

-(void) setTheCardWord:(NSString*)theCardWord
{
    _theCardWord=theCardWord;
    [self setNeedsDisplay];
}

-(void) setThePictureWord:(NSString*)thePictureWord
{
    _thePictureWord=thePictureWord;
    [self setNeedsDisplay];
}

-(void) setTheLabelWord:(NSString*)theLabelWord
{
    _theLabelWord = theLabelWord;
    [self setNeedsDisplay];
}

-(void) setTheTranslatedWord:(NSString*)theTranslatedWord
{
    _theTranslatedWord=theTranslatedWord;
    [self setNeedsDisplay];
}

-(void) settheBackgroundColor:(NSNumber*)theBackgroundColor
{
    _theBackgroundColor=theBackgroundColor;
    [self setNeedsDisplay];
}

-(void) setTheCenter:(CGPoint)theCenter
{
    _theCenter=theCenter;
}

//theCenter

#pragma mark -  Set Up

-(void)awakeFromNib {
    
    [self setup];
}

-(void)setup {
    [self setMyGradient];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setup];
    return self;
}


@end

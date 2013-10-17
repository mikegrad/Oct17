//
//  View.m
//  Japan
//
//  Created by Michael Gradilone on 10/15/13.
//  Copyright (c) 2013 FinTechSolutions. All rights reserved.
//

#import "View.h"

@implementation View





- (id) initWithFrame: (CGRect) frame
{
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		self.backgroundColor = [UIColor whiteColor];
        
        //this code sets the origin to the middle of the screen - remoove when using CTM
        //CGFloat w = self.bounds.size.width;
		//CGFloat h = self.bounds.size.height;
		//self.bounds = CGRectMake(-w / 2, -h / 2, w, h);
	}
	return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void) drawRect: (CGRect) rect
{
    
 
    


 
    
	// Drawing code
	CGRect bounds = self.bounds;
	CGFloat radius = .3 * bounds.size.width;	//in pixels
    

    
	/*
	 Create the invisible square that will surround the circle.
	 Place the upper left corner of the square at the upper left corner of
	 the View.  bounds.origin.x and bounds.origin.y are the coordinates of
	 the upper left corner of the View.
     */
	CGRect r = CGRectMake(
                          -radius,
                          -radius,
                          2 * radius,
                          2 * radius
                          );
    
	CGContextRef c = UIGraphicsGetCurrentContext();

    
    
    /*
    
    // this os frequently used to put the orgin in the center of the view and make Y axis point up!
    //Put the origin at the center of the UIView.
	CGContextTranslateCTM(c, self.bounds.size.width / 2, self.bounds.size.height / 2);
    
	//Make the Y axis point up.
	CGContextScaleCTM(c, 1, -1);
    
    // end make y point up
    
    
    // this is the translate change
    // cnt use this with the scaling tham puts orgin in middle and Y pointing up
    //CGContextTranslateCTM(c, bounds.size.width / 2, bounds.size.height / 2);
    
    //store the scaling values in a transform
    CGFloat scaleX = 1;
    CGFloat scaleY = 1;
    CGAffineTransform scale = CGAffineTransformMakeScale(scaleX, scaleY);
    
    //scaling contect change
    //CGContextScaleCTM(c, 0, 0);	//horizontal scale, vertical scale
    CGContextConcatCTM(c, scale);
    
    //if i move down here will it be double too?
    UIFont *font = [UIFont systemFontOfSize: 32];
	[@"Origin" drawAtPoint: CGPointZero withFont: font];
    
    
	CGContextBeginPath(c);	//unnecessary here: the path is already empty.
	CGContextAddEllipseInRect(c, r);
	CGContextSetRGBFillColor(c, 1.0, 0.0, 0.0, 1.0);	//red, opaque
	CGContextFillPath(c);
    
    */
    
    // draw the red cross - ge rid of the circile above!
    // Drawing code
	//Fill the Red Cross.
	CGSize size = self.bounds.size;
	CGFloat min = MIN(size.width, size.height);
	CGFloat longSide = min * 15 / 16;
	CGFloat shortSide = longSide / 3;
    
	//CGContextRef c = UIGraphicsGetCurrentContext();
	CGContextBeginPath(c);
    
	CGContextTranslateCTM(c, size.width / 4, size.height / 4); //origin at center of view
	CGContextScaleCTM(c, .1, -.1);                               //make Y axis point up
    
	CGRect horizontal = CGRectMake(-longSide / 2, -shortSide / 2, longSide, shortSide);
	CGRect   vertical = CGRectMake(-shortSide / 2, -longSide / 2, shortSide, longSide);
	CGContextAddRect(c, horizontal);
	CGContextAddRect(c, vertical);
    
	CGContextSetRGBFillColor(c, 1.0, 0.0, 0.0, 1.0);
    
    
    //Light source at upper left, shadow at lower right.
	CGSize crossShadow = CGSizeMake(5, 10);
    
	//5 is the amount of blur.  A smaller number makes a sharper shadow.
	CGContextSetShadow(c, crossShadow, 10);
    
	CGContextFillPath(c);
    
    
    //is there a way to "reset" the contect back to normal?
    
    //Fill a right triangle.
	CGSize triSize = self.bounds.size;
	CGFloat triMin = MIN(triSize.width, triSize.height);
	CGFloat length = triMin * 5 / 8;           //of side
    
    //CGContextRestoreGState(c);

	//origin at right angle
	CGContextTranslateCTM(c,
                          (triSize.width + length) * 2.5,   //x axys
                          (triSize.height + length) * -2.5
                          );
	CGContextScaleCTM(c, 5, 5);
    
	CGContextBeginPath(c);
	CGContextMoveToPoint(c, 0, 0);          //lower right vertex (the right angle)
	CGContextAddLineToPoint(c, 0, length);  //upper right vertex
	CGContextAddLineToPoint(c, -length, 0); //lower left vertex
	CGContextClosePath(c);                  //back to starting point
    CGContextSetRGBFillColor(c, 0.0, 0.0,1.0, .5);
    
    //Light source at upper left, shadow at lower right.
	CGSize shadow = CGSizeMake(5, 10);
    
	//5 is the amount of blur.  A smaller number makes a sharper shadow.
	CGContextSetShadow(c, shadow, 15);
    
    CGContextFillPath(c);
    
    CGContextBeginPath(c);
	CGContextMoveToPoint(c, 0, 0);          //lower right vertex (the right angle)
	CGContextAddLineToPoint(c, 0, length);  //upper right vertex
	CGContextAddLineToPoint(c, -length, 0); //lower left vertex
	CGContextClosePath(c);                  //back to starting point
    CGContextSetLineWidth(c,  10);
	
    CGContextSetRGBStrokeColor(c, 0, 1, 0, 1);
	
    //Light source at upper left, shadow at lower right.
	//CGSize shadow = CGSizeMake(10, 20);
    
	//5 is the amount of blur.  A smaller number makes a sharper shadow.
	CGContextSetShadow(c, shadow, 15);
    CGContextStrokePath(c);
    
    
    
    
    //put some text in --haha its flipped over! I like it. IF I DONT DO the below code everything is flipped around.
    CGContextTranslateCTM(c, -400, -200);
    CGContextScaleCTM(c, 1, -1);
    
    CGSize textShadow = CGSizeMake(4, 4);
    CGContextSetShadow(c, textShadow, 1);
    
    CGContextSetRGBFillColor(c, 1.0, 0.0,1.0, 1);
    //if i move down here will it be double too?
    UIFont *font = [UIFont systemFontOfSize: 32];
    
    NSString *string = NSLocalizedString(@"Greeting", @"displayedin the view class:");
    
	[string drawAtPoint: CGPointZero withFont: font];
    
    //Draw my own square
    
    NSLog(@"self.frame == (%g, %g), %g × %g",
          self.frame.origin.x,
          self.frame.origin.y,
          self.frame.size.width,
          self.frame.size.height
          );
    
	NSLog(@"self.bounds == (%g, %g), %g × %g",
          self.bounds.origin.x,
          self.bounds.origin.y,
          self.bounds.size.width,
          self.bounds.size.height
          );
    
    CGAffineTransform ctm = CGContextGetCTM(c);
	NSLog(@"%6g%6g%6g", ctm.a,  ctm.b,  0.0);
	NSLog(@"%6g%6g%6g", ctm.c,  ctm.d,  0.0);
	NSLog(@"%6g%6g%6g", ctm.tx, ctm.ty, 1.0);	//translate x, translate y
    
    //set the origin back to middle
    CGContextTranslateCTM(c, bounds.size.width / 2, bounds.size.height / 2);
    
    CGFloat sqSide = 100; //squareSize.width/2;
    
    CGContextBeginPath(c);
    
    CGContextScaleCTM(c, 10, -10);
    
    CGContextMoveToPoint(c, 100, -200);
    
    CGRect mySquare = CGRectMake(sqSide, sqSide, sqSide, sqSide);
    CGContextAddRect(c, mySquare);
    
    //CGContextClosePath(c);
    //CGContextAddLineToPoint(c, 0, -sqSide );  //i could have closed as well
    
    CGContextSetLineWidth(c,  3);
    
    CGContextSetRGBStrokeColor(c, .5, .5, .5, .75);
    
    CGContextStrokePath(c);
    
}



@end

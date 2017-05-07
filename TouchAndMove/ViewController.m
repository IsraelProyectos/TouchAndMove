//
//  ViewController.m
//  TouchAndMove
//
//  Created by Ahmed Al Sadi on 3/29/13.
//  Copyright (c) 2013 Ahmed Al Sadi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblX;
@property (weak, nonatomic) IBOutlet UILabel *lblY;

@end

//Save the first touch point
CGPoint firstTouchPoint;

//xd = destance between imge center and my touch center
float xd;
float yd;

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[self imgTest]setUserInteractionEnabled:YES];
    CGFloat x = self.view.frame.size.width / 2;
    CGFloat y = self.view.frame.size.height / 2;
    
    
    
    CGFloat proportionalXOffset = (1 * (x * 2)) / 768;
    CGFloat proportionalYOffset = (1 * (y * 2)) / 1024;
    [self.imgTest setFrame:CGRectMake(x  - (x * proportionalXOffset), y - (y * proportionalYOffset), 50, 50)];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* bTouch = [touches anyObject];
    if ([bTouch.view isEqual:[self imgTest]]) {
        firstTouchPoint = [bTouch locationInView:[self view]];
        xd = firstTouchPoint.x - [[bTouch view]center].x;
        yd = firstTouchPoint.y - [[bTouch view]center].y;
        
    }
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* mTouch = [touches anyObject];
    if (mTouch.view == [self imgTest]) {
        CGPoint cp = [mTouch locationInView:[self view]];
        [[mTouch view]setCenter:CGPointMake(cp.x-xd, cp.y-yd)];
        self.lblX.text = [NSString stringWithFormat:@"%f", cp.x];
        self.lblY.text = [NSString stringWithFormat:@"%f", cp.y];
    }
}

@end

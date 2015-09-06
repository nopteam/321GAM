//
//  GameScene.m
//  321GAM
//
//  Created by Leonardo Cascianelli on 06/09/15.
//  Copyright (c) 2015 Leonardo Cascianelli. All rights reserved.
//

// Prevent debug -- Remove to dbg
#define _DBG_INHIBIT_
// Prevent debug -- END

#import "GameScene.h"
#import "dbg.h"

@interface GameScene()
@property (nonatomic) CGPoint prevTouchLocation;

- (e_side)getSideWithCGPoint:(CGPoint)point;
- (void)handleTouch:(CGPoint)touch;

@end

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
	[super didMoveToView:view];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	[touches enumerateObjectsUsingBlock:^(UITouch* obj, BOOL *stop) {
		
		CGPoint tPoint = [obj locationInView:self.view];
		
		if([self getSideWithCGPoint:tPoint] != [self getSideWithCGPoint:self.prevTouchLocation])
		{
			[self handleTouch:tPoint];
		}
		self.prevTouchLocation = tPoint;
	}];
}

#pragma mark Stub
-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}


#pragma mark PrivUtil
- (e_side)getSideWithCGPoint:(CGPoint)point
{
	if(point.x >= [UIScreen mainScreen].bounds.size.width/2)
		return RIGHT;
	else
		return LEFT;
}

- (void)handleTouch:(CGPoint)touch
{
	//TODO IMPLEMENT
	return;
}

@end

//
//  GameScene.m
//  321GAM
//
//  Created by Leonardo ; on 06/09/15.
//  Copyright (c) 2015 Leonardo Cascianelli. All rights reserved.
//

// Prevent debug -- Remove to dbg
#define _DBG_INHIBIT_
// Prevent debug -- END

#import "GameScene.h"
#import "BGNode.h"
#import "dbg.h"

@interface GameScene()
@property (nonatomic) CGPoint prevTouchLocation;

- (void)setup;
- (e_side)getSideWithCGPoint:(CGPoint)point;
- (void)handleTouch:(CGPoint)touch;

@end

@implementation GameScene

- (instancetype)initWithSize:(CGSize)size
{
	self = [super initWithSize:size];
	if(self)
	{
		[self setup];
	}
	return self;
}

- (void)setup
{
	if(!self->bgNode){
		self->bgNode = [[BGNode alloc] initWithNodes:@[@"entry",@"loop",@"exit"]];
		self->bgNode.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame));
	}
	
	[NSTimer scheduledTimerWithTimeInterval:1 target:self->bgNode selector:@selector(stopLooping) userInfo:nil repeats:nil];
	
	
	[self addChild:bgNode];
}


 - (void) createCircle: (float) radius{
 
 SKShapeNode *circle = [SKShapeNode shapeNodeWithCircleOfRadius:radius];
 circle.fillColor = [SKColor redColor];
 circle.lineWidth = 1;
 circle.position = CGPointMake(self.size.width / 2, self.size.height - 40);
	 circle.zPosition = 100;
 [self addChild:circle];
	
 }


-(void)didMoveToView:(SKView *)view {
	[super didMoveToView:view];
	[self createCircle: 30.0];
}


#pragma mark PrivUtil
- (e_side)getSideWithCGPoint:(CGPoint)point
{
	if(point.x >= [UIScreen mainScreen].bounds.size.width/2)
		return RIGHT;
	else
		return LEFT;
}


#pragma mark Input

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	[touches enumerateObjectsUsingBlock:^(UITouch* obj, BOOL *stop) {
		
		CGPoint tPoint = [obj locationInView:self.view];
		
		if([self getSideWithCGPoint:tPoint] != [self getSideWithCGPoint:self.prevTouchLocation])
		{
			[self handleTouch:tPoint];
		}
		_info("LOL");
		self.prevTouchLocation = tPoint;
	}];
}


- (void)handleTouch:(CGPoint)touch
{
	//TODO IMPLEMENT
	return;
}

#pragma mark Stub

-(void)update:(CFTimeInterval)currentTime {
	[self->bgNode updatePosition];
}

@end

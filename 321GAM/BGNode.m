//
//  BGNode.m
//  321GAM
//
//  Created by Leonardo Cascianelli on 06/09/15.
//  Copyright (c) 2015 Leonardo Cascianelli. All rights reserved.
//

#import "BGNode.h"

#define Y_THRESHOLD 1

@interface BGNode()
@property (nonatomic,strong) SKAction* basicMove;
- (void)setupWithNodes:(NSArray*)nodes;
@end

@implementation BGNode
- (instancetype)initWithNodes:(NSArray*)nodes
{
	self = [super init];
	
	if([nodes count] != 3){ fprintf(stderr,"[!] 3 nodes required!"); return nil;}
	[self setupWithNodes:nodes];
	
	return self;
}

- (void)setupWithNodes:(NSArray *)nodes
{
	self->_shouldKeepUpdating = 1;
	
	self.basicMove = [SKAction moveBy:CGVectorMake(0, Y_THRESHOLD) duration:0];
	
	self.entryNode = [[SKSpriteNode alloc] initWithImageNamed:[nodes objectAtIndex:0]];
	self.entryNode.position = CGPointMake(0, 0);
	self.loopNode = [[SKSpriteNode alloc] initWithImageNamed:[nodes objectAtIndex:1]];
	self.loopNode.position = CGPointMake(0,self.entryNode.position.y - self.entryNode.size.height);
	self.secondaryLoopNode = [[SKSpriteNode alloc] initWithImageNamed:[nodes objectAtIndex:1]];
	self.secondaryLoopNode.position = CGPointMake(0,self.loopNode.position.y - self.loopNode.size.height);
	self.exitNode = [[SKSpriteNode alloc] initWithImageNamed:[nodes objectAtIndex:2]];
	self.exitNode.position = CGPointMake(0,self.secondaryLoopNode.position.y-self.secondaryLoopNode.size.height);
	
	[self addChild:self.entryNode];
	[self addChild:self.loopNode];
	[self addChild:self.secondaryLoopNode];
	[self addChild:self.exitNode];
	
}

- (void)updatePosition
{
	if(self->_shouldKeepUpdating == 1){
		if(self->_shouldLoop == 0) [self.entryNode runAction:self.basicMove];
		else self.entryNode = nil;
		if(self.entryNode.position.y > self.entryNode.size.height) self->_shouldLoop = 1;
		
		if(self->_shouldLoop == 1){
				if(self.loopNode.position.y > self.loopNode.size.height){
					self.loopNode.position = CGPointMake(self.loopNode.position.x,self.secondaryLoopNode.position.y-self.secondaryLoopNode.size.height);
				}
			}
		[self.loopNode runAction:self.basicMove];
		if(self->_shouldLoop == 1){
			if(self.secondaryLoopNode.position.y > self.secondaryLoopNode.size.height)
				self.secondaryLoopNode.position = CGPointMake(self.secondaryLoopNode.position.x,self.loopNode.position.y-self.loopNode.size.height);
		}
		[self.secondaryLoopNode runAction:self.basicMove];
		
		if(self->_endSequenceActivated == 1)
		{
			if(!self.exitNode.position.y == 0.000000)
				[self.exitNode runAction:self.basicMove];
			else
				self->_shouldKeepUpdating = 0;
		}
	}
}

- (void)stopLooping
{
	self->_shouldLoop = 0;
	self->_endSequenceActivated = 1;
	self.exitNode.position = CGPointMake(0,self.secondaryLoopNode.position.y-self.secondaryLoopNode.size.height);
}
@end

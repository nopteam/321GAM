//
//  BGNode.h
//  321GAM
//
//  Created by Leonardo Cascianelli on 06/09/15.
//  Copyright (c) 2015 Leonardo Cascianelli. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface BGNode : SKNode{
	unsigned int _shouldLoop:1;
	unsigned int _endSequenceActivated:1;
	unsigned int _shouldKeepUpdating:1;
}
@property (nonatomic,strong) SKSpriteNode* entryNode;
@property (nonatomic,strong) SKSpriteNode* loopNode;
@property (nonatomic,strong) SKSpriteNode* secondaryLoopNode;
@property (nonatomic,strong) SKSpriteNode* exitNode;

- (instancetype)initWithNodes:(NSArray*)nodes;
- (void)updatePosition;
- (void)stopLooping;
@end

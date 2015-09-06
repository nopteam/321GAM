//
//  GameScene.h
//  321GAM
//

//  Copyright (c) 2015 Leonardo Cascianelli. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@class BGNode;

typedef enum{
	LEFT,RIGHT
}e_side;

@interface GameScene : SKScene{
	BGNode* bgNode;
}

@end

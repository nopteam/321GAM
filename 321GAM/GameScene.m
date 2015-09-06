//
//  GameScene.m
//  321GAM
//
//  Created by Leonardo ; on 06/09/15.
//  Copyright (c) 2015 Leonardo Cascianelli. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
	[super didMoveToView:view];
    [self createCircle: 30.0];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */

}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}


- (void) createCircle: (float) radius{
    
    SKShapeNode *circle = [SKShapeNode shapeNodeWithCircleOfRadius:radius];
    circle.fillColor = [SKColor redColor];
    circle.lineWidth = 1;
    circle.position = CGPointMake(self.size.width / 2, self.size.height - 40);
    [self addChild:circle];
}

@end

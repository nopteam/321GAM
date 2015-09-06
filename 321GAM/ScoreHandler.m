//
//  ScoreHandler.m
//  321GAM
//
//  Created by Leonardo Cascianelli on 06/09/15.
//  Copyright (c) 2015 Leonardo Cascianelli. All rights reserved.
//

#import "ScoreHandler.h"
#define _DBG

@interface ScoreHandler()
- (void)setup;
@end

@implementation ScoreHandler

+ (instancetype)sharedHandler
{
	static ScoreHandler* privHandler = nil;
	if(!privHandler)
	{
		privHandler = [[self alloc] init];
		[privHandler setup];
	}
	return privHandler;
}

- (void)setup
{
	
}

@end

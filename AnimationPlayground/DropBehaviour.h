//
//  DropBehaviour.h
//  AnimationPlayground
//
//  Created by James Tang on 30/8/14.
//  Copyright (c) 2014 James Tang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APRestorableBehaviour.h"

@interface DropBehaviour : UIDynamicBehavior <APRestorableBehaviour>

@property (readwrite, nonatomic) NSInteger angle;

- (id)initWithItem:(id <UIDynamicItem>)item;

@end

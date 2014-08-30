//
//  ShakeBehaviour.h
//  Popping
//
//  Created by James Tang on 30/8/14.
//  Copyright (c) 2014 André Schneider. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APRestorableBehaviour.h"

@interface ShakeBehaviour : UIDynamicBehavior <APRestorableBehaviour>

@property (readwrite, nonatomic) CGVector pushDirection;
@property (readwrite, nonatomic) CGFloat length;
@property (readwrite, nonatomic) CGFloat damping; // 1: critical damping
@property (readwrite, nonatomic) CGFloat frequency; // in Hertz

- (id)initWithItem:(id <UIDynamicItem>)item;

@end

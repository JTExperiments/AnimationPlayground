//
//  DropBehaviour.m
//  AnimationPlayground
//
//  Created by James Tang on 30/8/14.
//  Copyright (c) 2014 James Tang. All rights reserved.
//

#import "DropBehaviour.h"

#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

@implementation DropBehaviour {
    id <UIDynamicItem> _item;
    CGPoint _center;
}

- (id)initWithItem:(id <UIDynamicItem>)item {

    self = [super init];
    _item = item;
    return self;
}

- (void)willMoveToAnimator:(UIDynamicAnimator *)dynamicAnimator {

    if (dynamicAnimator == nil) {
        _item.center = _center;
        return;
    }

    _center = _item.center;

    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[_item]];

    [self addChildBehavior:gravity];

    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[_item]];

    collision.translatesReferenceBoundsIntoBoundary = YES;

    [self addChildBehavior:collision];

    UIDynamicItemBehavior *itemBehaviour = [[UIDynamicItemBehavior alloc] initWithItems:@[_item]];

    itemBehaviour.allowsRotation = YES;

    CGFloat degree = arc4random() % 60;
    CGFloat flipped = arc4random() % 2 == 0 ? degree * -1 : degree;
    [itemBehaviour addAngularVelocity:DEGREES_TO_RADIANS(flipped) forItem:_item];

    [self addChildBehavior:itemBehaviour];
}

@end

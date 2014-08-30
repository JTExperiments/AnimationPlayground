//
//  ShakeBehaviour.m
//  Popping
//
//  Created by James Tang on 30/8/14.
//  Copyright (c) 2014 André Schneider. All rights reserved.
//

#import "ShakeBehaviour.h"

@implementation ShakeBehaviour {
    id <UIDynamicItem> _item;
    CGPoint _center;
}

- (id)initWithItem:(id <UIDynamicItem>)item {

    self = [super init];
    _item = item;
    self.pushDirection = CGVectorMake(11, 0);
    self.damping = 0.28;
    self.frequency = 3;
    self.length = 0.8;
    return self;
}

- (void)willMoveToAnimator:(UIDynamicAnimator *)dynamicAnimator {

    if (dynamicAnimator == nil) {
        _item.center = _center;
        return;
    }

    _center = _item.center;
    UIAttachmentBehavior *snapBehaviour = [[UIAttachmentBehavior alloc] initWithItem:_item attachedToAnchor:_center];

    snapBehaviour.damping = self.damping;
    snapBehaviour.frequency = self.frequency;
    snapBehaviour.length = self.length;
    [self addChildBehavior:snapBehaviour];

    UIPushBehavior *behaviour = [[UIPushBehavior alloc] initWithItems:@[_item] mode:UIPushBehaviorModeInstantaneous];
    behaviour.pushDirection = self.pushDirection;
    [self addChildBehavior:behaviour];

}

@end

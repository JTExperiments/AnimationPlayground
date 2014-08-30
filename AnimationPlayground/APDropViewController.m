//
//  APDrpoViewController.m
//  AnimationPlayground
//
//  Created by James Tang on 30/8/14.
//  Copyright (c) 2014 James Tang. All rights reserved.
//

#import "APDropViewController.h"
#import "DropBehaviour.h"

@interface APDropViewController ()

@property (weak, nonatomic) IBOutlet UIButton *button;
@property (strong, nonatomic) UIDynamicAnimator *animator;

@end

@implementation APDropViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
}

- (IBAction)buttonDidPress:(id)sender {
    [self.animator.behaviors enumerateObjectsUsingBlock:^(id <APRestorableBehaviour> obj, NSUInteger idx, BOOL *stop) {
        [obj restorePosition];
    }];
    [self.animator removeAllBehaviors];
    DropBehaviour *behaviour = [[DropBehaviour alloc] initWithItem:self.button];
    [self.animator addBehavior:behaviour];
}

@end

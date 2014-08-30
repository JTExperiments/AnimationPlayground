//
//  APAnimationListViewController.m
//  AnimationPlayground
//
//  Created by James Tang on 30/8/14.
//  Copyright (c) 2014 James Tang. All rights reserved.
//

#import "APAnimationListViewController.h"

@interface APAnimationListViewController ()

@property (copy, nonatomic) NSDictionary *mapping;

@end

@implementation APAnimationListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *identifier = cell.reuseIdentifier;
    UIViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:identifier];
    [self.navigationController pushViewController:controller animated:YES];
}

@end

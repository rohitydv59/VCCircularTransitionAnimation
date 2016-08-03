//
//  ViewController.m
//  CircleTransition
//
//  Created by Rohit Yadav on 03/08/16.
//  Copyright © 2016 iAppstreet. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)circleTapped:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end

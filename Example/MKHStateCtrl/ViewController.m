//
//  ViewController.m
//  MKHState
//
//  Created by Maxim Khatskevich on 01/04/15.
//  Copyright (c) 2015 Maxim Khatsevich. All rights reserved.
//

#import "ViewController.h"

#import "MKHStateCtrl.h"

//===

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //===
    
    [self
     setOnStateDidChange:^(int previousState, int currentState) {
         
         NSLog(@"State has been changed from %d to %d", previousState, currentState);
     }];
    
    self.state = 1;
}

@end

//
//  NSObject+MKHStateCtrl.m
//  MKHStateCtrl
//
//  Created by Maxim Khatskevich on 01/04/15.
//  Copyright (c) 2015 Maxim Khatsevich. All rights reserved.
//

#import "NSObject+MKHStateCtrl.h"

#import <objc/runtime.h>

//===

static void *MKHStateKey;
static void *MKHOnStateWillChangeKey;
static void *MKHOnStateDidChangeKey;

//===

@implementation NSObject (MKHStateCtrl)

#pragma mark - Property accessors

- (int)state
{
    int result = kUnknownObjectState;
    
    //===
    
    id state =
    objc_getAssociatedObject(self, &MKHStateKey);
    
    if ([state isKindOfClass:[NSNumber class]])
    {
        result = ((NSNumber *)state).intValue;
    }
    
    //===
    
    return result;
}

- (void)setState:(int)newValue
{
    int currentValue = self.state;
    
    if (currentValue != newValue)
    {
        BOOL allowChange = YES;
        MKHStateWillChangeHandler onStateWillChange = self.onStateWillChange;
        
        if (onStateWillChange)
        {
            allowChange = onStateWillChange(currentValue, newValue);
        }
        
        //===
        
        if (allowChange)
        {
            objc_setAssociatedObject(self,
                                     &MKHStateKey,
                                     [NSNumber numberWithInteger:newValue],
                                     OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            
            //===
            
            MKHStateDidChangeHandler onStateDidChange = self.onStateDidChange;
            
            if (onStateDidChange)
            {
                // 'currentValue' is 'previousValue' now
                // 'newValue' is 'currentValue' now
                
                onStateDidChange(currentValue, newValue);
            }
        }
    }
}

- (MKHStateWillChangeHandler)onStateWillChange
{
    return objc_getAssociatedObject(self, &MKHOnStateWillChangeKey);
}

- (void)setOnStateWillChange:(MKHStateWillChangeHandler)newValue
{
    objc_setAssociatedObject(self,
                             &MKHOnStateWillChangeKey,
                             newValue,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (MKHStateDidChangeHandler)onStateDidChange
{
    return objc_getAssociatedObject(self, &MKHOnStateDidChangeKey);
}

- (void)setOnStateDidChange:(MKHStateDidChangeHandler)newValue
{
    objc_setAssociatedObject(self,
                             &MKHOnStateDidChangeKey,
                             newValue,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)switchToState:(int)targetState
{
    [self switchToState:targetState completion:nil];
}

- (void)switchToState:(int)targetState completion:(void(^)())completion
{
    // SHOULD be implemented in a custom class
}

@end

//
//  NSObject+MKHState.h
//  MKHState
//
//  Created by Maxim Khatskevich on 01/04/15.
//  Copyright (c) 2015 Maxim Khatsevich. All rights reserved.
//

#import <Foundation/Foundation.h>

//===

typedef enum {
    kUnknownObjectState = 0 // "unset"
}
MKHObjectState;

//===

typedef BOOL (^MKHStateWillChangeHandler)(int currentState, int targetState);
typedef void (^MKHStateDidChangeHandler)(int previousState, int currentState);

//===

@interface NSObject (MKHState)

@property int state;

@property (strong, nonatomic) MKHStateWillChangeHandler onStateWillChange;
@property (strong, nonatomic) MKHStateDidChangeHandler onStateDidChange;

- (void)setOnStateWillChange:(MKHStateWillChangeHandler)onStateWillChangeHandler;
- (void)setOnStateDidChange:(MKHStateDidChangeHandler)onStateDidChangeHandler;

- (void)switchToState:(int)targetState;
- (void)switchToState:(int)targetState completion:(void(^)())completion;

@end

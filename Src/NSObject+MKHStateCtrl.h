//
//  NSObject+MKHStateCtrl.h
//  MKHStateCtrl
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

typedef BOOL (^MKHStateWillChangeHandler)(int previousState, int newState);
typedef void (^MKHStateDidChangeHandler)(int previousState, int newState);

//===

@interface NSObject (MKHStateCtrl)

@property int state;

@property (strong, nonatomic) MKHStateWillChangeHandler onStateWillChange;
@property (strong, nonatomic) MKHStateDidChangeHandler onStateDidChange;

- (void)setOnStateWillChange:(MKHStateWillChangeHandler)onStateWillChangeHandler;
- (void)setOnStateDidChange:(MKHStateDidChangeHandler)onStateDidChangeHandler;

@end

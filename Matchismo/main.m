//
//  main.m
//  Matchismo
//
//  Created by Simon Liu on 3/26/13.
//  Copyright (c) 2013 Simon Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CardGameAppDelegate.h"

//int main(int argc, char *argv[])
//{
//    @autoreleasepool {
//        return UIApplicationMain(argc, argv, nil, NSStringFromClass([CardGameAppDelegate class]));
//    }
//}

int main(int argc, char *argv[])
{
    @autoreleasepool {
        
        int retVal;
        @try {
            retVal = UIApplicationMain(argc, argv, nil, NSStringFromClass([CardGameAppDelegate class]));
        }
        @catch (NSException *exception) {
            NSLog(@"CRASH: %@", exception);
            NSLog(@"Stack Trace: %@", [exception callStackSymbols]);
        }
        return retVal;
    }
}
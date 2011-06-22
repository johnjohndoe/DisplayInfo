//
//  TestScreensAppDelegate.h
//  TestScreens
//
//  Created by Tobias Preuss on 22.06.11.
//  Copyright 2011 Tobias Preuss. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface TestScreensAppDelegate : NSObject<NSApplicationDelegate> {

    NSWindow* m_window;
}


@property (readwrite, assign) IBOutlet NSWindow* window;



@end

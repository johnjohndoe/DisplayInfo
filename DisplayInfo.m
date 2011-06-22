//
//  DisplayInfo.m
//  DisplayInfo
//
//  Created by Tobias Preuss on 21.06.11.
//  Copyright 2011 q-bus. All rights reserved.
//

#import "DisplayInfo.h"
#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>
#import <IOKit/graphics/IOGraphicsLib.h>


@interface DisplayInfo()

+ (NSString*)screenNameForDisplay:(CGDirectDisplayID)displayID;

@end




/**
	The DisplayInfo class resolves the names of all available screens.
 */
@implementation DisplayInfo


/**
	Returns the screen name for the given display identifier.
	@param displayID A display identifier.
	@returns A screen name.
 */
+ (NSString*)screenNameForDisplay:(CGDirectDisplayID)displayID {
	
    NSString* screenName = nil;
	
    NSDictionary* deviceInfo = (NSDictionary*)IODisplayCreateInfoDictionary(CGDisplayIOServicePort(displayID), kIODisplayOnlyPreferredName);
    NSDictionary* localizedNames = [deviceInfo objectForKey:[NSString stringWithUTF8String:kDisplayProductName]];
	
    if ([localizedNames count] > 0) {
        screenName = [[localizedNames objectForKey:[[localizedNames allKeys] objectAtIndex:0]] retain];
    }
	
    [deviceInfo release];
    return [screenName autorelease];
}

/**
	Returns the name for the given screen.
	@param screen A screen.
	@returns A screen name.
 */
+ (NSString*)screenNameForScreen:(NSScreen*)screen {
	return [self screenNameForDisplay:[self screenIdForScreen:screen]];
}


/**
	Returns the identifier for the given screen.
	@param screen A screen.
	@returns A screen name.
 */
+ (int)screenIdForScreen:(NSScreen*)screen {

	NSDictionary* screenDescriptions = [screen deviceDescription];
	NSNumber* displayID = [screenDescriptions objectForKey:@"NSScreenNumber"];
	return [displayID intValue];
}


/**
	Returns an array containing the names of all available screens.
	@returns An array of screen names.
 */
+ (NSArray*)screenNames {
	NSArray* screens = [NSScreen screens];
	NSMutableArray* screenNames = [NSMutableArray arrayWithCapacity:[screens count]];
	for (NSScreen* screen in screens) {
		[screenNames addObject:[self screenNameForScreen:screen]];
	}
	return screenNames;
}

/**
	Returns the array index of the given screen in the array of all screen names.
	@param screen A screen.
	@returns The array index of the given screen.
 */
+ (NSUInteger)indexOfScreen:(NSScreen*)screen {
	return [[self screenNames] indexOfObject:[DisplayInfo screenNameForScreen:screen]];
}

@end

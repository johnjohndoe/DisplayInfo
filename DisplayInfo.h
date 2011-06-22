//
//  DisplayInfo.h
//  SlideShowApp
//
//  Created by Tobias Preuss on 21.06.11.
//  Copyright 2011 q-bus. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface DisplayInfo : NSObject {

}

+ (int)screenIdForScreen:(NSScreen*)screen;
+ (NSString*)screenNameForScreen:(NSScreen*)screen;
+ (NSArray*)screenNames;
+ (NSUInteger)indexOfScreen:(NSScreen*)screen;

@end

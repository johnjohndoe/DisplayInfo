//
//  DisplayInfoController.h
//  DisplayInfo
//
//  Created by Tobias Preuss on 22.06.11.
//  Copyright 2011 Tobias Preuss. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface DisplayInfoController : NSObject<NSTableViewDataSource, NSTableViewDelegate> {

	NSTableView* m_displayInfoTableView;
	NSUInteger m_selectedScreenIndex; ///< Screen index in the array provided by the DisplayInfo class.
}

@property (readwrite, assign) IBOutlet NSTableView* displayInfoTableView;

@end

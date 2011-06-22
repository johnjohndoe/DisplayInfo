//
//  DisplayInfoController.m
//  DisplayInfo
//
//  Created by Tobias Preuss on 22.06.11.
//  Copyright 2011 Tobias Preuss. All rights reserved.
//

#import "DisplayInfoController.h"
#import "DisplayInfo.h"


/**
	The DisplayInfoController class acts as the data source and the delegate 
	for the table view. It initializes the selection for the table view and 
	stores any changes to the selection.
 */
@implementation DisplayInfoController



- (id)init {
	self = [super init];
	if (self != nil) {
		m_displayInfoTableView = nil; // Assigned in Interface Builder.
		// Preselect the main screen.
		m_selectedScreenIndex = [DisplayInfo indexOfScreen:[NSScreen mainScreen]];
		NSLog(@"%@ %@ --- %@, %d", self.className, NSStringFromSelector(_cmd), 
			  [DisplayInfo screenNameForScreen:[NSScreen mainScreen]], m_selectedScreenIndex); /* DEBUG LOG */
	}
	return self;
}


- (void)awakeFromNib {
	if (m_displayInfoTableView) {
		[m_displayInfoTableView selectRowIndexes:[NSIndexSet indexSetWithIndex:m_selectedScreenIndex] byExtendingSelection:NO];
	}
}


@synthesize displayInfoTableView = m_displayInfoTableView;


#pragma mark -
#pragma mark NSTableViewDataSource


- (NSInteger)numberOfRowsInTableView:(NSTableView*)tableView {
	return [[DisplayInfo screenNames] count];
}

- (id)tableView:(NSTableView*)tableView objectValueForTableColumn:(NSTableColumn*)tableColumn row:(NSInteger)rowIndex {
	return [[DisplayInfo screenNames] objectAtIndex:rowIndex];
}



#pragma mark -
#pragma mark NSTableViewDelegate

- (NSIndexSet*)tableView:(NSTableView*)tableView selectionIndexesForProposedSelection:(NSIndexSet*)proposedSelectionIndexes {
	m_selectedScreenIndex = [proposedSelectionIndexes lastIndex];
	NSLog(@"%@ %@ --- %@", self.className, NSStringFromSelector(_cmd), self); /* DEBUG LOG */
	return proposedSelectionIndexes;
}



#pragma mark -
#pragma mark NSObject

- (NSString*)description {
	return [NSString stringWithFormat:@"selectedScreenIndex = %d", m_selectedScreenIndex];
}


@end

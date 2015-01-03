//
//  AppDelegate.m
//  dexonline
//
//  Created by Radu Croitoru on 02/01/15.
//  Copyright (c) 2015 Radu Croitoru. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@property (strong, nonatomic) NSStatusItem *statusItem;
@property (unsafe_unretained) IBOutlet NSTextView *resultContainer;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotdification {
     [self setupStatusItem];
}

- (void)setupStatusItem {
    _statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    _statusItem.title = @"";
    _statusItem.image = [NSImage imageNamed:@"dexonlineIcon"];
    _statusItem.highlightMode = YES;
    _statusItem.toolTip = @"Caută cuvinte pe dexonline.ro";
    _statusItem.menu = menu;
}

- (IBAction)definitionSearchFieldCommit:(NSSearchField *)sender {
    NSString *searchKeyword = [sender stringValue];
    DexonlineParser *word = [[DexonlineParser alloc] initWithWord:searchKeyword andXpath:@"//span[@class='def']"];
    NSString *def = [word getAllDefinitions];
    [self.resultContainer setString:def];
}

- (IBAction)quitButtonClicked:(NSMenuItem *)sender {
    [[NSApplication sharedApplication] terminate:self.statusItem.menu];
}

@end

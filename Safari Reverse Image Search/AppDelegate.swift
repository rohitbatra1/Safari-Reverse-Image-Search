//
//  AppDelegate.swift
//  Safari Reverse Image Search
//
//  Created by Rohit Batra on 5/14/20.
//  Copyright © 2020 Rohit Batra. All rights reserved.
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    
    @IBAction func ReportAnIssue(_ sender: NSMenuItem) {
        if let url = URL(string: "https://github.com/rohitbatra1/Safari-Reverse-Image-Search/issues") {
            NSWorkspace.shared.open(url)
        }
    }
    
    @IBAction func LaunchContactWindow(_ sender: NSMenuItem) {
         // Create the SwiftUI view that provides the window contents.
       var ContactWindow: NSWindow!
       let contactView = ContactView()
     
       // Create the window and set the content view.
       ContactWindow = NSWindow(
           contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
           styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
           backing: .buffered, defer: false)
       ContactWindow.center()
       ContactWindow.setFrameAutosaveName("Contact Window")
       ContactWindow.contentView = NSHostingView(rootView: contactView)
       ContactWindow.makeKeyAndOrderFront(nil)
    }
    
}

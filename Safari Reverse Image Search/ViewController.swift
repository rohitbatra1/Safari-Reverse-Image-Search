//
//  ViewController.swift
//  Safari Reverse Image Search
//
//  Created by Rohit Batra on 5/14/20.
//  Copyright © 2020 Rohit Batra. All rights reserved.
//

import Cocoa
import SwiftUI
import SafariServices.SFSafariApplication

class ViewController: NSViewController {

    @IBOutlet var appNameLabel: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.appNameLabel.stringValue = "ImageFinder for Safari";
    }
    
    @IBAction func openSafariExtensionPreferences(_ sender: AnyObject?) {
        SFSafariApplication.showPreferencesForExtension(withIdentifier: "com.RohitBatra.Safari-Reverse-Image-Search.Extension") { error in
            if let _ = error {
                // Insert code to inform the user that something went wrong.

            }
        }
    }
    
    @IBAction func ReportAnIssue(_ sender: NSMenuItem) {
        if let url = URL(string: "https://github.com/rohitbatra1/Safari-Reverse-Image-Search/issues") {
            NSWorkspace.shared.open(url)
        }
    }
  
    
    @IBAction func LaunchContactWindow(_ sender: NSMenuItem) {
        let contact: ContactWindowController?
        contact = ContactWindowController.loadFromNib()
        contact?.showWindow(self)
    }
    
    
    

}

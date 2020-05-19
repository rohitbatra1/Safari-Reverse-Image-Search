//
//  SafariExtensionHandler.swift
//  Safari Reverse Image Search Extension
//
//  Created by Rohit Batra on 5/14/20.
//  Copyright © 2020 Rohit Batra. All rights reserved.
//

import SafariServices

class SafariExtensionHandler: SFSafariExtensionHandler {
    
    override func messageReceived(withName messageName: String, from page: SFSafariPage, userInfo: [String : Any]?) {
        // This method will be called when a content script provided by your extension calls safari.extension.dispatchMessage("message").
        page.getPropertiesWithCompletionHandler { properties in
            NSLog("The extension received a message (\(messageName)) from a script injected into (\(String(describing: properties?.url))) with userInfo (\(userInfo ?? [:]))")
        }
    }
    
    override func toolbarItemClicked(in window: SFSafariWindow) {
        // This method will be called when your toolbar item is clicked.
        NSLog("The extension's toolbar item was clicked")
        
    }
    
    override func validateToolbarItem(in window: SFSafariWindow, validationHandler: @escaping ((Bool, String) -> Void)) {
        // This is called when Safari's state changed in some way that would require the extension's toolbar item to be validated again.
        validationHandler(true, "")
    }
    
    override func validateContextMenuItem(withCommand command: String, in page: SFSafariPage, userInfo: [String : Any]? = nil, validationHandler: @escaping (Bool, String?) -> Void) {
        
//        show if image is selected
        validationHandler(false, nil)
        
//        hide menu item if image is not selected
//        validationHandler(true, nil)

    }
    
    override func contextMenuItemSelected(withCommand command: String, in page: SFSafariPage, userInfo: [String : Any]? = nil) {
        
        if (command == "Google"){
            
            
            var theLink = "http://images.google.com/searchbyimage?image_url="
            let imageLink = userInfo!["url"]
            theLink += imageLink as! String
            let myUrl = URL(string: theLink)!


            // This grabs the active window.
            SFSafariApplication.getActiveWindow { (activeWindow) in

                    // Request a new tab on the active window, with the URL we want.
                    activeWindow?.openTab(with: myUrl, makeActiveIfPossible: true, completionHandler: {_ in
                    })
                }
        }
        
    }
    
    override func popoverViewController() -> SFSafariExtensionViewController {
        return SafariExtensionViewController.shared
    }

}

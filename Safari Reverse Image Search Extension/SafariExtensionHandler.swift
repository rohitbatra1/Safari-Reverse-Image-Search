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
    
    override func validateContextMenuItem(withCommand command: String, in page: SFSafariPage, userInfo: [String : Any]? = nil, validationHandler: @escaping (Bool, String?) -> Void) {

//        show menu option if image is selected and image is not embedded
        if (userInfo!["isImage"] as! String == "IMG"){
            let x = userInfo!["url"] as! String
            
            if (!x.contains("data:image")){
                validationHandler(false, nil)
            }
            else{
                validationHandler(true, nil)
            }
        }
        else{
//            hide menu option if image is not selected
            validationHandler(true, nil)
        }

    }
    
    override func contextMenuItemSelected(withCommand command: String, in page: SFSafariPage, userInfo: [String : Any]? = nil) {
        
//        Handling when context menu option is selected.
        if (command == "Google"){
            
            var imageSearch = "http://images.google.com/searchbyimage?image_url="
            var imageLink = userInfo!["url"] as! String
            
            //percent encode image URL
            var allowedQueryParamAndKey = NSCharacterSet.urlQueryAllowed
            allowedQueryParamAndKey.remove(charactersIn: ";/?:@&=+$, ")
            imageLink = imageLink.addingPercentEncoding(withAllowedCharacters: allowedQueryParamAndKey)!
            
            imageSearch += imageLink
            let myUrl = URL(string: imageSearch)!

            
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

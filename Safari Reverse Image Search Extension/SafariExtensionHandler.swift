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
            
            if (!(userInfo!["url"] as! String).contains("data:image")){
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
    
    func openTab(newTabURL: URL){
        // This grabs the active window.
        SFSafariApplication.getActiveWindow { (activeWindow) in
            // Request a new tab on the active window, with the URL we want.
            activeWindow?.openTab(with: newTabURL, makeActiveIfPossible: true, completionHandler: {_ in
            })
        }
    }
    
    override func contextMenuItemSelected(withCommand command: String, in page: SFSafariPage, userInfo: [String : Any]? = nil) {
        
//        Handling when context menu option is selected.
        switch command {
            case "Google":
                var imageSearch = "http://images.google.com/searchbyimage?image_url="
                var imageLink = userInfo!["url"] as! String
                
                //percent encode image URL
                imageLink = imageLink.addingPercentEncoding(withAllowedCharacters: .alphanumerics)!
                
                imageSearch += imageLink
                let myURL = URL(string: imageSearch)!
                
                //open the search results in a new tab
                openTab(newTabURL: myURL)
            case "TinEye":
                var imageSearch = "https://tineye.com/search/?url="
                var imageLink = userInfo!["url"] as! String
                
                //percent encode image URL
                imageLink = imageLink.addingPercentEncoding(withAllowedCharacters: .alphanumerics)!
                
                imageSearch += imageLink
                let myURL = URL(string: imageSearch)!

                //open the search results in a new tab
                openTab(newTabURL: myURL)
            case "Bing":
                var imageSearch = "https://www.bing.com/images/search?view=detailv2&iss=sbi&sim=1&q=imgurl:"
                var imageLink = userInfo!["url"] as! String
                
                //percent encode image URL
                imageLink = imageLink.addingPercentEncoding(withAllowedCharacters: .alphanumerics)!
                
                imageSearch += imageLink
                let myURL = URL(string: imageSearch)!

                //open the search results in a new tab
                openTab(newTabURL: myURL)
            case "Yandex":
                var imageSearch = "https://yandex.com/images/search?img_url="
                var imageLink = userInfo!["url"] as! String
                
                //percent encode image URL
                imageLink = imageLink.addingPercentEncoding(withAllowedCharacters: .alphanumerics)!
                
                imageSearch += imageLink + "&rpt=imageview"
                let myURL = URL(string: imageSearch)!

                //open the search results in a new tab
                openTab(newTabURL: myURL)
            default:
                NSLog("Command not accounted for")
        }
    }

}

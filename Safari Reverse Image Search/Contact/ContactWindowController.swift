//
//  ContactWindowController.swift
//  Safari Reverse Image Search
//
//  Created by Rohit Batra on 5/15/20.
//  Copyright © 2020 Rohit Batra. All rights reserved.
//

import Cocoa
import Foundation


class ContactWindowController: NSWindowController {

    class func loadFromNib() -> ContactWindowController {
        return NSStoryboard(name: "Contact", bundle: nil).instantiateController(withIdentifier: "ContactWindowController") as! ContactWindowController
    }

}

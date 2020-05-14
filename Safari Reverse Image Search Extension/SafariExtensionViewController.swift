//
//  SafariExtensionViewController.swift
//  Safari Reverse Image Search Extension
//
//  Created by Rohit Batra on 5/14/20.
//  Copyright © 2020 Rohit Batra. All rights reserved.
//

import SafariServices

class SafariExtensionViewController: SFSafariExtensionViewController {
    
    static let shared: SafariExtensionViewController = {
        let shared = SafariExtensionViewController()
        shared.preferredContentSize = NSSize(width:320, height:240)
        return shared
    }()

}

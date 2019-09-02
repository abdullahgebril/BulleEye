//
//  Details.swift
//  BulleEye
//
//  Created by Abdullah Gebreil on 11/22/1440 AH.
//  Copyright © 1440 AH Abdullah Gebreil. All rights reserved.
//

import UIKit
import WebKit

class Details: UIViewController {

    @IBOutlet weak var webview:  WKWebView?
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if let htmlpath = Bundle.main.path(forResource: "BullsEye", ofType: "html") {
        let url = URL(fileURLWithPath: htmlpath)
        let request = URLRequest(url: url)
            webview?.load(request)
    }
    

    }
    @IBAction func close () {
        dismiss(animated: true, completion: nil)
    }
}

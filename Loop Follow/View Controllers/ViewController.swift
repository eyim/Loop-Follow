//
//  ViewController.swift
//  Loop Follow
//
//  Created by ali on 9/19/16.
//  Copyright © 2016 Ali Mazaheri. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
        @IBOutlet var webView: UIWebView!
        let refreshControl: UIRefreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let settings = Bundle.main.remoteSettings, AzureWebURL = settings?["AzureWebURL"]
        let url = URL (string: AzureWebURL!);
        let requestObj = URLRequest(url: url!);
        refreshControl.addTarget(self, action: #selector(refresh), for: UIControlEvents.valueChanged)
        
        webView.scrollView.addSubview(refreshControl)
        webView.loadRequest(requestObj);
    }
    
    func refresh(_ refresh: UIRefreshControl) {
        webView.reload()
        refresh.endRefreshing()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func RefreshWebView(_ sender: AnyObject) {
        webView.reload()
    }

    

}


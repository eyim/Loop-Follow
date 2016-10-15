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
        let settings = NSBundle.mainBundle().remoteSettings, AzureWebURL = settings?["AzureWebURL"]
        let url = NSURL (string: AzureWebURL!);
        let requestObj = NSURLRequest(URL: url!);
        refreshControl.addTarget(self, action: #selector(refresh), forControlEvents: UIControlEvents.ValueChanged)
        
        webView.scrollView.addSubview(refreshControl)
        webView.loadRequest(requestObj);
    }
    
    func refresh(refresh: UIRefreshControl) {
        webView.reload()
        refresh.endRefreshing()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func RefreshWebView(sender: AnyObject) {
        webView.reload()
    }

    

}


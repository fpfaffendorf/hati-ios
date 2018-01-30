//
//  WebViewController.swift
//  WebApp
//
//  Created by Rodrigo Mato on 09/01/2018.
//  Copyright © 2018 Rodrigo Mato. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    
    var serverUrl : String?
    @IBOutlet weak var webKitView: WKWebView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Init UI
        webKitView.navigationDelegate = self
        webKitView.allowsBackForwardNavigationGestures = true
        webKitView.backgroundColor = UIColor(displayP3Red: 67, green: 67, blue: 67, alpha: 1)
        webKitView.scrollView.backgroundColor = UIColor(displayP3Red: 67, green: 67, blue: 67, alpha: 1)
        spinner.isHidden = false
        spinner.startAnimating()
        
        // Load URL
        if let urlString = serverUrl {
            guard let url = URL(string: urlString) else {return}
            let request = URLRequest(url: url)

            webKitView.load(request)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Web Kit
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        handleError(error)
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        handleError(error)
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        spinner.stopAnimating()
        spinner.isHidden = true
    }
    
    func handleError(_ error: Error) {
//        if let failingUrl = error.userInfo["NSErrorFailingURLStringKey"] as? String {
//            if let url = NSURL(string: failingUrl) {
//                let didOpen = UIApplication.sharedApplication().openURL(url)
//                if didOpen {
//                    print("openURL succeeded")
//                    return
//                }
//            }
//        }
    }


}

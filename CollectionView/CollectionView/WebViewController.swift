//
//  WebViewController.swift
//  CollectionView
//
//  Created by rave on 10/20/21.
//

import UIKit
import WebKit

class WebViewController: UIViewController,WKNavigationDelegate, Coordinating {
    var coordinator: Coordinator?

  var urlStr = String()
    var titleStr = String()
    
    let  webView =  WKWebView()
   
   let defaultUrl = URL(string: "https://www.hackingwithswift.com")!
  //  webView.load(URLRequest(url: url))
  //  webView.allowsBackForwardNavigationGestures = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    //   webView.navigationDelegate = self
 
        // Do any additional setup after loading the view.
       // print("URL: \(urlStr)")
        let url = URL(string:urlStr)
        webView.load(URLRequest(url: url ?? defaultUrl))
        webView.allowsBackForwardNavigationGestures = true
       // webView.navigationDelegate = self
        view = webView
 

        
    }
 

}

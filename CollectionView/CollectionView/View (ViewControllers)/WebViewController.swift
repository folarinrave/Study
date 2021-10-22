//
//  WebViewController.swift
//  CollectionView
//
//  Created by Daniel Brannon on 10/20/21.
//
import UIKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate {
    var webView: WKWebView!
    var leURL: String?
    var delegate: ViewControllerDelegate?
    override func loadView() {
//        self.view.backgroundColor = .cyan
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let myRequest = URLRequest(url: URL(string: leURL!)!)
        webView.load(myRequest)
    }}

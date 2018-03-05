//
//  ViewController.swift
//  WKWebViewDemoApp
//
//  Created by Raymond Kim on 3/4/18.
//  Copyright © 2018 Raymond Kim. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let webView = WKWebView(frame: .zero)

        view.addSubview(webView)

        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        webView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        webView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        if let url = URL(string: "https://www.apple.com") {
            webView.load(URLRequest(url: url))
        }
    }


}


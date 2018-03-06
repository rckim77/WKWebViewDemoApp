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

        let config = WKWebViewConfiguration()
        let userContentController = WKUserContentController()

        // Add script message handlers that, when run, will make the function
        // window.webkit.messageHandlers.test.postMessage() available in all frames.
        userContentController.add(self, name: "test")
        
        config.userContentController = userContentController

        // Inject JavaScript into the webpage. You can specify when your script will be injected and for
        // which frames–all frames or the main frame only.
        let scriptSource = "window.webkit.messageHandlers.test.postMessage(`Hello, world!`);"
        let userScript = WKUserScript(source: scriptSource, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        userContentController.addUserScript(userScript)

        let webView = WKWebView(frame: .zero, configuration: config)

        view.addSubview(webView)

        let layoutGuide = view.safeAreaLayoutGuide

        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor).isActive = true
        webView.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor).isActive = true
        webView.topAnchor.constraint(equalTo: layoutGuide.topAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor).isActive = true

        // Make sure in Info.plist you set `NSAllowsArbitraryLoads` to `YES` to load
        // URLs with an HTTP connection. You can run a local server easily with services
        // such as MAMP.
        if let url = URL(string: "http://localhost:8888/test.html") {
            webView.load(URLRequest(url: url))
        }
    }
}

extension ViewController: WKScriptMessageHandler {
    // Capture postMessage() calls inside loaded JavaScript from the webpage. Note that a Boolean
    // will be parsed as a 0 for false and 1 for true in the message's body. See WebKit documentation:
    // https://developer.apple.com/documentation/webkit/wkscriptmessage/1417901-body.
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if let messageBody = message.body as? String {
            print(messageBody)
        }
    }


}


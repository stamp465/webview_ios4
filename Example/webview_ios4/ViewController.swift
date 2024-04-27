//
//  ViewController.swift
//  webview_ios4
//
//  Created by 40135787 on 04/28/2024.
//  Copyright (c) 2024 40135787. All rights reserved.
//

import UIKit
import webview_ios4
import WebKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // Create a button
        let button = UIButton(type: .system)
        button.setTitle("Go to Hello Page", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        // Center the button
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func buttonTapped() {
        Stamp().buttonTapped(navigationController: navigationController)
//        let helloViewController = NextViewController()
//        navigationController?.pushViewController(helloViewController, animated: true)
    }
}

//class Stamp {
//    @objc func buttonTapped(navigationController: UINavigationController?) {
//        let helloViewController = NextViewController()
//        navigationController?.pushViewController(helloViewController, animated: true)
//    }
//}

class NextViewController: UIViewController,WKUIDelegate {
    
    var webView: WKWebView!
        
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 16.0, *) {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back ing", image: nil,target: self, action: #selector(onBackButton_Clicked(sender:)))
        } else {
            // Fallback on earlier versions
        }
        
        let myURL = URL(string:"https://www.google.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)

    }
    
    // Back button events
    @objc func onBackButton_Clicked(sender: UIBarButtonItem)
    {
        print("Back tapping")
        if(webView.canGoBack) {
            print("Can go back")
            //Go back in webview history
            webView.goBack()
        } else {
            print("Can not go back")
            //Pop view controller to preview view controller
            self.navigationController?.popViewController(animated: true)
        }
    }

}


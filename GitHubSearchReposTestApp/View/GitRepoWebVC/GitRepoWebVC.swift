//
//  GitRepoWebVC.swift
//  GitHubSearchReposTestApp
//
//  Created by Ivan Stebletsov on 19/04/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import UIKit
import WebKit

class GitRepoWebVC: UIViewController {

    // MARK: - Properties
    var url: URL? = nil
    
    // MARK: - UI elements
    var webView: WKWebView!
    
    // MARK: - Life cicle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        makeWebView()
        addGestureRecognizer()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let url = url else { return }
        
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

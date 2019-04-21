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
    var animatedView: UIView!
    var refteshButton: UIButton!
    var forwardButton: UIButton!
    var backButton: UIButton!
    var unwindButton: UIButton!
    var activityIndicatorBackgroundView: UIView!
    var activityIndicatorView: UIActivityIndicatorView!
    
    // MARK: - Life cicle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        
        makeWebView()
        makeRefreshActivityIndicator()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let url = url else { return }

        let request = URLRequest(url: url)
        webView.load(request)
        makeAnimatedBackground()
        makeRefreshButton()
        makeForwardButton()
        makeBackButton()
        makeUnwindButton()
    }
    
}

//
//  GitRepoWebVCExtension.swift
//  GitHubSearchReposTestApp
//
//  Created by Ivan Stebletsov on 19/04/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import UIKit
import WebKit

extension GitRepoWebVC {
    
    // MARK: - UI Configuration
    func makeWebView() {
        webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(webView)
        
        let webViewConstarints = [
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)]
        NSLayoutConstraint.activate(webViewConstarints)
    }
    
    // MARK: - Gesture recognizer
    func addGestureRecognizer() {
        let slideDown = UISwipeGestureRecognizer(target: self, action: #selector(unwindGitRepoWebVC))
        slideDown.direction = .right
        webView.addGestureRecognizer(slideDown)
        view.addGestureRecognizer(slideDown)
    }
    
    // MARK: - Transition method
    @objc func unwindGitRepoWebVC() {
        self.dismiss(animated: true, completion: nil)
    }
}

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
    func makeAnimatedBackground() {
        animatedView = UIView()
        animatedView.frame = view.frame
        animatedView.backgroundColor = .black
        animatedView.alpha = 0
        
        view.insertSubview(animatedView, at: 0)
        
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.animatedView.alpha = 0.5
        }
    }
    
    func makeWebView() {
        webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        webView.layer.cornerRadius = 25
        webView.layer.masksToBounds = true
        webView.layer.shouldRasterize = true
        webView.layer.rasterizationScale = UIScreen.main.nativeScale
        webView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        webView.layer.shadowOpacity = 0.1
        webView.layer.shadowRadius = 3
        webView.layer.shadowOffset = CGSize(width: 0, height: 0)

        view.addSubview(webView)
        
        let webViewConstarints = [
            webView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            webView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            webView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95),
            webView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.9)]
        NSLayoutConstraint.activate(webViewConstarints)
    }
    
    // MARK: - Gesture recognizer
    func addGestureRecognizer() {
        let slideDown = UISwipeGestureRecognizer(target: self, action: #selector(unwindGitRepoWebVC))
        slideDown.direction = .right
        webView.addGestureRecognizer(slideDown)
        view.addGestureRecognizer(slideDown)
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(unwindGitRepoWebVC))
        tapRecognizer.cancelsTouchesInView = false
    }
    
    // MARK: - Transition method
    @objc func unwindGitRepoWebVC() {
        UIView.animate(withDuration: 0.5,
                       animations: { [weak self] in
                        self?.animatedView.alpha = 0 }) { (_) in
                            self.dismiss(animated: true, completion: nil) }
    }
}

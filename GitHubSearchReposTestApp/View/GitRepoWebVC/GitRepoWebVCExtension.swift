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
        
        webView.layer.cornerRadius = 25
        webView.layer.masksToBounds = true
        webView.layer.shouldRasterize = true
        webView.layer.rasterizationScale = UIScreen.main.nativeScale
        webView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        webView.layer.shadowOpacity = 0.1
        webView.layer.shadowRadius = 3
        webView.layer.shadowOffset = CGSize(width: 0, height: 0)
        webView.navigationDelegate = self
        
        view.addSubview(webView)
        
        let webViewConstarints = [
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            webView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            webView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90)]
        NSLayoutConstraint.activate(webViewConstarints)
    }
    
    func makeAnimatedBackground() {
        animatedView = UIView()
        animatedView.translatesAutoresizingMaskIntoConstraints = false
        animatedView.backgroundColor = .black
        animatedView.alpha = 0
        
        view.insertSubview(animatedView, at: 0)
        
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.animatedView.alpha = 0.5
        }
        
        let animatedViewConstraints = [
            animatedView.topAnchor.constraint(equalTo: view.topAnchor),
            animatedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            animatedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            animatedView.bottomAnchor.constraint(equalTo: view.bottomAnchor)]
        NSLayoutConstraint.activate(animatedViewConstraints)
    }
    
    func makeRefreshButton() {
        refteshButton = UIButton()
        refteshButton.translatesAutoresizingMaskIntoConstraints = false
        
        refteshButton.layer.cornerRadius = 25
        refteshButton.backgroundColor = #colorLiteral(red: 0.1405375302, green: 0.1605641544, blue: 0.1772543788, alpha: 1)
        refteshButton.layer.shouldRasterize = true
        refteshButton.layer.rasterizationScale = UIScreen.main.nativeScale
        refteshButton.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        refteshButton.layer.shadowOpacity = 0.1
        refteshButton.layer.shadowRadius = 3
        refteshButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        let image = UIImage(named: "refresh")
        let tintedImage = image?.withRenderingMode(.alwaysTemplate)
        refteshButton.setImage(tintedImage, for: .normal)
        refteshButton.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        refteshButton.addTarget(self, action: #selector(refreshWebView), for: .touchUpInside)
        
        view.addSubview(refteshButton)
        
        let refteshButtonConstraints = [
            refteshButton.heightAnchor.constraint(equalToConstant: 50),
            refteshButton.widthAnchor.constraint(equalTo: refteshButton.heightAnchor),
            refteshButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            refteshButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)]
        NSLayoutConstraint.activate(refteshButtonConstraints)
    }
    
    func makeForwardButton() {
        forwardButton = UIButton(frame: refteshButton.bounds)
        forwardButton.translatesAutoresizingMaskIntoConstraints = false
        
        forwardButton.layer.cornerRadius = 25
        forwardButton.backgroundColor = #colorLiteral(red: 0.1405375302, green: 0.1605641544, blue: 0.1772543788, alpha: 1)
        forwardButton.layer.shouldRasterize = true
        forwardButton.layer.rasterizationScale = UIScreen.main.nativeScale
        forwardButton.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        forwardButton.layer.shadowOpacity = 0.1
        forwardButton.layer.shadowRadius = 3
        forwardButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        forwardButton.alpha = 0
        forwardButton.isEnabled = false
        
        let image = UIImage(named: "forward")
        let tintedImage = image?.withRenderingMode(.alwaysTemplate)
        forwardButton.setImage(tintedImage, for: .normal)
        forwardButton.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        forwardButton.addTarget(self, action: #selector(goForwardWebView), for: .touchUpInside)
        
        view.addSubview(forwardButton)
        
        let forwardButtonConstraints = [
            forwardButton.centerYAnchor.constraint(equalTo: refteshButton.centerYAnchor),
            forwardButton.trailingAnchor.constraint(equalTo: refteshButton.leadingAnchor, constant: -20),
            forwardButton.heightAnchor.constraint(equalToConstant: 50),
            forwardButton.widthAnchor.constraint(equalTo: forwardButton!.heightAnchor)]
        NSLayoutConstraint.activate(forwardButtonConstraints)
        
        UIView.animate(withDuration: 0.2,
                       delay: 0.2,
                       options: .curveEaseOut,
                       animations: { [weak self] in
                        guard let self = self else { return }
                        self.forwardButton.alpha = 1 },
                       completion: nil)
    }
    
    func makeBackButton() {
        backButton = UIButton(frame: refteshButton.bounds)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        backButton.layer.cornerRadius = 25
        backButton.backgroundColor = #colorLiteral(red: 0.1405375302, green: 0.1605641544, blue: 0.1772543788, alpha: 1)
        backButton.layer.shouldRasterize = true
        backButton.layer.rasterizationScale = UIScreen.main.nativeScale
        backButton.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        backButton.layer.shadowOpacity = 0.1
        backButton.layer.shadowRadius = 3
        backButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        backButton.alpha = 0
        backButton.isEnabled = false
        
        let image = UIImage(named: "back")
        let tintedImage = image?.withRenderingMode(.alwaysTemplate)
        backButton.setImage(tintedImage, for: .normal)
        backButton.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        backButton.addTarget(self, action: #selector(goBackWebView), for: .touchUpInside)
        
        view.addSubview(backButton)
        
        let backButtonConstraints = [
            backButton.centerYAnchor.constraint(equalTo: refteshButton.centerYAnchor),
            backButton.trailingAnchor.constraint(equalTo: forwardButton.leadingAnchor, constant: -20),
            backButton.heightAnchor.constraint(equalToConstant: 50),
            backButton.widthAnchor.constraint(equalTo: forwardButton!.heightAnchor)]
        NSLayoutConstraint.activate(backButtonConstraints)
        
        UIView.animate(withDuration: 0.2,
                       delay: 0.4,
                       options: .curveEaseOut,
                       animations: { [weak self] in
                        guard let self = self else { return }
                        self.backButton.alpha = 1 },
                       completion: nil)
    }
    
    func makeUnwindButton() {
        unwindButton = UIButton(frame: refteshButton.bounds)
        unwindButton.translatesAutoresizingMaskIntoConstraints = false
        
        unwindButton.layer.cornerRadius = 25
        unwindButton.backgroundColor = #colorLiteral(red: 0.1405375302, green: 0.1605641544, blue: 0.1772543788, alpha: 1)
        unwindButton.layer.shouldRasterize = true
        unwindButton.layer.rasterizationScale = UIScreen.main.nativeScale
        unwindButton.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        unwindButton.layer.shadowOpacity = 0.1
        unwindButton.layer.shadowRadius = 3
        unwindButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        unwindButton.alpha = 0
        
        let image = UIImage(named: "close")
        let tintedImage = image?.withRenderingMode(.alwaysTemplate)
        unwindButton.setImage(tintedImage, for: .normal)
        unwindButton.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        unwindButton.addTarget(self, action: #selector(unwindkWebView), for: .touchUpInside)
        
        view.addSubview(unwindButton)
        
        let unwindButtonConstraints = [
            unwindButton.centerYAnchor.constraint(equalTo: refteshButton.centerYAnchor),
            unwindButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            unwindButton.heightAnchor.constraint(equalToConstant: 50),
            unwindButton.widthAnchor.constraint(equalTo: forwardButton!.heightAnchor)]
        NSLayoutConstraint.activate(unwindButtonConstraints)
        
        UIView.animate(withDuration: 0.2,
                       delay: 0.8,
                       options: .curveEaseOut,
                       animations: { [weak self] in
                        guard let self = self else { return }
                        self.unwindButton.alpha = 1 },
                       completion: nil)
    }
    
    func makeRefreshActivityIndicator() {
        activityIndicatorBackgroundView = UIView()
        activityIndicatorBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorBackgroundView.backgroundColor = #colorLiteral(red: 0.2464401722, green: 0.2665367723, blue: 0.2790757418, alpha: 1)
        activityIndicatorBackgroundView.alpha = 0.8
        activityIndicatorBackgroundView.layer.cornerRadius = 15
        activityIndicatorBackgroundView.isHidden = true
        activityIndicatorBackgroundView.layer.shouldRasterize = true
        activityIndicatorBackgroundView.layer.rasterizationScale = UIScreen.main.nativeScale
        
        view.addSubview(activityIndicatorBackgroundView)
        
        let activityIndicatorBackgroundViewConstraints = [
            activityIndicatorBackgroundView.centerYAnchor.constraint(equalTo: webView.centerYAnchor),
            activityIndicatorBackgroundView.centerXAnchor.constraint(equalTo: webView.centerXAnchor),
            activityIndicatorBackgroundView.widthAnchor.constraint(equalToConstant: 60),
            activityIndicatorBackgroundView.heightAnchor.constraint(equalTo: activityIndicatorBackgroundView.widthAnchor)]
        NSLayoutConstraint.activate(activityIndicatorBackgroundViewConstraints)
        
        activityIndicatorView = UIActivityIndicatorView(style: .white)
        activityIndicatorView.tintColor = .white
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.startAnimating()
        activityIndicatorView.isHidden = true
        
        activityIndicatorBackgroundView.addSubview(activityIndicatorView)
        
        let activityIndicatorViewConstraints = [
            activityIndicatorView.centerYAnchor.constraint(equalTo: activityIndicatorBackgroundView.centerYAnchor),
            activityIndicatorView.centerXAnchor.constraint(equalTo: activityIndicatorBackgroundView.centerXAnchor)]
        NSLayoutConstraint.activate(activityIndicatorViewConstraints)
    }
    
    func presentAlertController(_ error: Error) {
        let alertController = UIAlertController(title: error.localizedDescription, message: nil, preferredStyle: .alert)
        let okAlertAction = UIAlertAction(title: "OK", style: .default) { [weak self] (_) in
            guard let self = self else { return }
            self.unwindGitRepoWebVC()
        }
        alertController.addAction(okAlertAction)
        present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - Transition method
    @objc func unwindGitRepoWebVC() {
        
        UIView.animate(withDuration: 0.5,
                       animations: { [weak self] in
                        guard let self = self else { return }
                        self.unwindButton.alpha = 0
                        self.backButton.alpha = 0
                        self.forwardButton.alpha = 0
                        self.refteshButton.alpha = 0
                        self.webView.alpha = 0
                        self.animatedView.alpha = 0 }) { (_) in
                            self.dismiss(animated: true, completion: nil) }
    }
    
    // MARK: - WebView hamdling
    @objc func goBackWebView() {
        print(#function)
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @objc func goForwardWebView() {
        print(#function)
        if webView.canGoBack {
            webView.goForward()
        }
    }
    
    @objc func refreshWebView() {
        print(#function)
        webView.reload()
    }
    
    @objc func unwindkWebView() {
        print(#function)
        unwindGitRepoWebVC()
    }
}

extension GitRepoWebVC: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activityIndicatorBackgroundView.isHidden = false
        activityIndicatorView.isHidden = false
        
        backButton.isEnabled = false
        forwardButton.isEnabled = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicatorBackgroundView.isHidden = true
        activityIndicatorView.isHidden = true
        
        if webView.canGoBack {
            backButton.isEnabled = true
        }
        
        if webView.canGoForward {
            forwardButton.isEnabled = true
        }
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        presentAlertController(error)
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        presentAlertController(error)
    }
    
}

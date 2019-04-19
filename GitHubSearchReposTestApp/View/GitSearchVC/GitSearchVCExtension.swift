//
//  GitSearchVCExtension.swift
//  GitHubSearchReposTestApp
//
//  Created by Ivan Stebletsov on 16/04/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import UIKit

extension GitSearchVC {
    
    // MARK: - UI Configuration
    func makeNavigationBarAdjustments() {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = "GitHub"
    }
    
    func makeSearchResultsTableView() {
        searchResultsTableView = UITableView()
        searchResultsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        searchResultsTableView.backgroundColor = #colorLiteral(red: 0.9643666148, green: 0.9724945426, blue: 0.9806874394, alpha: 1)
        searchResultsTableView.separatorStyle = .none
        searchResultsTableView.register(GitRepoTVC.self, forCellReuseIdentifier: cellId)
        
        searchResultsTableView.delegate = self
        searchResultsTableView.dataSource = self
        
        view.addSubview(searchResultsTableView)
        
        let safeArea = view.safeAreaLayoutGuide
        
        let searchResultsTableViewConstraints = [
            searchResultsTableView.topAnchor.constraint(equalTo: view.topAnchor),
            searchResultsTableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            searchResultsTableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            searchResultsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)]
        NSLayoutConstraint.activate(searchResultsTableViewConstraints)
    }
    
    func makeSearchBar() {
        searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
        searchBar.sizeToFit()
        searchBar.delegate = self
        searchBar.placeholder = "Search"
        navigationItem.titleView = searchBar
    }
    
    // MARK: - Gesture recognizer
    func addGestureRecognizer() {
        let slideDown = UISwipeGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        slideDown.direction = .down
        searchResultsTableView.addGestureRecognizer(slideDown)
        view.addGestureRecognizer(slideDown)
    }
    
    // MARK: - Dismiss keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func hideKeyboardByTapAnywhere() {
        searchResultsTableView.keyboardDismissMode = .interactive
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapRecognizer.cancelsTouchesInView = false
        searchResultsTableView.addGestureRecognizer(tapRecognizer)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}

// MARK: - GitSearchVCDelegate methods
extension GitSearchVC: GitSearchVCDelegate {
    
    func reloadTableViewData() {
        searchResultsTableView.reloadData()
    }
    
    func moreDataFetched() {
        needFetchMoreData = false
    }
    
}

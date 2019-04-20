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
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.1405375302, green: 0.1605641544, blue: 0.1772543788, alpha: 1)
        navigationItem.title = "GitHub"
    }
    
    func makeSearchResultsTableView() {
        searchResultsTableView = UITableView()
        searchResultsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        searchResultsTableView.backgroundColor = #colorLiteral(red: 0.9643666148, green: 0.9724945426, blue: 0.9806874394, alpha: 1)
        searchResultsTableView.separatorStyle = .none
        searchResultsTableView.register(GitRepoTVC.self, forCellReuseIdentifier: cellId)
        searchResultsTableView.register(StubGitRepoTVC.self, forCellReuseIdentifier: stubCellId)
        
        searchResultsTableView.delegate = self
        searchResultsTableView.dataSource = self
        searchResultsTableView.prefetchDataSource = self
        
        view.addSubview(searchResultsTableView)
        
        let safeArea = view.safeAreaLayoutGuide
        
        let searchResultsTableViewConstraints = [
            searchResultsTableView.topAnchor.constraint(equalTo: view.topAnchor),
            searchResultsTableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            searchResultsTableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            searchResultsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)]
        NSLayoutConstraint.activate(searchResultsTableViewConstraints)
    }
    
    func makeGitLogo() {
        gitLogoImageView = UIImageView()
        gitLogoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let image = UIImage(named: "github")
        gitLogoImageView.image = image
        gitLogoImageView.alpha = 0.2
        gitLogoImageView.contentMode = .scaleAspectFit
        searchResultsTableView.addSubview(gitLogoImageView)
        
        let gitLogoImageViewConstraints = [
            gitLogoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            gitLogoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gitLogoImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4)]
        NSLayoutConstraint.activate(gitLogoImageViewConstraints)
    }
    
    func makeSearchBar() {
        searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
        searchBar.sizeToFit()
        searchBar.delegate = self
        searchBar.placeholder = "Search"
        navigationItem.titleView = searchBar
        
        if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
            textfield.textColor = .white
            textfield.font = .boldSystemFont(ofSize: 18)
            textfield.backgroundColor = .clear
            textfield.tintColor = #colorLiteral(red: 0.5525485873, green: 0.5647159219, blue: 0.5688534379, alpha: 1)
            textfield.leftView = nil
            
            if let backgroundview = textfield.subviews.first {
                backgroundview.backgroundColor = #colorLiteral(red: 0.2464401722, green: 0.2665367723, blue: 0.2790757418, alpha: 1)
                backgroundview.layer.cornerRadius = 5
                backgroundview.clipsToBounds = true
                
                activityIndicatorView = UIActivityIndicatorView()
                activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
                
                activityIndicatorView.isHidden = true
                
                backgroundview.addSubview(activityIndicatorView)
                
                let activityIndicatorViewConstraints = [
                    activityIndicatorView.centerYAnchor.constraint(equalTo: backgroundview.centerYAnchor),
                    activityIndicatorView.trailingAnchor.constraint(equalTo: backgroundview.trailingAnchor, constant: -30)]
                NSLayoutConstraint.activate(activityIndicatorViewConstraints)
            }
        }
        
        let image = UIImage(named: "githublight")
        let barItemImage = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(clearSearchResultsTableView))
        barItemImage.tintColor = .white
        navigationItem.leftBarButtonItem = barItemImage
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
    
    @objc func clearSearchResultsTableView() {
        searchResultsTVVM.removeOldFetchedRepos()
        needFetchMoreData = true
        searchResultsTableView.reloadData()
    }
    
    // MARK: - Helpers methods for prefetching
    func needLoadingCell(for indexPath: IndexPath) -> Bool {
        return indexPath.row >= searchResultsTVVM.currentCount!
    }
    
    func visibleIndexPathsToReload(intersecting indexPaths: [IndexPath]) -> [IndexPath] {
        let indexPathsForVisibleRows = searchResultsTableView.indexPathsForVisibleRows ?? []
        let indexPathsIntersection = Set(indexPathsForVisibleRows).intersection(indexPaths)
        return Array(indexPathsIntersection)
    }
}

// MARK: - GitSearchVCDelegate methods
extension GitSearchVC: GitSearchVCDelegate {
    
    func handleActivityIndicator(_ state: ActivityIndicatorStates) {
        switch state {
        case .activate:
            activityIndicatorView.startAnimating()
            activityIndicatorView.isHidden = false
        case .deactivate:
            activityIndicatorView.stopAnimating()
            activityIndicatorView.isHidden = true
        }
    }
    
    func reloadTableViewCells(with newIndexPathsToReload: [IndexPath]) {
        guard newIndexPathsToReload.count > 30 else {
            searchResultsTableView.reloadData()
            return
        }
        let indexPathsToReload = visibleIndexPathsToReload(intersecting: newIndexPathsToReload)
        searchResultsTableView.reloadRows(at: indexPathsToReload, with: .fade)
    }
    
    func moreDataFetched() {
        needFetchMoreData = false
    }
    
    func needMoreDataRepeatRequest() {
        needFetchMoreData = true
    }
    
    func presentAlertController(_ error: DataResponseError) {
        let alertController = UIAlertController(title: error.reason, message: nil, preferredStyle: .alert)
        let okAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAlertAction)
        
        DispatchQueue.main.async { [weak self] in
            self?.present(alertController, animated: true, completion: nil)
        }
    }
    
}

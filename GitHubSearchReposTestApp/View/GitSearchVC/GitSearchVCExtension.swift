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
        navigationController?.navigationBar.barStyle = .black
        navigationItem.title = "GitHub"
    }
    
    func makeSearchResultsTableView() {
        searchResultsTableView = UITableView()
        searchResultsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        searchResultsTableView.backgroundColor = #colorLiteral(red: 0.9643666148, green: 0.9724945426, blue: 0.9806874394, alpha: 1)
        searchResultsTableView.separatorStyle = .none
        searchResultsTableView.rowHeight = UITableView.automaticDimension
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
            gitLogoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -(navigationController?.navigationBar.frame.height)! - 5),
            gitLogoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gitLogoImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4)]
        NSLayoutConstraint.activate(gitLogoImageViewConstraints)
    }
    
    func makeFilterButton() {
        let filterButton = UIButton()
        filterButton.translatesAutoresizingMaskIntoConstraints = false
        
        filterButton.layer.cornerRadius = 25
        filterButton.backgroundColor = #colorLiteral(red: 0.1405375302, green: 0.1605641544, blue: 0.1772543788, alpha: 1)
        filterButton.layer.shouldRasterize = true
        filterButton.layer.rasterizationScale = UIScreen.main.nativeScale
        filterButton.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        filterButton.layer.shadowOpacity = 0.1
        filterButton.layer.shadowRadius = 3
        filterButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        let image = UIImage(named: "filterSettings")
        let tintedImage = image?.withRenderingMode(.alwaysTemplate)
        filterButton.setImage(tintedImage, for: .normal)
        filterButton.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        filterButton.addTarget(self, action: #selector(presentGitSearchFilterVC), for: .touchUpInside)
        
        view.addSubview(filterButton)
        
        let filterButtonConstraints = [
            filterButton.heightAnchor.constraint(equalToConstant: 50),
            filterButton.widthAnchor.constraint(equalTo: filterButton.heightAnchor),
            filterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            filterButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)]
        NSLayoutConstraint.activate(filterButtonConstraints)
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
        searchResultsTVVM.clearLastRequestText()
        searchResultsTVVM.saveSelectedLanguage(0)
        searchResultsTVVM.fetchDataWithFilter("Default")
        needFetchMoreData = false
        searchResultsTableView.reloadData()
        selectedLanguageRow = 0
        cellHeightsDictionary.removeAll()
        searchBar.text = ""
    }
    
    // MARK: - Helpers methods for prefetching
    func needLoadingCell(for indexPath: IndexPath) -> Bool {
        return indexPath.row >= searchResultsTVVM.currentCountFetchedRepos()
    }
    
    func visibleIndexPathsToReload(intersecting indexPaths: [IndexPath]) -> [IndexPath] {
        let indexPathsForVisibleRows = searchResultsTableView.indexPathsForVisibleRows ?? []
        let indexPathsIntersection = Set(indexPathsForVisibleRows).intersection(indexPaths)
        return Array(indexPathsIntersection)
    }
    
    // MARK: - Present GitSearchFilterVC
    @objc func presentGitSearchFilterVC() {
        let gitSearchFilterVC = GitSearchFilterVC()
        gitSearchFilterVC.gitSearchFilterVCVM = GitSearchFilterVCVM(view: gitSearchFilterVC, searchResultsTVVM: searchResultsTVVM)
        gitSearchFilterVC.modalPresentationStyle = .overCurrentContext
        
        present(gitSearchFilterVC, animated: true, completion: nil)
    }
}

// MARK: - GitSearchVCDelegate methods
extension GitSearchVC: GitSearchVCDelegate {
    
    func scrollTableViewToTop() {
        searchResultsTableView.setContentOffset(.zero, animated: false)
        searchBar.resignFirstResponder()
    }
    
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
        if searchResultsTVVM.isFirstFetchedPage() {
            cellHeightsDictionary.removeAll()
            scrollTableViewToTop()
            searchResultsTableView.reloadData()
        } else {
            let indexPathsToReload = visibleIndexPathsToReload(intersecting: newIndexPathsToReload)
            guard !indexPathsToReload.isEmpty else { return }
            searchResultsTableView.reloadRows(at: indexPathsToReload, with: .fade)
            moreDataFetched()
        }
    }
    
    func moreDataFetched() {
        needFetchMoreData = false
    }
    
    func presentAlertController(_ error: Error) {
        var errorMessage = error.localizedDescription
        if let errorMessageEndIndex = errorMessage.firstIndex(of: ":") {
            errorMessage = String(errorMessage.prefix(upTo: errorMessageEndIndex))
        }

        let alertController = UIAlertController(title: errorMessage, message: nil, preferredStyle: .alert)
        let okAlertAction = UIAlertAction(title: "ОК", style: .default) { [weak self ] (_) in
            guard let self = self else { return }
            self.handleActivityIndicator(.deactivate)
        }
        
        alertController.addAction(okAlertAction)
        
        DispatchQueue.main.async { [weak self] in
            self?.present(alertController, animated: true, completion: nil)
        }
    }
    
}

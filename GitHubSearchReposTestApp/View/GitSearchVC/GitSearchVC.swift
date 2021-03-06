//
//  GitSearchVC.swift
//  GitHubSearchReposTestApp
//
//  Created by Ivan Stebletsov on 16/04/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import UIKit

class GitSearchVC: UIViewController {
    
    // MARK: - Properties
    var searchResultsTVVM: SearchResultsTVVMProtocol!
    var needFetchMoreData = false
    let cellId = "cellId"
    let stubCellId = "stubCellId"
    var cellHeightsDictionary = [IndexPath: CGFloat]()
    var selectedLanguageRow = 0
    
    // MARK: - UI elements
    var searchResultsTableView: UITableView!
    var searchBar: UISearchBar!
    var activityIndicatorView: UIActivityIndicatorView!
    var gitLogoImageView: UIImageView!
    
    // MARK: - Life cicle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9643666148, green: 0.9724945426, blue: 0.9806874394, alpha: 1)
        self.setNeedsStatusBarAppearanceUpdate()
        
        searchResultsTVVM = SearchResultsTVVM(view: self)
        
        makeNavigationBarAdjustments()
        makeSearchResultsTableView()
        makeGitLogo()
        makeSearchBar()
        makeFilterButton()
        addGestureRecognizer()
        hideKeyboardByTapAnywhere()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}


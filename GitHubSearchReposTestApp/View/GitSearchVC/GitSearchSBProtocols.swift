//
//  GitSearchSBProtocols.swift
//  GitHubSearchReposTestApp
//
//  Created by Ivan Stebletsov on 17/04/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import UIKit

extension GitSearchVC: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard !searchBar.text!.isEmpty else { return }
        
        self.handleActivityIndicator(.activate)
        guard let searchText = searchBar.text else { return }
        guard let viewModel = searchResultsTVVM else { return }
        
        viewModel.saveLastSearchText(searchText)
        viewModel.removeOldFetchedRepos()
        viewModel.fetchDataFor(searchText, nil)
        
        searchBar.resignFirstResponder()
    }
}

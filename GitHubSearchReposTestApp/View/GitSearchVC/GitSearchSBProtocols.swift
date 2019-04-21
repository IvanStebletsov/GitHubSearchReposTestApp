//
//  GitSearchSBProtocols.swift
//  GitHubSearchReposTestApp
//
//  Created by Ivan Stebletsov on 17/04/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import UIKit

extension GitSearchVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        pendingRequestWorkItem?.cancel()
        
        let requestWorkItem = DispatchWorkItem { [weak self] in
            guard let self = self else { return }
            
            self.handleActivityIndicator(.activate)
            guard let searchText = searchBar.text else { return }
            guard let viewModel = self.searchResultsTVVM else { return }
            
            viewModel.saveLastSearchText(searchText)
            viewModel.removeOldFetchedRepos()
            viewModel.fetchDataFor(searchText, forPageNumber: 1)
        }
        
        guard !searchBar.text!.isEmpty else { return }
        
        pendingRequestWorkItem = requestWorkItem
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8, execute: requestWorkItem)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        pendingRequestWorkItem?.cancel()
        guard !searchBar.text!.isEmpty else { return }
        
        self.handleActivityIndicator(.activate)
        guard let searchText = searchBar.text else { return }
        guard let viewModel = searchResultsTVVM else { return }
        
        viewModel.saveLastSearchText(searchText)
        viewModel.removeOldFetchedRepos()
        viewModel.fetchDataFor(searchText, forPageNumber: 1)
        
        pendingRequestWorkItem?.perform()
        
        searchBar.resignFirstResponder()
    }
}

//
//  SearchResultsTVProtocols.swift
//  GitHubSearchReposTestApp
//
//  Created by Ivan Stebletsov on 17/04/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import UIKit

extension GitSearchVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResultsTVVM.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? GitRepoTVC else { return UITableViewCell() }
        
        cell.gitRepoTVCVM = searchResultsTVVM.cellViewModel(forIndexPath: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        let gitRepoWebVC = GitRepoWebVC()
        gitRepoWebVC.url = searchResultsTVVM.selectRow(atIndexPath: indexPath)
        
        present(gitRepoWebVC, animated: true, completion: nil)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollViewOffSet = scrollView.contentOffset.y
        let scrollViewContentSize = scrollView.contentSize.height
        let scrollViewHeight = scrollView.frame.height
        
        if scrollViewOffSet >= scrollViewContentSize - scrollViewHeight * 4 && !needFetchMoreData {
            needFetchMoreData = true
            print("Need more data")
            searchResultsTVVM.tryFetchMoreData()
        }
    }
    
}

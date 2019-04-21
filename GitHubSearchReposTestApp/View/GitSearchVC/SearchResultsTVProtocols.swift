//
//  SearchResultsTVProtocols.swift
//  GitHubSearchReposTestApp
//
//  Created by Ivan Stebletsov on 17/04/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import UIKit

extension GitSearchVC: UITableViewDelegate, UITableViewDataSource, UITableViewDataSourcePrefetching {
    
    // MARK: - UITableViewDataSource / Delegate protocols
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch searchResultsTVVM.numberOfRows() {
        case 0:
            gitLogoImageView.isHidden = false
        default:
            gitLogoImageView.isHidden = true
        }
        return searchResultsTVVM.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? GitRepoTVC else { return UITableViewCell() }
        guard let stubCell = tableView.dequeueReusableCell(withIdentifier: stubCellId, for: indexPath) as? StubGitRepoTVC else { return UITableViewCell() }
        
        if needLoadingCell(for: indexPath) {
            return stubCell
        } else {
            cell.gitRepoTVCVM = searchResultsTVVM.viewModelForSell(forIndexPath: indexPath)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        guard !needLoadingCell(for: indexPath) else { return }
        
        let gitRepoWebVC = GitRepoWebVC()
        gitRepoWebVC.modalPresentationStyle = .overCurrentContext
        gitRepoWebVC.url = searchResultsTVVM.selectRow(atIndexPath: indexPath)
        present(gitRepoWebVC, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if needLoadingCell(for: indexPath) {
            guard let cell = cell as? StubGitRepoTVC else { return }
            
            cell.stubRepoIconView.alpha = 1
            cell.stubRepoNameLabelView.alpha = 1
            cell.stubRepoDescriptionLabelView.alpha = 1
            cell.stubLanguageColorView.alpha = 1
            cell.stubRepoProgrammingLanguageLabelView.alpha = 1
            cell.stubStarIconView.alpha = 1
            cell.stubStarRatingLabelView.alpha = 1
            
            UIView.animateKeyframes(withDuration: 1,
                                    delay: 0,
                                    options: [.autoreverse, .repeat],
                                    animations: {
                                        cell.stubRepoIconView.alpha = 0.5
                                        cell.stubRepoNameLabelView.alpha = 0.5
                                        cell.stubRepoDescriptionLabelView.alpha = 0.5
                                        cell.stubLanguageColorView.alpha = 0.5
                                        cell.stubRepoProgrammingLanguageLabelView.alpha = 0.5
                                        cell.stubStarIconView.alpha = 0.5
                                        cell.stubStarRatingLabelView.alpha = 0.5 },
                                    completion: nil)}
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        searchBar.text = ""
    }
    
    // MARK: - UITableViewDataSourcePrefetching protocls
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        
        if indexPaths.contains(where: needLoadingCell) && !needFetchMoreData {
            needFetchMoreData = true
            searchResultsTVVM.tryFetchMoreData()
        }
    }
    
}

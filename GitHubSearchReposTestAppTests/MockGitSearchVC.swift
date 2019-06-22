//
//  MockGitSearchVC.swift
//  GitHubSearchReposTestAppTests
//
//  Created by Ivan Stebletsov on 22/04/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import Foundation
@testable import GitHubSearchReposTestApp

class MockGitSearchVC: GitSearchVCDelegate {
    
    var selectedLanguageRow: Int = 2
    
    var needFetchMoreData: Bool = false
    
    func reloadTableViewCells(with newIndexPathsToReload: [IndexPath]) {
        print(newIndexPathsToReload)
    }
    
    func moreDataFetched() {
        if needFetchMoreData {
            needFetchMoreData = false
        } else {
            needFetchMoreData = true
        }
    }
    
    func needMoreDataRepeatRequest() {
        if needFetchMoreData {
            needFetchMoreData = false
        } else {
            needFetchMoreData = true
        }
    }
    
    func presentAlertController(_ error: Error) {
        print(error)
    }
    
    func handleActivityIndicator(_ state: ActivityIndicatorStates) {
        if needFetchMoreData {
            needFetchMoreData = false
        } else {
            needFetchMoreData = true
        }
    }
    
    func scrollTableViewToTop() {
        if needFetchMoreData {
            needFetchMoreData = false
        } else {
            needFetchMoreData = true
        }
    }
    
    
}

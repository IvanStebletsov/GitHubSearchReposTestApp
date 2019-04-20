//
//  SearchResultsTVVMProtocol.swift
//  GitHubSearchReposTestApp
//
//  Created by Ivan Stebletsov on 17/04/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import Foundation

protocol SearchResultsTVVMProtocol {
    
    var currentCount: Int? { get set }

    func saveLastSearchText(_ text: String)
    
    func numberOfRows() -> Int
    
    func fetchDataFor(_ searchText: String, forPageNumber page: Int)
    
    func tryFetchMoreData()
    
    func removeOldFetchedRepos()
    
    func viewModelForSell(forIndexPath indexPath: IndexPath) -> GitRepoTVCVMProtocol?

    func selectRow(atIndexPath indexPath:IndexPath) -> URL?
}

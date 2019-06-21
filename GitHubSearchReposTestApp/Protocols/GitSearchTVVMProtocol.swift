//
//  SearchResultsTVVMProtocol.swift
//  GitHubSearchReposTestApp
//
//  Created by Ivan Stebletsov on 17/04/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import Foundation

protocol SearchResultsTVVMProtocol {
    
    func selectedLanguageRow() -> Int
    
    func saveSelectedLanguage(_ row: Int)
    
    func choseRequestLanguage(_ language: LanguageFilter)
    
    func scrollTableViewToTop()

    func saveLastSearchText(_ text: String)
    
    func numberOfRows() -> Int
    
    func isFirstFetchedPage() -> Bool
    
    func fetchDataFor(_ searchText: String, _ after: String?)
    
    func currentCountFetchedRepos() -> Int
    
    func tryFetchMoreData()
    
    func removeOldFetchedRepos()
    
    func clearLastRequestText()
    
    func viewModelForCell(forIndexPath indexPath: IndexPath) -> GitRepoTVCVMProtocol?

    func selectRow(atIndexPath indexPath:IndexPath) -> URL?
    
    func fetchDataWithFilter(_ language: String)
}

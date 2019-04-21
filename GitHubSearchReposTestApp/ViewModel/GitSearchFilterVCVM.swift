//
//  GitSearchFilterVCVM.swift
//  GitHubSearchReposTestApp
//
//  Created by Ivan Stebletsov on 20/04/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import Foundation

class GitSearchFilterVCVM: GitSearchFilterVCVMProtocol {
    
    // MARK: - Properties
    var searchResultsTVVM: SearchResultsTVVMProtocol!
    var view: GitSearchFilterVCDelegate
    
    // MARK: - Initialization
    init(view: GitSearchFilterVCDelegate, searchResultsTVVM: SearchResultsTVVMProtocol) {
        self.view = view
        self.searchResultsTVVM = searchResultsTVVM
    }
    
    // MARK: - GitSearchFilterVCVMProtocol methods
    func numberOfRows() -> Int {
        return LanguageFilter.allCases.count
    }
    
    func languageFor(_ row: Int) -> String {
        return LanguageFilter.allCases[row].rawValue
    }
    
    func applySelectedFilter() {
        searchResultsTVVM.fetchDataWithFilter(view.selectedLanguageFilter)
    }
    
    func selectedLanguageRow() -> Int {
        return searchResultsTVVM.selectedLanguageRow()
    }
    
    func saveSelectedLanguage(_ row: Int) {
        searchResultsTVVM.saveSelectedLanguage(row)
    }
    
}

//
//  SearchResultTVVMTests.swift
//  GitHubSearchReposTestAppTests
//
//  Created by Ivan Stebletsov on 22/04/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import XCTest
@testable import GitHubSearchReposTestApp

class SearchResultTVVMTests: XCTestCase {
    
    private var mockGitSearchVC: GitSearchVCDelegate!
    private var searchResultTVVM: SearchResultsTVVMProtocol!

    override func setUp() {
        mockGitSearchVC = MockGitSearchVC()
        searchResultTVVM = SearchResultsTVVM(view: mockGitSearchVC)
    }
    
    override func tearDown() {
        mockGitSearchVC = nil
        searchResultTVVM = nil
        super.tearDown()
    }

    func testSearchResultsTVVMCanBeInstantiated() {
        XCTAssertNotNil(searchResultTVVM, "SearchResultsTVVM can not be instantiated")
    }
    
    func testSearchResultTVVMCanRetrieveNumberOfRows() {
        let numberOfRows = searchResultTVVM.numberOfRows()
        
        XCTAssertEqual(numberOfRows, 0, "SearchResultTVVM does not retriev number of rows for tableView")
    }
    
    func testSearchResultTVVMCanRetrieveNumberOfFetchedPages() {
        let fetchedPages = searchResultTVVM.numberOfFetchedPages()
        
        XCTAssertEqual(fetchedPages, 1, "SearchResultTVVM does not retriev number of fetched pages")
    }

    func testSearchResultTVVMCanSaveSelectedLanguageRowInView() {
        let selectedLanguage = 2
        searchResultTVVM.saveSelectedLanguage(selectedLanguage)
        
        XCTAssertEqual(selectedLanguage, mockGitSearchVC.selectedLanguageRow, "SearchResultTVVM does not save selected language row in view")
    }
    
    func testSearchResultTVVMCanRetrieveSelectedLanguageRowFromView() {
        let selectedLanguage = 10
        searchResultTVVM.saveSelectedLanguage(selectedLanguage)
        let retrievedSelectedLanguageRow = searchResultTVVM.selectedLanguageRow()
        
        XCTAssertEqual(selectedLanguage, retrievedSelectedLanguageRow, "SearchResultTVVM does not retriev saved selected language row in view")
    }
    
    func testSearchResultTVVMCanCallScrollTableViewToTop() {
        let check = mockGitSearchVC.needFetchMoreData
        searchResultTVVM.scrollTableViewToTop()
        let check2 = mockGitSearchVC.needFetchMoreData
        
        XCTAssertNotEqual(check, check2, "SearchResultTVVM does not call function for scroll tableView to top")
    }

}

//
//  GitSearchFilterVCVMTests.swift
//  GitHubSearchReposTestAppTests
//
//  Created by Ivan Stebletsov on 22/04/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import XCTest
@testable import GitHubSearchReposTestApp

class GitSearchFilterVCVMTests: XCTestCase {
    
    private var mockGitSearchVC: GitSearchVCDelegate!
    private var mockGitSearchFilterVC: GitSearchFilterVCDelegate!
    private var searchResultsTVVM: SearchResultsTVVMProtocol!
    private var gitSearchFilterVCVM: GitSearchFilterVCVMProtocol!

    override func setUp() {
        mockGitSearchVC = MockGitSearchVC()
        searchResultsTVVM = SearchResultsTVVM(view: mockGitSearchVC)
        mockGitSearchFilterVC = MockGitSearchFilterVC()
        gitSearchFilterVCVM = GitSearchFilterVCVM(view: mockGitSearchFilterVC, searchResultsTVVM: searchResultsTVVM)
    }
    
    override func tearDown() {
        mockGitSearchVC = nil
        mockGitSearchFilterVC = nil
        searchResultsTVVM = nil
        gitSearchFilterVCVM = nil
    }
    
    func testGitSearchFilterVCVMCanBeInstantiated() {
        XCTAssertNotNil(gitSearchFilterVCVM, "GitSearchFilterVCVM can not be instantiated")
    }
    
    func testGitSearchFilterVCVMCanRetrieveNumberOfRows() {
        let numberOfrows = LanguageFilter.allCases.count
        let retrivedNumberOfrows = gitSearchFilterVCVM.numberOfRows()
        
        XCTAssertEqual(numberOfrows, retrivedNumberOfrows, "GitSearchFilterVCVM does not retriev number of rows for pickerView")
    }
    
    func testGitSearchFilterVCVMCanRetriveLanguageForPickerViewRow() {
        let row = 40
        let languageForRow = LanguageFilter.allCases[row].rawValue
    
        XCTAssertEqual(languageForRow, gitSearchFilterVCVM.languageFor(row), "GitSearchFilterVCVM does not retriev language for pickerView row")
    }
    
    func testSearchResultTVVMCanDelegateSaveSelectedLanguageRowToSearchResultsTVVM() {
        let selectedLanguage = 2
        gitSearchFilterVCVM.saveSelectedLanguage(selectedLanguage)
        
        XCTAssertEqual(selectedLanguage, searchResultsTVVM.selectedLanguageRow(), "GitSearchFilterVCVM does not save selected language row in view")
    }
    
    func testSearchResultTVVMCanDelegateRetrieveSelectedLanguageRowToSearchResultsTVVM() {
        let selectedLanguage = 10
        gitSearchFilterVCVM.saveSelectedLanguage(selectedLanguage)
        let retrievedSelectedLanguageRow = gitSearchFilterVCVM.selectedLanguageRow()
        
        XCTAssertEqual(selectedLanguage, retrievedSelectedLanguageRow, "GitSearchFilterVCVM does not retriev saved selected language row in view")
    }

}

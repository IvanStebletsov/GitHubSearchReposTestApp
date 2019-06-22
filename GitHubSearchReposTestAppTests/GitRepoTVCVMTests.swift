//
//  GitRepoTVCVMTests.swift
//  GitHubSearchReposTestAppTests
//
//  Created by Ivan Stebletsov on 22/04/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import XCTest
@testable import GitHubSearchReposTestApp

class GitRepoTVCVMTests: XCTestCase {
    
    var repoForCell: RepoDetails!
    var gitRepoTVCVM: GitRepoTVCVMProtocol!

    override func setUp() {
        repoForCell = RepoDetails(id: "GraphQLID",
                                  name: "IvanStebletsov/GitHubSearchReposTestApp",
                                  description: "This project is a test task for the position of Junior iOS developer",
                                  url: "https://github.com/IvanStebletsov/GitHubSearchReposTestApp",
                                  starRating: RepoDetails.StarRating(totalCount: 6538),
                                  language: RepoDetails.Language(name: "Swift"))
        
        gitRepoTVCVM = GitRepoTVCVM(repoForCell: repoForCell)
    }

    override func tearDown() {
        repoForCell = nil
    }

    func testGitRepoTVCVMCanBeInstantiated() {
       XCTAssertNotNil(gitRepoTVCVM, "GitRepoTVCVM can not be instantiated")
    }
    
    func testGitRepoTVCVMCanRetriveRepoName() {
        let repoName = "IvanStebletsov/GitHubSearchReposTestApp"
        XCTAssertEqual(gitRepoTVCVM.repoName(), repoName, "GitRepoTVCVM can not retrive repo name")
    }
    
    func testGitRepoTVCVMCanRetriveRepoDescription() {
        XCTAssertEqual(gitRepoTVCVM.repoDescription(), repoForCell.description, "GitRepoTVCVM can not retrive repo description")
    }
    
    func testGitRepoTVCVMCanRetrievRepoProgrammingLanguage() {
        XCTAssertEqual(gitRepoTVCVM.repoProgrammingLanguage(), repoForCell.language?.name, "GitRepoTVCVM can not retrive repo programming language")
    }
    
    func testGitRepoTVCVMCanRetrieveRepoStarRating() {
        let stubRepoStarRating = "6.5k"
        
        XCTAssertEqual(gitRepoTVCVM.repoStarRating(), stubRepoStarRating, "GitRepoTVCVM can not retrive repo star rating with formatting")
    }

}

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
    
    var repoForCell: GitRepo!
    var gitRepoTVCVM: GitRepoTVCVMProtocol!

    override func setUp() {
        let repoAuthor = RepoAuthor(name: "IvanStebletsov")
        repoForCell = GitRepo(name: "GitHubSearchReposTestApp",
                              url: "https://github.com/IvanStebletsov/GitHubSearchReposTestApp",
                              author: repoAuthor,
                              language: "Swift",
                              description: "This project is a test task for the position of Junior iOS developer",
                              starRating: 6538)
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
        XCTAssertEqual(gitRepoTVCVM.repoProgrammingLanguage(), repoForCell.language, "GitRepoTVCVM can not retrive repo programming language")
    }
    
    func testGitRepoTVCVMCanRetrieveRepoStarRating() {
        let stubRepoStarRating = "6.5k"
        
        XCTAssertEqual(gitRepoTVCVM.repoStarRating(), stubRepoStarRating, "GitRepoTVCVM can not retrive repo star rating with formatting")
    }

}

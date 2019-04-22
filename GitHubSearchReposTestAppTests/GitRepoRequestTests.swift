//
//  GitRepoRequestTests.swift
//  GitHubSearchReposTestAppTests
//
//  Created by Ivan Stebletsov on 22/04/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import XCTest
@testable import GitHubSearchReposTestApp

class GitRepoRequestTests: XCTestCase {
    
    func testRepoAuthorCanBeInstantiated() {
        let repoAuthor = RepoAuthor(name: "IvanStebletsov")
        
        XCTAssertNotNil(repoAuthor, "RepoAuthor can not be instantiated")
    }
    
    func testGitRepoCanBeInstantiated() {
        let repoAuthor = RepoAuthor(name: "IvanStebletsov")
        
        let gitRepo = GitRepo(name: "GitHubSearchReposTestApp",
                              url: "https://github.com/IvanStebletsov/GitHubSearchReposTestApp",
                              author: repoAuthor,
                              language: "Swift",
                              description: "This project is a test task for the position of Junior iOS developer",
                              starRating: 0)
        
        XCTAssertNotNil(gitRepo, "RepoAuthor can not be instantiated")
    }
    

    func testGitRepoRequestCanBeInstantiated() {
        let repoAuthor = RepoAuthor(name: "IvanStebletsov")
        let gitRepo = GitRepo(name: "GitHubSearchReposTestApp",
                              url: "https://github.com/IvanStebletsov/GitHubSearchReposTestApp",
                              author: repoAuthor,
                              language: "Swift",
                              description: "This project is a test task for the position of Junior iOS developer",
                              starRating: 0)
        
        let gitRepoRequest = GitRepoRequest(count: 1, repositories: [gitRepo])
        XCTAssertNotNil(gitRepoRequest, "GitRepoRequest can not be instantiated")
    }

}

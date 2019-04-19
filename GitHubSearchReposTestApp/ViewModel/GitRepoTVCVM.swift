//
//  GitRepoTVCVM.swift
//  GitHubSearchReposTestApp
//
//  Created by Ivan Stebletsov on 18/04/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import Foundation

class GitRepoTVCVM: GitRepoTVCVMProtocol {
    
    var repoForCell: GitRepo
    
    // MARK: - Initialization
    init(repoForCell: GitRepo) {
        self.repoForCell = repoForCell
    }
    
    // MARK: - GitRepoTVCVMProtocol methods
    func repoName() -> String {
        guard let authorName = repoForCell.author?.name, let repoName = repoForCell.name else { return "" }
        
        return #"\#(authorName)/\#(repoName)"#
    }
    
    func repoDescription() -> String {
        guard let description = repoForCell.description else { return "No description" }
        return description
    }
    
    func repoProgrammingLanguage() -> String {
        guard let language = repoForCell.language else { return "--" }
        return language
    }
    
    
}

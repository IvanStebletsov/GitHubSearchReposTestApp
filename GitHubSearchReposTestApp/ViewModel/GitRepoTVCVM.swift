//
//  GitRepoTVCVM.swift
//  GitHubSearchReposTestApp
//
//  Created by Ivan Stebletsov on 18/04/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import Foundation

class GitRepoTVCVM: GitRepoTVCVMProtocol {
    
    var repoForCell: RepoDetails
    
    // MARK: - Initialization
    init(repoForCell: RepoDetails) {
        self.repoForCell = repoForCell
    }
    
    // MARK: - GitRepoTVCVMProtocol methods
    func repoName() -> String {
        return repoForCell.name
    }
    
    func repoDescription() -> String {
        guard let description = repoForCell.description else { return "No description" }
        return description
    }
    
    func repoProgrammingLanguage() -> String {
        guard let language = repoForCell.language else { return "No language" }
        return language.name
    }
    
    func repoStarRating() -> String {
        let starRating = repoForCell.starRating.totalCount
        if starRating / 1000 >= 1 {
            let formattedRating = Double(starRating) / 1000
            return String(format: "%.1f", formattedRating) + "k"
        } else {
            return String(starRating)
        }
    }
    
}

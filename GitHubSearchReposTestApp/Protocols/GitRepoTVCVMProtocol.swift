//
//  GitRepoTVCVMProtocol.swift
//  GitHubSearchReposTestApp
//
//  Created by Ivan Stebletsov on 18/04/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import Foundation

protocol GitRepoTVCVMProtocol {
    
    func repoName() -> String
    
    func repoDescription() -> String
    
    func repoProgrammingLanguage() -> String

    func repoStarRating() -> String
}

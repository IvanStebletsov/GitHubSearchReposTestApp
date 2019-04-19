//
//  GitRepoRequest.swift
//  GitHubSearchReposTestApp
//
//  Created by Ivan Stebletsov on 16/04/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import Foundation

struct GitRepoRequest: Codable {
    var count: Int?
    var repositories: [GitRepo]?
    
    enum CodingKeys: String, CodingKey {
        case count = "total_count"
        case repositories = "items"
    }
}

struct GitRepo: Codable {
    var name: String?
    var url: String?
    var author: RepoAuthor?
    var language: String?
    var description: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case url = "html_url"
        case author = "owner"
        case language
        case description
    }
}

struct RepoAuthor: Codable {
    var name: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "login"
    }
}


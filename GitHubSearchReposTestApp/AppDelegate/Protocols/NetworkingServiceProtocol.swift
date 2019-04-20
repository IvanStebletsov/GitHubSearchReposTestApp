//
//  NetworkingServiceProtocol.swift
//  GitHubSearchReposTestApp
//
//  Created by Ivan Stebletsov on 19/04/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import Foundation

protocol Networking: class {
    
    func fetchGitReposFor(_ query: String, forPageNumber pageNumber: Int, completion: @escaping ((Result<[GitRepo], DataResponseError>, URLResponse?) -> ()))
    
    func fetchTotalNumbersOfRepos(_ query: String, completion: @escaping (URLResponse?) -> ()) 
    
}

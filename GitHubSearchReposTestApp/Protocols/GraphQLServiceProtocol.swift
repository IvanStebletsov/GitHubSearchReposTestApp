//
//  GraphQLServiceProtocol.swift
//  GitHubSearchReposTestApp
//
//  Created by Ivan Stebletsov on 21.06.2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import Foundation
import Apollo

protocol GraphQLAPI: class {
    
    var requestLanguage: String { get set }
    
    func fetchReposFor(_ searchText: String!, page after: String?, completion: @escaping ((Result<GraphQLResult<FetchReposForSeachQuery.Data>>)) -> ())
    
}

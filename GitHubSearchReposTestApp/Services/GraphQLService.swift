//
//  GraphQLClient.swift
//  GitHubSearchReposTestApp
//
//  Created by Ivan Stebletsov on 16.06.2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import Foundation
import Apollo

class GraphQLService: GraphQLAPI {
    
    // MARK: - Properties
    var requestLanguage = "Default"
    var searchRequestText = ""
    var searchQuery: FetchReposForSeachQuery!
    let apollo: ApolloClient = {
        let configuration = URLSessionConfiguration.default
        
        configuration.httpAdditionalHeaders = ["Authorization": "bearer 0a12dd7dc8e934ab79df1878dae06b4eb0cd9dca"]
        let url = URL(string: "https://api.github.com/graphql")!
        
        return ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
    }()
    
    // MARK: - Methods
    func fetchReposFor(_ searchText: String!, page after: String?, completion: @escaping ((Result<GraphQLResult<FetchReposForSeachQuery.Data>>)) -> ()) {
        
        if requestLanguage != "Default" {
            searchRequestText = searchText + " language:\(requestLanguage)"
        } else {
            searchRequestText = searchText
        }
        
        if let afterPage = after {
            searchQuery = FetchReposForSeachQuery(text: searchRequestText, after: afterPage)
        } else {
            searchQuery = FetchReposForSeachQuery(text: searchRequestText)
        }
        
        apollo.fetch(query: searchQuery, cachePolicy: .returnCacheDataElseFetch, queue: .global()) { (result, error) in
            if let error = error { completion(Result.failure(error)) }
            
            guard let data = result else { return }
            completion(Result.success(data))
        }
    }
    
}

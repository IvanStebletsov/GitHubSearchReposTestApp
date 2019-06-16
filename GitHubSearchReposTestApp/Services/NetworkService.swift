//
//  NetworkManager.swift
//  OpenWeatherTestApp
//
//  Created by Ivan Stebletsov on 06/03/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import Foundation
import Apollo


class NetworkService: Networking {
    
    // MARK: - Properties
    let baseUrl = "https://api.github.com/search/repositories"
    var requestQuerys = ["q": "",
                         "per_page": "1",
                         "page": "1"]
    var requestLanguage = "Default"
    
    // MARK: - Apollo code
//    let apollo: ApolloClient = {
//        let configuration = URLSessionConfiguration.default
//
//        configuration.httpAdditionalHeaders = ["Authorization": "bearer <your token>"]
//
//        let url = URL(string: "https://api.github.com/graphql")!
//
//        return ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
//    }()
    
    // MARK: - Methods
    func fetchGitReposFor(_ query: String, forPageNumber pageNumber: Int, completion: @escaping ((Result<[GitRepo], DataResponseError>, URLResponse?) -> ())) {
        
        var fetchedRepos = [GitRepo]()
        
        if requestLanguage != "Default" {
            requestQuerys["q"] = String(query)+"+language:\(requestLanguage)"
        } else {
            requestQuerys["q"] = String(query)
        }
        
        requestQuerys["per_page"] = "30"
        requestQuerys["page"] = String(pageNumber)
        
        guard let url = baseUrl.createUrl(forRequestWith: requestQuerys) else { return }

        let urlSession = URLSession.shared
        
        urlSession.dataTask(with: url) { (data, response, error) in

            if error != nil { completion(Result.failure(.connection), nil) }
            
            guard let httpResponse = response as? HTTPURLResponse, let data = data else { return }
            print(url, httpResponse.statusCode)
            
            guard httpResponse.hasSuccessStatusCode else {
                let httpResponse = response as! HTTPURLResponse
                
                if httpResponse.statusCode != 403 {
                    completion(Result.failure(.request), response)
                } else {
                    completion(Result.failure(.network), response)
                }
                return
            }
            
            guard let gitRepos = try? JSONDecoder().decode(GitRepoRequest.self, from: data), let newRepos = gitRepos.repositories else {
                completion(Result.failure(.decoding), nil)
                return
            }
            fetchedRepos = newRepos
            completion(Result.success(fetchedRepos), response)
            }.resume()
    }
    
    func fetchTotalNumbersOfRepos(_ query: String, completion: @escaping (URLResponse?) -> ()) {
        requestQuerys["per_page"] = "1"
        
        if requestLanguage != "Default" {
            requestQuerys["q"] = String(query)+"+language:\(requestLanguage)"
        } else {
            requestQuerys["q"] = String(query)
        }
        
        guard let url = baseUrl.createUrl(forRequestWith: requestQuerys) else { return }

        let urlSession = URLSession.shared
        
        
        urlSession.dataTask(with: url) { (_, response, _) in
            guard let httpResponse = response as? HTTPURLResponse else { return }
            print(url, httpResponse.statusCode)
            completion(response)
            }.resume()
    }
}

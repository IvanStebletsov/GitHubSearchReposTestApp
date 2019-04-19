//
//  NetworkManager.swift
//  OpenWeatherTestApp
//
//  Created by Ivan Stebletsov on 06/03/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import Foundation

class NetworkService: Networking {
    
    // MARK: - Properties
    let baseUrl = "https://api.github.com/search/repositories"
    var requestQuerys = ["q": "",
                         "per_page": "20",
                         "page": "1"]
    
    // MARK: - Methods
    func fetchGitReposFor(_ query: String, forPageNumber pageNumber: Int, completion: @escaping ((Result<[GitRepo], DataResponseError>, URLResponse?) -> ())) {
        
        var fetchedRepos = [GitRepo]()
        
        requestQuerys["q"] = String(query)
        requestQuerys["per_page"] = "20"
        requestQuerys["page"] = String(pageNumber)
        
        guard let url = baseUrl.createUrl(forRequestWith: requestQuerys) else { return }
        
        let urlSession = URLSession.shared
        
        urlSession.dataTask(with: url) { (data, response, error) in
            
            if error != nil { completion(Result.failure(.connection), nil) }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.hasSuccessStatusCode, let data = data else {
                completion(Result.failure(.network), response)
                return
            }
            
            do {
                let gitRepos = try JSONDecoder().decode(GitRepoRequest.self, from: data)
                fetchedRepos = gitRepos.repositories ?? []
                completion(Result.success(fetchedRepos), nil)
            } catch {
                completion(Result.failure(.decoding), nil)
            }
            
            }.resume()
    }
}

//
//  DataResponseError.swift
//  GitHubSearchReposTestApp
//
//  Created by Ivan Stebletsov on 19/04/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import Foundation

enum DataResponseError: Error {
    case network
    case connection
    case decoding
    
    var reason: String {
        switch self {
        case .network:
            return "An error occurred while fetching data"
        case .connection:
            return "Ooops... We have some problems with Internet connecton"
        case .decoding:
            return "An error occurred while decoding data"
        }
    }
}

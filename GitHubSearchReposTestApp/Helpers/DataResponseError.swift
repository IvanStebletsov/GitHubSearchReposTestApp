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
    case request
    
    var reason: String {
        switch self {
        case .network:
            return "Oops... We can't retrieve data properly"
        case .request:
            return "Oops... There is nothing on such a request"
        case .connection:
            return "Ooops... We have some problems with Internet connection"
        case .decoding:
            return "Oops... We can't decode data"
        }
    }
}

//
//  GitSearchFilterVCVMProtocol.swift
//  GitHubSearchReposTestApp
//
//  Created by Ivan Stebletsov on 20/04/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import Foundation

protocol GitSearchFilterVCVMProtocol {
    
    func numberOfRows() -> Int
 
    func languageFor(_ row: Int) -> String
    
    func applySelectedFilter()
}

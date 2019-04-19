//
//  GitSearchVCDelegate.swift
//  GitHubSearchReposTestApp
//
//  Created by Ivan Stebletsov on 17/04/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import UIKit

protocol GitSearchVCDelegate: class {
    
    var needFetchMoreData: Bool { get set }
    
    func reloadTableViewData()
    
    func moreDataFetched()
    
}

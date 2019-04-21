//
//  SearchResultsTVVM.swift
//  GitHubSearchReposTestApp
//
//  Created by Ivan Stebletsov on 17/04/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import Foundation

class SearchResultsTVVM: SearchResultsTVVMProtocol {
    
    // MARK: - Properties
    private var networkService: Networking!
    private weak var view: GitSearchVCDelegate?
    private var pendingRequestWorkItem: DispatchWorkItem? // TODO
    private var selectedIndexPath: IndexPath?
    private var lastRequestText: String?
    private var fetchedPages: Int?
    private var totalCount = 0 {
        willSet {
            print("Total count: \(newValue)")
        }
    }
    var currentCount: Int?
    private var fetchedRepos = [GitRepo]() { willSet { currentCount = newValue.count } }
    
    // MARK: - Initialization
    init(view: GitSearchVCDelegate) {
        self.view = view
        self.networkService = NetworkService()
    }
    
    // MARK: - SearchResultsTVVMProtocol methods
    func numberOfRows() -> Int {
        return totalCount
    }
    
    func selectedLanguageRow() -> Int {
        guard let row = view?.selectedLanguageRow else { return 0 }
        return row
    }
    
    func saveSelectedLanguage(_ row: Int) {
        view?.selectedLanguageRow = row
    }
    
    func fetchDataFor(_ searchText: String, forPageNumber page: Int) {
        networkService.fetchTotalNumbersOfRepos(searchText, completion: { [unowned self] (response) in
            guard let response = response else { return }
            self.totalCount = self.totalNumberOfRepos(response)
        })
            
        networkService.fetchGitReposFor(searchText, forPageNumber: page) { [weak self] (result, response) in
            switch result {
                
            case .success(let newRepos):
                guard let self = self else { return }
                
                self.fetchedPages = page
                self.fetchedRepos += newRepos
                self.view?.moreDataFetched()
                
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.scrollTableViewToTop()
                    self.view?.reloadTableViewCells(with: self.calculateIndexPathsToReload(from: newRepos))
                    self.view?.handleActivityIndicator(.deactivate)
                }
                
            case .failure(.network):
                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 403 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5, execute: DispatchWorkItem.init(block: { [weak self] in
                        guard let self = self else { return }
                        self.view?.handleActivityIndicator(.deactivate)
                        self.view?.needMoreDataRepeatRequest()
                        self.tryFetchMoreData()
                    }))
                }
                
            case .failure(.connection):
                guard let self = self else { return }
                DispatchQueue.main.async {
                    self.view?.handleActivityIndicator(.deactivate)
                    self.view?.presentAlertController(DataResponseError.connection)
                }
                
            case .failure(.decoding):
                guard let self = self else { return }
                DispatchQueue.main.async {
                self.view?.handleActivityIndicator(.deactivate)
                self.view?.presentAlertController(DataResponseError.decoding)
                }
                
            case .failure(.request):
                guard let self = self else { return }
                DispatchQueue.main.async {
                    self.view?.handleActivityIndicator(.deactivate)
                    self.view?.presentAlertController(DataResponseError.request)
                }
            }
        }
    }
    
    func scrollTableViewToTop() {
        view?.scrollTableViewToTop()
    }
    
    func fetchDataWithFilter(_ language: String) {
        networkService.requestLanguage = language
        removeOldFetchedRepos()
        guard let searchRequest = lastRequestText else { return }
        self.view?.handleActivityIndicator(.activate)
        self.fetchDataFor(searchRequest, forPageNumber: 1)
    }
    
    func tryFetchMoreData() {
        self.view?.handleActivityIndicator(.activate)
        guard view!.needFetchMoreData, let requestText = lastRequestText, let pages = fetchedPages else { return }
        fetchDataFor(requestText, forPageNumber: pages + 1)
    }
    
    
    func viewModelForSell(forIndexPath indexPath: IndexPath) -> GitRepoTVCVMProtocol? {
        guard !fetchedRepos.isEmpty else { return nil }
        return GitRepoTVCVM(repoForCell: fetchedRepos[indexPath.row])
    }
    
    func removeOldFetchedRepos() {
        fetchedRepos.removeAll()
        totalCount = 0
    }
    
    func clearLastRequestText() {
        lastRequestText = ""
    }
    
    func saveLastSearchText(_ text: String) {
        lastRequestText = text
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) -> URL? {
        selectedIndexPath = indexPath
        guard let repoUrl = fetchedRepos[indexPath.row].url else { return nil }
        guard let url = URL(string: repoUrl) else { return nil }
        return url
    }
    
    func choseRequestLanguage(_ language: LanguageFilter) {
        networkService.requestLanguage = language.rawValue
    }
    
    private func totalNumberOfRepos(_ response: URLResponse) -> Int {
        var totalPages = 0
        
        guard let response = response as? HTTPURLResponse else { return totalPages }
        
        guard let list = response.allHeaderFields["Link"] as! String? else { return totalCount }
        let stringsWithURLs = list.components(separatedBy: "page=")
        let pages = stringsWithURLs.map { $0.trimmingCharacters(in: CharacterSet(charactersIn: "0123456789").inverted) }
        
        for each in pages {
            guard let number = Int(each) else { continue }
            if number > totalPages { totalPages = number }
        }
        return totalPages
    }
    
    private func calculateIndexPathsToReload(from newRepos: [GitRepo]) -> [IndexPath] {
        let startIndex = fetchedRepos.count - newRepos.count
        let endIndex = startIndex + newRepos.count
        return (startIndex..<endIndex).map { IndexPath(row: $0, section: 0) }
    }
    
}

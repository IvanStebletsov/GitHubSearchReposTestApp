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
    private var grpahQLService: GraphQLAPI!
    private var nextPageId: String?
    private var totalReposCount = 0
    private var repoDetails = [RepoDetails?]()
    private weak var view: GitSearchVCDelegate?
    private var selectedIndexPath: IndexPath?
    private var lastRequestText: String?
    private var firstFetchedPage = true
    
    // MARK: - Initialization
    init(view: GitSearchVCDelegate) {
        self.view = view
        self.grpahQLService = GraphQLService()
    }
    
    // MARK: - SearchResultsTVVMProtocol methods
    func numberOfRows() -> Int {
        return totalReposCount
    }
    
    func currentCountFetchedRepos() -> Int {
        return repoDetails.count
    }
    
    func isFirstFetchedPage() -> Bool {
        return firstFetchedPage
    }
    
    func selectedLanguageRow() -> Int {
        guard let row = view?.selectedLanguageRow else { return 0 }
        return row
    }
    
    func saveSelectedLanguage(_ row: Int) {
        view?.selectedLanguageRow = row
    }
    
    // MARK: - GraphQL requests
    func fetchDataFor(_ searchText: String, _ after: String?) {
        self.grpahQLService.fetchReposFor(searchText, page: after) { [weak self] (result) in
            guard let self = self else { return }
            
            switch result {
            case .success(let fetched):
                guard let fetchedRepos = fetched.data?.allRepos else { return }
                
                if self.firstFetchedPage { self.totalReposCount = fetchedRepos.totalCount }
                self.nextPageId = fetchedRepos.page.hasNext ? fetchedRepos.page.endId : nil
                
                guard let repoDetails = fetchedRepos.fetchedRepos.map({ $0 })?.map({ $0?.repoInfo?.asRepository?.fragments.repoDetails }) else { return }
                self.repoDetails += repoDetails
                
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.view?.moreDataFetched()
                    self.view?.reloadTableViewCells(with: self.calculateIndexPathsToReload(from: repoDetails))
                    self.view?.handleActivityIndicator(.deactivate)
                }
                
            case .failure(let error):
                self.view?.presentAlertController(error)
            }
        }
    }
    
    func scrollTableViewToTop() {
        view?.scrollTableViewToTop()
    }
    
    func fetchDataWithFilter(_ language: String) {
        grpahQLService.requestLanguage = language
        removeOldFetchedRepos()
        guard let searchRequest = lastRequestText else { return }
        self.view?.handleActivityIndicator(.activate)
        self.fetchDataFor(searchRequest, nil)
        self.firstFetchedPage = true
        self.view?.reloadTableViewCells(with: [IndexPath]())
    }
    
    func tryFetchMoreData() {
        self.view?.handleActivityIndicator(.activate)
        guard let requestText = lastRequestText, let nextPage = nextPageId else {
            self.view?.handleActivityIndicator(.deactivate)
            return
        }
        self.fetchDataFor(requestText, nextPage)
        self.firstFetchedPage = false
    }
    
    func viewModelForCell(forIndexPath indexPath: IndexPath) -> GitRepoTVCVMProtocol? {
        guard !repoDetails.isEmpty else { return nil }
        guard let repoDetailsForTVCVM = repoDetails[indexPath.row] else { return nil }
        return GitRepoTVCVM(repoForCell: repoDetailsForTVCVM)
    }
    
    func removeOldFetchedRepos() {
        repoDetails.removeAll()
        totalReposCount = 0
        firstFetchedPage = true
    }
    
    func clearLastRequestText() {
        lastRequestText = ""
    }
    
    func saveLastSearchText(_ text: String) {
        lastRequestText = text
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) -> URL? {
        selectedIndexPath = indexPath
        guard let repo = repoDetails[indexPath.row] else { return nil }
        guard let url = URL(string: repo.url) else { return nil }
        return url
    }
    
    func choseRequestLanguage(_ language: LanguageFilter) {
        grpahQLService.requestLanguage = language.rawValue
    }
    
    private func calculateIndexPathsToReload(from newRepos: [RepoDetails?]) -> [IndexPath] {
        let startIndex = repoDetails.count - newRepos.count
        let endIndex = startIndex + newRepos.count
        
        return (startIndex..<endIndex).map { IndexPath(row: $0, section: 0) }
    }
    
}

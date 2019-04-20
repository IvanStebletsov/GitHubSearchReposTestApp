//
//  GitRepoTVC.swift
//  GitHubSearchReposTestApp
//
//  Created by Ivan Stebletsov on 18/04/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import UIKit

class GitRepoTVC: UITableViewCell {
    
    // MARK: - Properties
    var gitRepoTVCVM: GitRepoTVCVMProtocol? {
        willSet(newViewModel) {
            guard let viewModel = newViewModel else {
                repoNameLabel.text = "Error"
                repoDescriptionLabel.text = "Error"
                repoProgrammingLanguageLabel.text = "Error"
                starRatingLabel.text = "0"
                return
            }
            
            repoNameLabel.text = viewModel.repoName()
            repoDescriptionLabel.text = viewModel.repoDescription()
            repoProgrammingLanguageLabel.text = viewModel.repoProgrammingLanguage()
            languageColor.backgroundColor = colorFor(language: viewModel.repoProgrammingLanguage())
            starRatingLabel.text = viewModel.repoStarRating()
        }
    }
    
    // MARK: - UI elements
    var cellBackgroundView: UIView!
    var repoNameLabel: UILabel!
    var repoDescriptionLabel: UILabel!
    var languageColor: UIView!
    var repoProgrammingLanguageLabel: UILabel!
    var starRatingLabel: UILabel!
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none
        
        makeCellBackgroundView()
        makeRepoNameLabel()
        makeRepoDescriptionLabel()
        makeProgrammingLanguageLabel()
        makeStrsRatingLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

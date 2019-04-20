//
//  StubGitRepoTVC.swift
//  GitHubSearchReposTestApp
//
//  Created by Ivan Stebletsov on 20/04/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import UIKit

class StubGitRepoTVC: UITableViewCell {
    
    // MARK: - Properties
    
    // MARK: - UI elements
    var cellBackgroundView: UIView!
    var stubRepoIconView: UIView!
    var stubRepoNameLabelView: UIView!
    var stubRepoDescriptionLabelView: UIView!
    var stubLanguageColorView: UIView!
    var stubRepoProgrammingLanguageLabelView: UIView!
    var stubStarIconView: UIView!
    var stubStarRatingLabelView: UIView!
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none
        
        makeStubCellBackgroundView()
        makeStubRepoNameLabelView()
        makeStubRepoDescriptionLabelView()
        makeStubProgrammingLanguageLabelView()
        makeStubStrsRatingLabelView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


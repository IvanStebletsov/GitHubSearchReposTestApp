//
//  GitSearchFilterVC.swift
//  GitHubSearchReposTestApp
//
//  Created by Ivan Stebletsov on 20/04/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import UIKit

class GitSearchFilterVC: UIViewController {
    
    // MARK: - Properties
    var gitSearchFilterVCVM: GitSearchFilterVCVMProtocol!
    var selectedLanguageFilter = "Default"
    
    // MARK: - UI elements
    var animatedView: UIView!
    var filterButton: UIButton!
    var filterView: UIView!
    var languagePickerView: UIPickerView!
    
    // MARK: - Life cicle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        makeFilterView()
        makeLanguagePickerView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        makeAnimatedBackground()
        makeFilterButton()
    }
}

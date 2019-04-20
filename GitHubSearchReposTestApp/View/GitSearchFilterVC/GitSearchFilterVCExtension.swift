//
//  GitSearchFilterVCExtension.swift
//  GitHubSearchReposTestApp
//
//  Created by Ivan Stebletsov on 20/04/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import Foundation

import UIKit

extension GitSearchFilterVC: GitSearchFilterVCDelegate {
    
    // MARK: - UI Configuration
    func makeAnimatedBackground() {
        animatedView = UIView()
        animatedView.frame = view.frame
        animatedView.backgroundColor = .black
        animatedView.alpha = 0
        
        view.insertSubview(animatedView, at: 0)
        
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.animatedView.alpha = 0.5
        }
    }
    
    func makeFilterView() {
        filterView = UIView()
        filterView.translatesAutoresizingMaskIntoConstraints = false
        
        filterView.backgroundColor = .white
        filterView.layer.cornerRadius = 25
        filterView.layer.masksToBounds = true
        filterView.layer.shouldRasterize = true
        filterView.layer.rasterizationScale = UIScreen.main.nativeScale
        filterView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        filterView.layer.shadowOpacity = 0.1
        filterView.layer.shadowRadius = 3
        filterView.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        view.addSubview(filterView)
        
        let filterViewConstarints = [
            filterView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            filterView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90),
            filterView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95),
            filterView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4)]
        NSLayoutConstraint.activate(filterViewConstarints)
    }
    
    func makeLanguagePickerView() {
        languagePickerView = UIPickerView()
        languagePickerView.translatesAutoresizingMaskIntoConstraints = false
        
        languagePickerView.showsSelectionIndicator = true
        
        languagePickerView.dataSource = self
        languagePickerView.delegate = self
        
        filterView.addSubview(languagePickerView)
        
        let languagePickerViewConstraints = [
            languagePickerView.topAnchor.constraint(equalTo: filterView.topAnchor),
            languagePickerView.leadingAnchor.constraint(equalTo: filterView.leadingAnchor),
            languagePickerView.trailingAnchor.constraint(equalTo: filterView.trailingAnchor),
            languagePickerView.bottomAnchor.constraint(equalTo: filterView.bottomAnchor)]
        NSLayoutConstraint.activate(languagePickerViewConstraints)
    }
    
    func makeFilterButton() {
        filterButton = UIButton()
        filterButton.translatesAutoresizingMaskIntoConstraints = false
        
        filterButton.layer.cornerRadius = 25
        filterButton.backgroundColor = #colorLiteral(red: 0.1405375302, green: 0.1605641544, blue: 0.1772543788, alpha: 1)
        filterButton.layer.shouldRasterize = true
        filterButton.layer.rasterizationScale = UIScreen.main.nativeScale
        filterButton.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        filterButton.layer.shadowOpacity = 0.1
        filterButton.layer.shadowRadius = 3
        filterButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        let image = UIImage(named: "done")
        let tintedImage = image?.withRenderingMode(.alwaysTemplate)
        filterButton.setImage(tintedImage, for: .normal)
        filterButton.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        filterButton.addTarget(self, action: #selector(unwindGitSearchFilterVC), for: .touchUpInside)
        
        view.addSubview(filterButton)
        
        let filterButtonConstraints = [
            filterButton.heightAnchor.constraint(equalToConstant: 50),
            filterButton.widthAnchor.constraint(equalTo: filterButton.heightAnchor),
            filterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            filterButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)]
        NSLayoutConstraint.activate(filterButtonConstraints)
    }
    
    // MARK: - Transition method
    @objc func unwindGitSearchFilterVC() {
        gitSearchFilterVCVM.applySelectedFilter()
        
        filterButton.isHidden = true
        UIView.animate(withDuration: 0.5,
                       animations: { [weak self] in
                        guard let self = self else { return }
                        self.filterView.alpha = 0
                        self.animatedView.alpha = 0 }) { (_) in
                            self.dismiss(animated: true, completion: nil) }
    }
}

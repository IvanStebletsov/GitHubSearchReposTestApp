//
//  GitRepoTVCExtension.swift
//  GitHubSearchReposTestApp
//
//  Created by Ivan Stebletsov on 18/04/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import UIKit

extension GitRepoTVC {
    
    // MARK: - UI Configuration
    func makeCellBackgroundView() {
        cellBackgroundView = UIView()
        cellBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        cellBackgroundView.backgroundColor = .white
        cellBackgroundView.layer.cornerRadius = 10
        cellBackgroundView.layer.shouldRasterize = true
        cellBackgroundView.layer.rasterizationScale = UIScreen.main.nativeScale
        cellBackgroundView.layer.borderColor = #colorLiteral(red: 0.8190318942, green: 0.8350388408, blue: 0.8557710052, alpha: 1)
        cellBackgroundView.layer.borderWidth = 0.5
        cellBackgroundView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        cellBackgroundView.layer.shadowOpacity = 0.1
        cellBackgroundView.layer.shadowRadius = 3
        cellBackgroundView.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        addSubview(cellBackgroundView)
        
        let cellBackgroundViewConstraints = [
            cellBackgroundView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            cellBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            cellBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            cellBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)]
        NSLayoutConstraint.activate(cellBackgroundViewConstraints)
    }
    
    func makeRepoNameLabel() {
        let repoIcon = UIImageView()
        repoIcon.translatesAutoresizingMaskIntoConstraints = false
        
        let image = UIImage(named: "repository")
        let tintedImage = image?.withRenderingMode(.alwaysTemplate)
        repoIcon.image = tintedImage
        repoIcon.tintColor = #colorLiteral(red: 0.3440451622, green: 0.3759211898, blue: 0.4133994579, alpha: 1)

        cellBackgroundView.addSubview(repoIcon)
        
        let repoIconConstraints = [
            repoIcon.topAnchor.constraint(equalTo: cellBackgroundView.topAnchor, constant: 16),
            repoIcon.leadingAnchor.constraint(equalTo: cellBackgroundView.leadingAnchor, constant: 10),
            repoIcon.heightAnchor.constraint(equalToConstant: 20),
            repoIcon.widthAnchor.constraint(equalTo: repoIcon.heightAnchor)]
        NSLayoutConstraint.activate(repoIconConstraints)
        
        repoNameLabel = UILabel()
        repoNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        repoNameLabel.font = .boldSystemFont(ofSize: 18)
        repoNameLabel.textColor = #colorLiteral(red: 0.0112668043, green: 0.3992490172, blue: 0.8399813771, alpha: 1)
        repoNameLabel.textAlignment = .left
        
        cellBackgroundView.addSubview(repoNameLabel)
        
        let repoNameLabelConstraints = [
            repoNameLabel.topAnchor.constraint(equalTo: cellBackgroundView.topAnchor, constant: 15),
            repoNameLabel.leadingAnchor.constraint(equalTo: repoIcon.trailingAnchor, constant: 5),
            repoNameLabel.trailingAnchor.constraint(equalTo: cellBackgroundView.trailingAnchor, constant: -10)]
        NSLayoutConstraint.activate(repoNameLabelConstraints)
    }
    
    func makeRepoDescriptionLabel() {
        repoDescriptionLabel = UILabel()
        repoDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        repoDescriptionLabel.font = .systemFont(ofSize: 16)
        repoDescriptionLabel.textColor = #colorLiteral(red: 0.3440451622, green: 0.3759211898, blue: 0.4133994579, alpha: 1)
        repoDescriptionLabel.textAlignment = .left
        repoDescriptionLabel.numberOfLines = 0
        
        cellBackgroundView.addSubview(repoDescriptionLabel)
        
        let repoDescriptionLabelConstraints = [
            repoDescriptionLabel.topAnchor.constraint(equalTo: repoNameLabel.bottomAnchor, constant: 10),
            repoDescriptionLabel.leadingAnchor.constraint(equalTo: cellBackgroundView.leadingAnchor, constant: 10),
            repoDescriptionLabel.trailingAnchor.constraint(equalTo: cellBackgroundView.trailingAnchor, constant: -10)]
        NSLayoutConstraint.activate(repoDescriptionLabelConstraints)
    }
    
    func makeProgrammingLanguageLabel() {
        languageColor = UIView()
        languageColor.translatesAutoresizingMaskIntoConstraints = false
        
        languageColor.layer.cornerRadius = 15 / 2
        languageColor.layer.shouldRasterize = true
        languageColor.layer.rasterizationScale = UIScreen.main.nativeScale
        
        cellBackgroundView.addSubview(languageColor)
        
        let languageColorConstraints = [
            languageColor.topAnchor.constraint(equalTo: repoDescriptionLabel.bottomAnchor, constant: 20),
            languageColor.leadingAnchor.constraint(equalTo: cellBackgroundView.leadingAnchor, constant: 10),
            languageColor.widthAnchor.constraint(equalToConstant: 15),
            languageColor.heightAnchor.constraint(equalTo: languageColor.widthAnchor),
            languageColor.bottomAnchor.constraint(equalTo: cellBackgroundView.bottomAnchor, constant: -15)]
        NSLayoutConstraint.activate(languageColorConstraints)
        
        repoProgrammingLanguageLabel = UILabel()
        repoProgrammingLanguageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        repoProgrammingLanguageLabel.font = .systemFont(ofSize: 16)
        repoProgrammingLanguageLabel.textColor = #colorLiteral(red: 0.3440451622, green: 0.3759211898, blue: 0.4133994579, alpha: 1)
        repoProgrammingLanguageLabel.textAlignment = .left
        repoProgrammingLanguageLabel.numberOfLines = 0
        
        cellBackgroundView.addSubview(repoProgrammingLanguageLabel)
        
        let programmingLanguageLabelConstraints = [
            repoProgrammingLanguageLabel.centerYAnchor.constraint(equalTo: languageColor.centerYAnchor),
            repoProgrammingLanguageLabel.leadingAnchor.constraint(equalTo: languageColor.trailingAnchor, constant: 5)]
        NSLayoutConstraint.activate(programmingLanguageLabelConstraints)
    }
    
    func makeStrsRatingLabel() {
        let starIcon = UIImageView()
        starIcon.translatesAutoresizingMaskIntoConstraints = false
        
        let image = UIImage(named: "star")
        let tintedImage = image?.withRenderingMode(.alwaysTemplate)
        starIcon.image = tintedImage
        starIcon.tintColor = #colorLiteral(red: 0.3440451622, green: 0.3759211898, blue: 0.4133994579, alpha: 1)
        
        cellBackgroundView.addSubview(starIcon)
        
        let starIconConstraints = [
            starIcon.topAnchor.constraint(equalTo: repoDescriptionLabel.bottomAnchor, constant: 20),
            starIcon.leadingAnchor.constraint(equalTo: repoProgrammingLanguageLabel.trailingAnchor, constant: 25),
            starIcon.widthAnchor.constraint(equalToConstant: 15),
            starIcon.heightAnchor.constraint(equalTo: starIcon.widthAnchor),
            languageColor.bottomAnchor.constraint(equalTo: cellBackgroundView.bottomAnchor, constant: -15)]
        NSLayoutConstraint.activate(starIconConstraints)
        
        starRatingLabel = UILabel()
        starRatingLabel.translatesAutoresizingMaskIntoConstraints = false
        
        starRatingLabel.font = .systemFont(ofSize: 16)
        starRatingLabel.textColor = #colorLiteral(red: 0.3440451622, green: 0.3759211898, blue: 0.4133994579, alpha: 1)
        starRatingLabel.textAlignment = .left
        
        cellBackgroundView.addSubview(starRatingLabel)
        
        let starRatingLabelConstraints = [
            starRatingLabel.centerYAnchor.constraint(equalTo: languageColor.centerYAnchor),
            starRatingLabel.leadingAnchor.constraint(equalTo: starIcon.trailingAnchor, constant: 5)]
        NSLayoutConstraint.activate(starRatingLabelConstraints)
    }
    
    // MARK: - Functions
    func colorFor(language: String) -> UIColor {
        
        switch language {
        case "Go":
            return LanguageColor.go.rawValue
        case "C++":
            return LanguageColor.cPlusPlus.rawValue
        case "TypeScript":
            return LanguageColor.typeScript.rawValue
        case "JavaScript":
            return LanguageColor.javaScript.rawValue
        case "Python":
            return LanguageColor.python.rawValue
        case "Ruby":
            return LanguageColor.ruby.rawValue
        case "PHP":
            return LanguageColor.php.rawValue
        case "Groovy":
            return LanguageColor.groovy.rawValue
        case "Java":
            return LanguageColor.java.rawValue
        case "Scala":
            return LanguageColor.scala.rawValue
        case "Shell":
            return LanguageColor.shell.rawValue
        case "Swift":
            return LanguageColor.swift.rawValue
        case "C#":
            return LanguageColor.cSharp.rawValue
        case "R":
            return LanguageColor.r.rawValue
        case "HTML":
            return LanguageColor.html.rawValue
        case "Perl":
            return LanguageColor.perl.rawValue
        case "Objective-C":
            return LanguageColor.objectiveC.rawValue
        case "C":
            return LanguageColor.c.rawValue
        case "SharedLab":
            return LanguageColor.shaderLab.rawValue
        case "Erlang":
            return LanguageColor.erlang.rawValue
        case "Elm":
            return LanguageColor.elm.rawValue
        case "WebAssembly":
            return LanguageColor.webAssembly.rawValue
        case "GLSL":
            return LanguageColor.glsl.rawValue
        case "Kotlin":
            return LanguageColor.kotlin.rawValue
        case "Haskell":
            return LanguageColor.haskell.rawValue
        case "Clojure":
            return LanguageColor.clojure.rawValue
        case "PLpgSQL":
            return LanguageColor.plpgSQL.rawValue
        case "CSS":
            return LanguageColor.css.rawValue
        case "Jupyter Notebook":
            return LanguageColor.jupyterNotebook.rawValue
        case "CoffeeScript":
            return LanguageColor.coffeeScript.rawValue
        case "Apex":
            return LanguageColor.apex.rawValue
        case "Gnuplot":
            return LanguageColor.gnuplot.rawValue
        case "F#":
            return LanguageColor.fSharp.rawValue
        case "PowerShell":
            return LanguageColor.powerShell.rawValue
        case "Vue":
            return LanguageColor.vue.rawValue
        case "EmacsLisp":
            return LanguageColor.emacsLisp.rawValue
        case "Vim script":
            return LanguageColor.vimScript.rawValue
        case "Assembly":
            return LanguageColor.assembly.rawValue
        case "Rust":
            return LanguageColor.rust.rawValue
        case "Julia":
            return LanguageColor.julia.rawValue
        case "Elixir":
            return LanguageColor.elixir.rawValue
        case "Crystal":
            return LanguageColor.crystal.rawValue
        case "Nim":
            return LanguageColor.nim.rawValue
        case "Red":
            return LanguageColor.red.rawValue
        case "Frage":
            return LanguageColor.frege.rawValue
        case "Rocket":
            return LanguageColor.rocket.rawValue
        case "OCaml":
            return LanguageColor.oCaml.rawValue
        case "LiveScript":
            return LanguageColor.liveScript.rawValue
        case "D":
            return LanguageColor.d.rawValue
        case "Perl 6":
            return LanguageColor.perl6.rawValue
        case "Chapel":
            return LanguageColor.chapel.rawValue
        case "Gosu":
            return LanguageColor.gosu.rawValue
        case "TeX":
            return LanguageColor.tex.rawValue
        case "Dart":
            return LanguageColor.dart.rawValue
        case "Lua":
            return LanguageColor.lua.rawValue
        case "FreeMarker":
            return LanguageColor.freeMarker.rawValue
        case "Pascal":
            return LanguageColor.pascal.rawValue
        case "Objective-C++":
            return LanguageColor.objectiveCPlusPlus.rawValue
        case "Dockerfile":
            return LanguageColor.dockerfile.rawValue
        case "PLSQL":
            return LanguageColor.plSQL.rawValue
        case "CMake":
            return LanguageColor.cMake.rawValue
        case "Makefile":
            return LanguageColor.makeFile.rawValue
        case "Fortran":
            return LanguageColor.fortran.rawValue
        case "Processing":
            return LanguageColor.processing.rawValue
        case "Arduino":
            return LanguageColor.arduino.rawValue
        case "Eagle":
            return LanguageColor.eagle.rawValue
        case "Cuda":
            return LanguageColor.cuda.rawValue
        default:
            return LanguageColor.noLanguage.rawValue
        }
    }
}

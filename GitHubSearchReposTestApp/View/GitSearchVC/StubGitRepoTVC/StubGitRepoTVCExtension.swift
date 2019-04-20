//
//  StubGitRepoTVCExtension.swift
//  GitHubSearchReposTestApp
//
//  Created by Ivan Stebletsov on 20/04/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import UIKit

extension StubGitRepoTVC {
    
    // MARK: - UI Configuration
    func makeStubCellBackgroundView() {
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
    
    func makeStubRepoNameLabelView() {
        stubRepoIconView = UIView()
        stubRepoIconView.translatesAutoresizingMaskIntoConstraints = false
        
        stubRepoIconView.layer.cornerRadius = 10
        stubRepoIconView.layer.shouldRasterize = true
        stubRepoIconView.layer.rasterizationScale = UIScreen.main.nativeScale
        stubRepoIconView.backgroundColor = #colorLiteral(red: 0.8190318942, green: 0.8350388408, blue: 0.8557710052, alpha: 1)

        cellBackgroundView.addSubview(stubRepoIconView)
        
        let stubRepoIconViewConstraints = [
            stubRepoIconView.topAnchor.constraint(equalTo: cellBackgroundView.topAnchor, constant: 15),
            stubRepoIconView.leadingAnchor.constraint(equalTo: cellBackgroundView.leadingAnchor, constant: 10),
            stubRepoIconView.heightAnchor.constraint(equalToConstant: 20),
            stubRepoIconView.widthAnchor.constraint(equalTo: stubRepoIconView.heightAnchor)]
        NSLayoutConstraint.activate(stubRepoIconViewConstraints)
        
        stubRepoNameLabelView = UIView()
        stubRepoNameLabelView.translatesAutoresizingMaskIntoConstraints = false
        
        stubRepoNameLabelView.layer.cornerRadius = 10
        stubRepoNameLabelView.layer.shouldRasterize = true
        stubRepoNameLabelView.layer.rasterizationScale = UIScreen.main.nativeScale
        stubRepoNameLabelView.backgroundColor = #colorLiteral(red: 0.8740609288, green: 0.8861563802, blue: 0.8985466957, alpha: 1)

        cellBackgroundView.addSubview(stubRepoNameLabelView)
        
        let stubRepoNameLabelViewConstraints = [
            stubRepoNameLabelView.topAnchor.constraint(equalTo: cellBackgroundView.topAnchor, constant: 15),
            stubRepoNameLabelView.leadingAnchor.constraint(equalTo: stubRepoIconView.trailingAnchor, constant: 5),
            stubRepoNameLabelView.heightAnchor.constraint(equalToConstant: 20),
            stubRepoNameLabelView.trailingAnchor.constraint(equalTo: cellBackgroundView.trailingAnchor, constant: -10)]
        NSLayoutConstraint.activate(stubRepoNameLabelViewConstraints)
    }
    
    func makeStubRepoDescriptionLabelView() {
        stubRepoDescriptionLabelView = UIView()
        stubRepoDescriptionLabelView.translatesAutoresizingMaskIntoConstraints = false
        
        stubRepoDescriptionLabelView.layer.cornerRadius = 10
        stubRepoDescriptionLabelView.layer.shouldRasterize = true
        stubRepoDescriptionLabelView.layer.rasterizationScale = UIScreen.main.nativeScale
        stubRepoDescriptionLabelView.backgroundColor = #colorLiteral(red: 0.8740609288, green: 0.8861563802, blue: 0.8985466957, alpha: 1)

        cellBackgroundView.addSubview(stubRepoDescriptionLabelView)
        
        let stubRepoDescriptionLabelViewConstraints = [
            stubRepoDescriptionLabelView.topAnchor.constraint(equalTo: stubRepoNameLabelView.bottomAnchor, constant: 10),
            stubRepoDescriptionLabelView.leadingAnchor.constraint(equalTo: cellBackgroundView.leadingAnchor, constant: 10),
            stubRepoDescriptionLabelView.heightAnchor.constraint(equalToConstant: 40),
            stubRepoDescriptionLabelView.trailingAnchor.constraint(equalTo: cellBackgroundView.trailingAnchor, constant: -10)]
        NSLayoutConstraint.activate(stubRepoDescriptionLabelViewConstraints)
    }
    
    func makeStubProgrammingLanguageLabelView() {
        stubLanguageColorView = UIView()
        stubLanguageColorView.translatesAutoresizingMaskIntoConstraints = false
        
        stubLanguageColorView.layer.cornerRadius = 10
        stubLanguageColorView.layer.shouldRasterize = true
        stubLanguageColorView.layer.rasterizationScale = UIScreen.main.nativeScale
        stubLanguageColorView.backgroundColor = #colorLiteral(red: 0.8740609288, green: 0.8861563802, blue: 0.8985466957, alpha: 1)

        cellBackgroundView.addSubview(stubLanguageColorView)
        
        let stubLanguageColorViewConstraints = [
            stubLanguageColorView.topAnchor.constraint(equalTo: stubRepoDescriptionLabelView.bottomAnchor, constant: 20),
            stubLanguageColorView.leadingAnchor.constraint(equalTo: cellBackgroundView.leadingAnchor, constant: 10),
            stubLanguageColorView.widthAnchor.constraint(equalToConstant: 20),
            stubLanguageColorView.heightAnchor.constraint(equalTo: stubLanguageColorView.widthAnchor),
            stubLanguageColorView.bottomAnchor.constraint(equalTo: cellBackgroundView.bottomAnchor, constant: -15)]
        NSLayoutConstraint.activate(stubLanguageColorViewConstraints)
        
        stubRepoProgrammingLanguageLabelView = UIView()
        stubRepoProgrammingLanguageLabelView.translatesAutoresizingMaskIntoConstraints = false
        
        stubRepoProgrammingLanguageLabelView.layer.cornerRadius = 10
        stubRepoProgrammingLanguageLabelView.layer.shouldRasterize = true
        stubRepoProgrammingLanguageLabelView.layer.rasterizationScale = UIScreen.main.nativeScale
        stubRepoProgrammingLanguageLabelView.backgroundColor = #colorLiteral(red: 0.8740609288, green: 0.8861563802, blue: 0.8985466957, alpha: 1)
        
        cellBackgroundView.addSubview(stubRepoProgrammingLanguageLabelView)
        
        let stubRepoProgrammingLanguageLabelViewConstraints = [
            stubRepoProgrammingLanguageLabelView.centerYAnchor.constraint(equalTo: stubLanguageColorView.centerYAnchor),
            stubRepoProgrammingLanguageLabelView.heightAnchor.constraint(equalToConstant: 20),
            stubRepoProgrammingLanguageLabelView.widthAnchor.constraint(equalToConstant: 40),
            stubRepoProgrammingLanguageLabelView.leadingAnchor.constraint(equalTo: stubLanguageColorView.trailingAnchor, constant: 5)]
        NSLayoutConstraint.activate(stubRepoProgrammingLanguageLabelViewConstraints)
    }
    
    func makeStubStrsRatingLabelView() {
        stubStarIconView = UIView()
        stubStarIconView.translatesAutoresizingMaskIntoConstraints = false
        
        stubStarIconView.layer.cornerRadius = 10
        stubStarIconView.layer.shouldRasterize = true
        stubStarIconView.layer.rasterizationScale = UIScreen.main.nativeScale
        stubStarIconView.backgroundColor = #colorLiteral(red: 0.8740609288, green: 0.8861563802, blue: 0.8985466957, alpha: 1)
        
        cellBackgroundView.addSubview(stubStarIconView)
        
        let stubStarIconViewConstraints = [
            stubStarIconView.topAnchor.constraint(equalTo: stubRepoDescriptionLabelView.bottomAnchor, constant: 20),
            stubStarIconView.leadingAnchor.constraint(equalTo: stubRepoProgrammingLanguageLabelView.trailingAnchor, constant: 25),
            stubStarIconView.widthAnchor.constraint(equalToConstant: 20),
            stubStarIconView.heightAnchor.constraint(equalTo: stubStarIconView.widthAnchor),
            stubLanguageColorView.bottomAnchor.constraint(equalTo: cellBackgroundView.bottomAnchor, constant: -15)]
        NSLayoutConstraint.activate(stubStarIconViewConstraints)
        
        stubStarRatingLabelView = UIView()
        stubStarRatingLabelView.translatesAutoresizingMaskIntoConstraints = false
        
        stubStarRatingLabelView.layer.cornerRadius = 10
        stubStarRatingLabelView.layer.shouldRasterize = true
        stubStarRatingLabelView.layer.rasterizationScale = UIScreen.main.nativeScale
        stubStarRatingLabelView.backgroundColor = #colorLiteral(red: 0.8740609288, green: 0.8861563802, blue: 0.8985466957, alpha: 1)
        
        cellBackgroundView.addSubview(stubStarRatingLabelView)
        
        let stubStarRatingLabelViewConstraints = [
            stubStarRatingLabelView.centerYAnchor.constraint(equalTo: stubLanguageColorView.centerYAnchor),
            stubStarRatingLabelView.heightAnchor.constraint(equalToConstant: 20),
            stubStarRatingLabelView.leadingAnchor.constraint(equalTo: stubStarIconView.trailingAnchor, constant: 5),
            stubStarRatingLabelView.trailingAnchor.constraint(equalTo: cellBackgroundView.trailingAnchor, constant: -10)]
        NSLayoutConstraint.activate(stubStarRatingLabelViewConstraints)
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

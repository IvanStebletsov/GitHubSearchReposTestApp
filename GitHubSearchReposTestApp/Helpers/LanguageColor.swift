//
//  LanguageColor.swift
//  GitHubSearchReposTestApp
//
//  Created by Ivan Stebletsov on 19/04/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import UIKit

enum LanguageColor {
    case go
    case cPlusPlus
    case typeScript
    case javaScript
    case python
    case ruby
    case php
    case groovy
    case java
    case scala
    case shell
    case swift
    case cSharp
    case r
    case html
    case perl
    case objectiveC
    case c
    case shaderLab
    case erlang
    case elm
    case webAssembly
    case glsl
    case kotlin
    case haskell
    case clojure
    case plpgSQL
    case css
    case jupyterNotebook
    case coffeeScript
    case apex
    case gnuplot
    case fSharp
    case powerShell
    case vue
    case emacsLisp
    case vimScript
    case assembly
    case rust
    case julia
    case elixir
    case crystal
    case nim
    case red
    case frege
    case rocket
    case oCaml
    case liveScript
    case d
    case perl6
    case chapel
    case gosu
    case tex
    case dart
    case lua
    case freeMarker
    case pascal
    case objectiveCPlusPlus
    case dockerfile
    case plSQL
    case cMake
    case makeFile
    case fortran
    case processing
    case arduino
    case eagle
    case cuda
    
    case noLanguage
}

extension LanguageColor: RawRepresentable {
    typealias RawValue = UIColor
    
    init?(rawValue: RawValue) {
        switch rawValue {
        case #colorLiteral(red: 6.418536213e-05, green: 0.6762034893, blue: 0.8475205302, alpha: 1): self = .go
        case #colorLiteral(red: 0.9508996606, green: 0.2944826484, blue: 0.4897353053, alpha: 1): self = .cPlusPlus
        case #colorLiteral(red: 0.1691926718, green: 0.4540278316, blue: 0.5378911495, alpha: 1): self = .typeScript
        case #colorLiteral(red: 0.9437397122, green: 0.8762125373, blue: 0.3553961515, alpha: 1): self = .javaScript
        case #colorLiteral(red: 0.20729357, green: 0.4471886158, blue: 0.6466436386, alpha: 1): self = .python
        case #colorLiteral(red: 0.4403657317, green: 0.08148597926, blue: 0.08617643267, alpha: 1): self = .ruby
        case #colorLiteral(red: 0.3109930158, green: 0.3635383546, blue: 0.5833606124, alpha: 1): self = .php
        case #colorLiteral(red: 0.9002518058, green: 0.6217986941, blue: 0.3357601166, alpha: 1): self = .groovy
        case #colorLiteral(red: 0.6915020943, green: 0.449241817, blue: 0.094972305, alpha: 1): self = .java
        case #colorLiteral(red: 0.7612251639, green: 0.1752491891, blue: 0.2512482107, alpha: 1): self = .scala
        case #colorLiteral(red: 0.5387310386, green: 0.8777642846, blue: 0.3168613017, alpha: 1): self = .shell
        case #colorLiteral(red: 0.9992656112, green: 0.6734207273, blue: 0.2716051042, alpha: 1): self = .swift
        case #colorLiteral(red: 0.08986710757, green: 0.5268209577, blue: 0, alpha: 1): self = .cSharp
        case #colorLiteral(red: 0.09553959221, green: 0.548930645, blue: 0.906029582, alpha: 1): self = .r
        case #colorLiteral(red: 0.8876709342, green: 0.29825297, blue: 0.1456541121, alpha: 1): self = .html
        case #colorLiteral(red: 0.01075299643, green: 0.597676456, blue: 0.7646354437, alpha: 1): self = .perl
        case #colorLiteral(red: 0.2644223571, green: 0.5575552583, blue: 1, alpha: 1): self = .objectiveC
        case #colorLiteral(red: 0.333293438, green: 0.3333562911, blue: 0.3332894742, alpha: 1): self = .c
        case #colorLiteral(red: 0.7999122739, green: 0.8000505567, blue: 0.799903512, alpha: 1): self = .shaderLab
        case #colorLiteral(red: 0.7207249999, green: 0.221182704, blue: 0.5971605778, alpha: 1): self = .erlang
        case #colorLiteral(red: 0.3781989813, green: 0.7091284394, blue: 0.7975568175, alpha: 1): self = .elm
        case #colorLiteral(red: 0.01630998403, green: 0.07325630635, blue: 0.2316001654, alpha: 1): self = .webAssembly
        case #colorLiteral(red: 0.7999122739, green: 0.8000505567, blue: 0.799903512, alpha: 1): self = .glsl
        case #colorLiteral(red: 0.9449986815, green: 0.5585456491, blue: 0.1964891553, alpha: 1): self = .kotlin
        case #colorLiteral(red: 0.3690875173, green: 0.3120432794, blue: 0.5275236368, alpha: 1): self = .haskell
        case #colorLiteral(red: 0.8594409823, green: 0.3450648189, blue: 0.3326638937, alpha: 1): self = .clojure
        case #colorLiteral(red: 0.7999122739, green: 0.8000505567, blue: 0.799903512, alpha: 1): self = .plpgSQL
        case #colorLiteral(red: 0.3384353518, green: 0.2395200133, blue: 0.4885692, alpha: 1): self = .css
        case #colorLiteral(red: 0.8555477262, green: 0.3558191657, blue: 0.04000241682, alpha: 1): self = .jupyterNotebook
        case #colorLiteral(red: 0.137760222, green: 0.278180182, blue: 0.4649740458, alpha: 1): self = .coffeeScript
        case #colorLiteral(red: 0.7999122739, green: 0.8000505567, blue: 0.799903512, alpha: 1): self = .apex
        case #colorLiteral(red: 0.9422883391, green: 0.663035512, blue: 0.9394862056, alpha: 1): self = .gnuplot
        case #colorLiteral(red: 0.7228943706, green: 0.2730820775, blue: 0.9863374829, alpha: 1): self = .fSharp
        case #colorLiteral(red: 0.002825131407, green: 0.1392481327, blue: 0.3389076293, alpha: 1): self = .powerShell
        case #colorLiteral(red: 0.1698505282, green: 0.2419508398, blue: 0.3126758933, alpha: 1): self = .vue
        case #colorLiteral(red: 0.7503439188, green: 0.3953618407, blue: 0.856764853, alpha: 1): self = .emacsLisp
        case #colorLiteral(red: 0.0986629799, green: 0.6247231364, blue: 0.2957033515, alpha: 1): self = .vimScript
        case #colorLiteral(red: 0.430465281, green: 0.2997611761, blue: 0.07182566077, alpha: 1): self = .assembly
        case #colorLiteral(red: 0.8716773987, green: 0.6479521394, blue: 0.5195790529, alpha: 1): self = .rust
        case #colorLiteral(red: 0.6345414519, green: 0.4388655424, blue: 0.728585124, alpha: 1): self = .julia
        case #colorLiteral(red: 0.4336774349, green: 0.2922845483, blue: 0.4950687289, alpha: 1): self = .elixir
        case #colorLiteral(red: 0, green: 0.004010798875, blue: 0, alpha: 1): self = .crystal
        case #colorLiteral(red: 0.2130616009, green: 0.4690664411, blue: 0.3583036661, alpha: 1): self = .nim
        case #colorLiteral(red: 0.9599179626, green: 0, blue: 0.002337361686, alpha: 1): self = .red
        case #colorLiteral(red: 0.002759101335, green: 0.7934517264, blue: 0.9939952493, alpha: 1): self = .frege
        case #colorLiteral(red: 0.2363958955, green: 0.360756129, blue: 0.6679763794, alpha: 1): self = .rocket
        case #colorLiteral(red: 0.2308561206, green: 0.8826311231, blue: 0.1984901428, alpha: 1): self = .oCaml
        case #colorLiteral(red: 0.2852717936, green: 0.5941730142, blue: 0.5252918601, alpha: 1): self = .liveScript
        case #colorLiteral(red: 0.7281970382, green: 0.3499746323, blue: 0.3704659939, alpha: 1): self = .d
        case #colorLiteral(red: 0, green: 0, blue: 0.9856309295, alpha: 1): self = .perl6
        case #colorLiteral(red: 0.5511088371, green: 0.7749558091, blue: 0.2476525009, alpha: 1): self = .chapel
        case #colorLiteral(red: 0.5080650449, green: 0.5780264139, blue: 0.4993981123, alpha: 1): self = .gosu
        case #colorLiteral(red: 0.2391842604, green: 0.3799124658, blue: 0.08670572191, alpha: 1): self = .tex
        case #colorLiteral(red: 0.0008431259193, green: 0.7038724422, blue: 0.6689482927, alpha: 1): self = .dart
        case #colorLiteral(red: 0, green: 0, blue: 0.5032429099, alpha: 1): self = .lua
        case #colorLiteral(red: 0.0009710243903, green: 0.3142332435, blue: 0.6969396472, alpha: 1): self = .freeMarker
        case #colorLiteral(red: 0.8898652792, green: 0.9434531331, blue: 0.4424730539, alpha: 1): self = .pascal
        case #colorLiteral(red: 0.4081581235, green: 0.3994919658, blue: 0.9831822515, alpha: 1): self = .objectiveCPlusPlus
        case #colorLiteral(red: 0.2208411694, green: 0.3017119467, blue: 0.3311460316, alpha: 1): self = .dockerfile
        case #colorLiteral(red: 0.8550161719, green: 0.8470804095, blue: 0.8468640447, alpha: 1): self = .plSQL
        case #colorLiteral(red: 0.7999122739, green: 0.8000505567, blue: 0.799903512, alpha: 1): self = .cMake
        case #colorLiteral(red: 0.2599255443, green: 0.4709804058, blue: 0.09808482975, alpha: 1): self = .makeFile
        case #colorLiteral(red: 0.3004540503, green: 0.2545037568, blue: 0.6929085851, alpha: 1): self = .fortran
        case #colorLiteral(red: 0.0004593057383, green: 0.5874577761, blue: 0.8452580571, alpha: 1): self = .processing
        case #colorLiteral(red: 0.001874452108, green: 0.5298715234, blue: 0.5604920983, alpha: 1): self = .arduino
        case #colorLiteral(red: 0.7999122739, green: 0.8000505567, blue: 0.799903512, alpha: 1): self = .eagle
        case #colorLiteral(red: 0.2253093719, green: 0.303370595, blue: 0.2289277315, alpha: 1): self = .cuda
            
        default: self = .noLanguage
        }
    }
    
    var rawValue: RawValue {
        switch self {
        case .go: return #colorLiteral(red: 6.418536213e-05, green: 0.6762034893, blue: 0.8475205302, alpha: 1)
        case .cPlusPlus: return #colorLiteral(red: 0.9508996606, green: 0.2944826484, blue: 0.4897353053, alpha: 1)
        case .typeScript: return #colorLiteral(red: 0.1691926718, green: 0.4540278316, blue: 0.5378911495, alpha: 1)
        case .javaScript: return #colorLiteral(red: 0.9437397122, green: 0.8762125373, blue: 0.3553961515, alpha: 1)
        case .python: return #colorLiteral(red: 0.20729357, green: 0.4471886158, blue: 0.6466436386, alpha: 1)
        case .ruby: return #colorLiteral(red: 0.4403657317, green: 0.08148597926, blue: 0.08617643267, alpha: 1)
        case .php: return #colorLiteral(red: 0.3109930158, green: 0.3635383546, blue: 0.5833606124, alpha: 1)
        case .groovy: return #colorLiteral(red: 0.9002518058, green: 0.6217986941, blue: 0.3357601166, alpha: 1)
        case .java: return #colorLiteral(red: 0.6915020943, green: 0.449241817, blue: 0.094972305, alpha: 1)
        case .scala: return #colorLiteral(red: 0.7612251639, green: 0.1752491891, blue: 0.2512482107, alpha: 1)
        case .shell: return #colorLiteral(red: 0.5387310386, green: 0.8777642846, blue: 0.3168613017, alpha: 1)
        case .swift: return #colorLiteral(red: 0.9992656112, green: 0.6734207273, blue: 0.2716051042, alpha: 1)
        case .cSharp: return #colorLiteral(red: 0.08986710757, green: 0.5268209577, blue: 0, alpha: 1)
        case .r: return #colorLiteral(red: 0.09553959221, green: 0.548930645, blue: 0.906029582, alpha: 1)
        case .html: return #colorLiteral(red: 0.8876709342, green: 0.29825297, blue: 0.1456541121, alpha: 1)
        case .perl: return #colorLiteral(red: 0.01075299643, green: 0.597676456, blue: 0.7646354437, alpha: 1)
        case .objectiveC: return #colorLiteral(red: 0.2644223571, green: 0.5575552583, blue: 1, alpha: 1)
        case .c: return #colorLiteral(red: 0.333293438, green: 0.3333562911, blue: 0.3332894742, alpha: 1)
        case .shaderLab: return #colorLiteral(red: 0.7999122739, green: 0.8000505567, blue: 0.799903512, alpha: 1)
        case .erlang: return #colorLiteral(red: 0.7207249999, green: 0.221182704, blue: 0.5971605778, alpha: 1)
        case .elm: return #colorLiteral(red: 0.3781989813, green: 0.7091284394, blue: 0.7975568175, alpha: 1)
        case .webAssembly: return #colorLiteral(red: 0.01630998403, green: 0.07325630635, blue: 0.2316001654, alpha: 1)
        case .glsl: return #colorLiteral(red: 0.7999122739, green: 0.8000505567, blue: 0.799903512, alpha: 1)
        case .kotlin: return #colorLiteral(red: 0.9449986815, green: 0.5585456491, blue: 0.1964891553, alpha: 1)
        case .haskell: return #colorLiteral(red: 0.3690875173, green: 0.3120432794, blue: 0.5275236368, alpha: 1)
        case .clojure: return #colorLiteral(red: 0.8594409823, green: 0.3450648189, blue: 0.3326638937, alpha: 1)
        case .plpgSQL: return #colorLiteral(red: 0.7999122739, green: 0.8000505567, blue: 0.799903512, alpha: 1)
        case .css: return #colorLiteral(red: 0.3384353518, green: 0.2395200133, blue: 0.4885692, alpha: 1)
        case .jupyterNotebook: return #colorLiteral(red: 0.8555477262, green: 0.3558191657, blue: 0.04000241682, alpha: 1)
        case .coffeeScript: return #colorLiteral(red: 0.137760222, green: 0.278180182, blue: 0.4649740458, alpha: 1)
        case .apex: return #colorLiteral(red: 0.7999122739, green: 0.8000505567, blue: 0.799903512, alpha: 1)
        case .gnuplot: return #colorLiteral(red: 0.9422883391, green: 0.663035512, blue: 0.9394862056, alpha: 1)
        case .fSharp: return #colorLiteral(red: 0.7228943706, green: 0.2730820775, blue: 0.9863374829, alpha: 1)
        case .powerShell: return #colorLiteral(red: 0.002825131407, green: 0.1392481327, blue: 0.3389076293, alpha: 1)
        case .vue: return #colorLiteral(red: 0.1698505282, green: 0.2419508398, blue: 0.3126758933, alpha: 1)
        case .emacsLisp: return #colorLiteral(red: 0.7503439188, green: 0.3953618407, blue: 0.856764853, alpha: 1)
        case .vimScript: return #colorLiteral(red: 0.0986629799, green: 0.6247231364, blue: 0.2957033515, alpha: 1)
        case .assembly: return #colorLiteral(red: 0.430465281, green: 0.2997611761, blue: 0.07182566077, alpha: 1)
        case .rust: return #colorLiteral(red: 0.8716773987, green: 0.6479521394, blue: 0.5195790529, alpha: 1)
        case .julia: return #colorLiteral(red: 0.6345414519, green: 0.4388655424, blue: 0.728585124, alpha: 1)
        case .elixir: return #colorLiteral(red: 0.4336774349, green: 0.2922845483, blue: 0.4950687289, alpha: 1)
        case .crystal: return #colorLiteral(red: 0, green: 0.004010798875, blue: 0, alpha: 1)
        case .nim: return #colorLiteral(red: 0.2130616009, green: 0.4690664411, blue: 0.3583036661, alpha: 1)
        case .red: return #colorLiteral(red: 0.9599179626, green: 0, blue: 0.002337361686, alpha: 1)
        case .frege: return #colorLiteral(red: 0.002759101335, green: 0.7934517264, blue: 0.9939952493, alpha: 1)
        case .rocket: return #colorLiteral(red: 0.2363958955, green: 0.360756129, blue: 0.6679763794, alpha: 1)
        case .oCaml: return #colorLiteral(red: 0.2308561206, green: 0.8826311231, blue: 0.1984901428, alpha: 1)
        case .liveScript: return #colorLiteral(red: 0.2852717936, green: 0.5941730142, blue: 0.5252918601, alpha: 1)
        case .d: return #colorLiteral(red: 0.7281970382, green: 0.3499746323, blue: 0.3704659939, alpha: 1)
        case .perl6: return #colorLiteral(red: 0, green: 0, blue: 0.9856309295, alpha: 1)
        case .chapel: return #colorLiteral(red: 0.5511088371, green: 0.7749558091, blue: 0.2476525009, alpha: 1)
        case .gosu: return #colorLiteral(red: 0.5080650449, green: 0.5780264139, blue: 0.4993981123, alpha: 1)
        case .tex: return #colorLiteral(red: 0.2391842604, green: 0.3799124658, blue: 0.08670572191, alpha: 1)
        case .dart: return #colorLiteral(red: 0.0008431259193, green: 0.7038724422, blue: 0.6689482927, alpha: 1)
        case .lua: return #colorLiteral(red: 0, green: 0, blue: 0.5032429099, alpha: 1)
        case .freeMarker: return #colorLiteral(red: 0.0009710243903, green: 0.3142332435, blue: 0.6969396472, alpha: 1)
        case .pascal: return #colorLiteral(red: 0.8898652792, green: 0.9434531331, blue: 0.4424730539, alpha: 1)
        case .objectiveCPlusPlus: return #colorLiteral(red: 0.4081581235, green: 0.3994919658, blue: 0.9831822515, alpha: 1)
        case .dockerfile: return #colorLiteral(red: 0.2208411694, green: 0.3017119467, blue: 0.3311460316, alpha: 1)
        case .plSQL: return #colorLiteral(red: 0.8550161719, green: 0.8470804095, blue: 0.8468640447, alpha: 1)
        case .cMake: return #colorLiteral(red: 0.7999122739, green: 0.8000505567, blue: 0.799903512, alpha: 1)
        case .makeFile: return #colorLiteral(red: 0.2599255443, green: 0.4709804058, blue: 0.09808482975, alpha: 1)
        case .fortran: return #colorLiteral(red: 0.3004540503, green: 0.2545037568, blue: 0.6929085851, alpha: 1)
        case .processing: return #colorLiteral(red: 0.0004593057383, green: 0.5874577761, blue: 0.8452580571, alpha: 1)
        case .arduino: return #colorLiteral(red: 0.001874452108, green: 0.5298715234, blue: 0.5604920983, alpha: 1)
        case .eagle: return #colorLiteral(red: 0.7999122739, green: 0.8000505567, blue: 0.799903512, alpha: 1)
        case .cuda: return #colorLiteral(red: 0.2253093719, green: 0.303370595, blue: 0.2289277315, alpha: 1)
            
        case .noLanguage: return .black
        }
    }
}

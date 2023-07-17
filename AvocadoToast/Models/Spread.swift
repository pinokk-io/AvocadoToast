//
//  Spread.swift
//  AvocadoToast
//

import Foundation

enum Spread: String, CaseIterable, Hashable {
    case none
    case almondButter
    case peanutButter
    case honey
    case amlou
    case tapenade
    case mayonnaise
    case kyopolou
    case ajvar
    case pindjur
    case vegemite
    case chutney
    case cannedCheese
    case feroce
    case kartoffelkase
    case tartarSauce
}

extension Spread: Identifiable {
    var id: String {
        rawValue
    }
}

extension Spread {
    var name: String {
        switch self {
        case .none:
            return "None"
        case .almondButter:
            return "Almond Butter"
        case .peanutButter:
            return "Peanut Butter"
        case .honey:
            return "Honey"
        case .amlou:
            return "Amlou"
        case .tapenade:
            return "Tapenade"
        case .mayonnaise:
            return "Mayonnaise"
        case .kyopolou:
            return "Kyopolou"
        case .ajvar:
            return "Ajvar"
        case .pindjur:
            return "Pindjur"
        case .vegemite:
            return "Vegemite"
        case .chutney:
            return "Chutney"
        case .cannedCheese:
            return "Canned Cheese"
        case .feroce:
            return "Féroce"
        case .kartoffelkase:
            return "Kartoffelkäse"
        case .tartarSauce:
            return "Tartar Sauce"
        }
    }

    var localizedName: String {
        NSLocalizedString(name, comment: name)
    }
}

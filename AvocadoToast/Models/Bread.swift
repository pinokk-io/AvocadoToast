//
//  Bread.swift
//  AvocadoToast
//

import Foundation

enum Bread: String, CaseIterable, Hashable {
    case white
    case wheat
    case multiGrain
    case sourdough
    case rye
}

extension Bread: Identifiable {
    var id: String {
        rawValue
    }
}

extension Bread {
    var name: String {
        switch self {
        case .white:
            return "White"
        case .wheat:
            return "Wheat"
        case .multiGrain:
            return "Multi-Grain"
        case .sourdough:
            return "Sourdough"
        case .rye:
            return "Rye"
        }
    }

    var localizedName: String {
        NSLocalizedString(name, comment: name)
    }
}

//
//  AvocadoStyle.swift
//  AvocadoToast
//

import Foundation

enum AvocadoStyle: Int, CaseIterable, Hashable {
    case sliced = 0
    case mashed = 1
}

extension AvocadoStyle: Identifiable {
    var id: Int {
        rawValue
    }
}

extension AvocadoStyle {
    var name: String {
        switch self {
        case .sliced:
            return "Sliced"
        case .mashed:
            return "Mashed"
        }
    }

    var localizedName: String {
        NSLocalizedString(name, comment: name)
    }
}

//
//  Topping.swift
//  AvocadoToast
//

import Foundation

enum Topping: String, CaseIterable {
    case salt
    case redPepper
    case egg
}

extension Topping: Identifiable {
    var id: String {
        self.rawValue
    }
}

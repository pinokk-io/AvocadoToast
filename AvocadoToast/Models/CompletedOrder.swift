//
//  CompletedOrder.swift
//  AvocadoToast
//

import Foundation

struct CompletedOrder: Identifiable {
    var id = UUID()
    var bread: Bread = .white
    var spread: Spread = .none
    var style: AvocadoStyle = .sliced
    var toppings: [Topping] = []
    var quantity: Int = 1
    var purchaseDate: Date = Date()
}

extension CompletedOrder {
    var summary: String {
        var components: [String] = []
        components.append(bread.localizedName)
        if spread != .none {
            components.append(spread.localizedName)
        }
        return "\(components.joined(separator: ", ")) x \(quantity)"
    }
}

extension CompletedOrder {
    static let testData: [CompletedOrder] = [
        CompletedOrder(bread: .rye, spread: .almondButter, style: .mashed, toppings: [.salt, .redPepper], quantity: 2),
        CompletedOrder(bread: .multiGrain, spread: .kyopolou, style: .sliced, toppings: [.redPepper], quantity: 5),
        CompletedOrder(bread: .multiGrain, spread: .none, style: .sliced, toppings: [.salt], quantity: 1),
        CompletedOrder(bread: .sourdough, spread: .chutney, style: .sliced, toppings: [.salt, .redPepper], quantity: 3),
        CompletedOrder(bread: .rye, spread: .peanutButter, style: .sliced, toppings: [.salt, .redPepper, .egg], quantity: 1),
        CompletedOrder(bread: .wheat, spread: .tapenade, style: .sliced, toppings: [.egg], quantity: 2),
        CompletedOrder(bread: .sourdough, spread: .vegemite, style: .sliced, toppings: [.salt], quantity: 8),
        CompletedOrder(bread: .wheat, spread: .feroce, style: .sliced, toppings: [.salt, .redPepper, .egg], quantity: 3),
        CompletedOrder(bread: .rye, spread: .honey, style: .sliced, toppings: [], quantity: 4),
        CompletedOrder(bread: .multiGrain, spread: .none, style: .sliced, toppings: [.salt, .egg], quantity: 2),
        CompletedOrder(bread: .sourdough, spread: .chutney, style: .sliced, toppings: [], quantity: 7),
    ]
}

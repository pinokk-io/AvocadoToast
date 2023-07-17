//
//  Order.swift
//  AvocadoToast
//

import Foundation

struct Order {
    var bread: Bread = .white
    var spread: Spread = .none
    var style: AvocadoStyle = .sliced
    var includeSalt: Bool = true
    var includeRedPepper: Bool = false
    var includeEgg: Bool = false
    var eggLocation: CGPoint = .zero
    var quantity: Int = 1
}

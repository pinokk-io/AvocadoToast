//
//  OrderStore.swift
//  AvocadoToast
//

import Foundation

class OrderStore: ObservableObject {
    @Published var orders: [CompletedOrder]

    init(orders: [CompletedOrder]) {
        self.orders = orders
    }
}

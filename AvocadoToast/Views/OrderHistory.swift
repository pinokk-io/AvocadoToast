//
//  OrderHistory.swift
//  AvocadoToast
//

import SwiftUI

struct OrderHistory: View {
    @ObservedObject var store: OrderStore

    var body: some View {
        List(store.orders) { order in
            OrderCell(order: order)
        }
        .listStyle(.inset)
    }
}

struct OrderCell: View {
    let order: CompletedOrder

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(order.summary)
                if #available(iOS 15.0, *) {
                    dateLabel(date: order.purchaseDate)
                        .foregroundStyle(.secondary)
                } else {
                    dateLabel(date: order.purchaseDate)
                }
            }
            Spacer()
            ForEach(order.toppings) { topping in
                ToppingIcon(topping: topping)
            }
        }
    }

    private func dateLabel(date: Date) -> some View {
        HStack {
            Text(order.purchaseDate, style: .date)
            Text(order.purchaseDate, style: .time)
        }
        .font(.subheadline)
    }
}

#Preview {
    @StateObject var store: OrderStore = OrderStore(orders: CompletedOrder.testData)
    return OrderHistory(store: store)
}

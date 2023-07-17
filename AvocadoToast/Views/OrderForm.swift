//
//  OrderForm.swift
//  AvocadoToast
//

import SwiftUI

struct OrderForm: View {
    @State var order: Order = Order()
    @ObservedObject var store: OrderStore

    var body: some View {
        if #available(iOS 15.0, *) {
            formView
                .tint(.accent)
        } else {
            formView
        }
    }

    private var formView: some View {
        Form {
            Section {
                Picker("Bread", selection: $order.bread) {
                    ForEach(Bread.allCases) { bread in
                        Text(bread.localizedName).tag(bread)
                    }
                }
                Picker("Spread", selection: $order.spread) {
                    ForEach(Spread.allCases) { spread in
                        Text(spread.localizedName).tag(spread)
                    }
                }
                Picker("Style", selection: $order.style) {
                    ForEach(AvocadoStyle.allCases) { style in
                        Text(style.localizedName).tag(style)
                    }
                }
            }
            Section {
                Toggle("Include Salt", isOn: $order.includeSalt)
                Toggle("Include Red Pepper", isOn: $order.includeRedPepper)
                Toggle("Include Egg", isOn: $order.includeEgg.animation())
                if order.includeEgg {
                    NavigationLink("Egg Location") {
                        EggLocationPicker(eggLocation: $order.eggLocation)
                    }
                }
            }
            Section {
                Stepper(value: $order.quantity, in: 1...10) {
                    Text("Quantity: \(order.quantity)")
                }
            }
            Section {
                Button(action: submitOrder) {
                    Text("Order")
                }
                .disabled(order.quantity == 0)
            }
        }
    }

    private func submitOrder() {
        var toppings: [Topping] = []
        if order.includeSalt {
            toppings.append(.salt)
        }
        if order.includeRedPepper {
            toppings.append(.redPepper)
        }
        if order.includeEgg {
            toppings.append(.egg)
        }
        store.orders.append(CompletedOrder(
            bread: order.bread,
            spread: order.spread,
            style: order.style,
            toppings: toppings,
            quantity: order.quantity,
            purchaseDate: Date()
        ))
    }
}

#Preview {
    @StateObject var store: OrderStore = OrderStore(orders: [])
    return NavigationView {
        OrderForm(store: store)
    }
}

//
//  ContentView.swift
//  AvocadoToast
//

import SwiftUI

struct ContentView: View {

    private enum TabSelection: Int, Hashable, Identifiable {
        case newOrder = 1
        case history = 2

        var id: Int {
            rawValue
        }

        var navigationTitle: String {
            switch self {
            case .newOrder:
                return "Avocado Toast"
            case .history:
                return "History"
            }
        }

        var localizedNavigationTitle: String {
            NSLocalizedString(navigationTitle, comment: navigationTitle)
        }
    }

    @State private var order = Order()
    @State private var tabSelection: TabSelection = .newOrder
    @StateObject private var store: OrderStore = OrderStore(orders: [])

    var body: some View {
        NavigationView {
            TabView(selection: $tabSelection) {
                OrderForm(store: store)
                    .tabItem {
                        Image(systemName: "square.and.pencil")
                        Text("New Order")
                    }
                    .tag(TabSelection.newOrder)
                OrderHistory(store: store)
                    .tabItem {
                        Image(systemName: "clock.fill")
                        Text("History")
                    }
                    .tag(TabSelection.history)
            }
            .navigationTitle(tabSelection.localizedNavigationTitle)
        }
    }
}

#Preview {
    NavigationView {
        ContentView()
            .environment(\.locale, Locale(identifier: "ja"))
    }
}

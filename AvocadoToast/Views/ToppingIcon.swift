//
//  ToppingIcon.swift
//  AvocadoToast
//

import SwiftUI

struct ToppingIcon: View {
    var topping: Topping

    var body: some View {
        if #available(iOS 17.0, *) {
            Text(capitalLetter(for: topping))
                .font(.system(.body, design: .monospaced))
                .foregroundStyle(.white)
                .padding(EdgeInsets(top: 6, leading: 6, bottom: 6, trailing: 6))
                .background(backgroundColor(for: topping), in: .circle)
        } else if #available(iOS 15.0, *) {
            Text(capitalLetter(for: topping))
                .font(.system(.body, design: .monospaced))
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 6, leading: 6, bottom: 6, trailing: 6))
                .background(backgroundColor(for: topping), in: .circle)
        } else {
            Text(capitalLetter(for: topping))
                .font(.system(.body, design: .monospaced))
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 6, leading: 6, bottom: 6, trailing: 6))
                .background(backgroundColor(for: topping))
        }
    }

    private func capitalLetter(for topping: Topping) -> String {
        switch topping {
        case .salt:
            return "S"
        case .redPepper:
            return "R"
        case .egg:
            return "E"
        }
    }

    private func backgroundColor(for topping: Topping) -> Color {
        switch topping {
        case .salt:
            return Color(red: 0.2, green: 0.2, blue: 0.5)
        case .redPepper:
            return Color(.red)
        case .egg:
            return Color(red: 1, green: 0.8, blue: 0.1)
        }
    }
}

#Preview {
    HStack {
        ToppingIcon(topping: .salt)
        ToppingIcon(topping: .redPepper)
        ToppingIcon(topping: .egg)
    }
}

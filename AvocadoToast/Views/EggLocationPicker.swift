//
//  EggLocationPicker.swift
//  AvocadoToast
//

import SwiftUI

struct EggLocationPicker: View {
    @Binding var eggLocation: CGPoint

    var body: some View {
        GeometryReader { geometry in
            let centerX = geometry.size.width * 0.5
            let centerY = geometry.size.height * 0.5
            let x = centerX + geometry.size.width * eggLocation.x
            let y = centerY + geometry.size.height * eggLocation.y
            ZStack {
                Image("AvocadoToast")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image("Egg")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .position(x: x, y: y)
                    .gesture(DragGesture()
                        .onChanged { value in
                            let xLocation = (value.location.x / geometry.size.width) - 0.5
                            let yLocation = (value.location.y / geometry.size.height) - 0.5
                            eggLocation = CGPoint(x: xLocation, y: yLocation)
                        }
                        .onEnded { value in
                            let xLocation = (value.location.x / geometry.size.width) - 0.5
                            let yLocation = (value.location.y / geometry.size.height) - 0.5
                            eggLocation = CGPoint(x: xLocation, y: yLocation)
                        })
            }
        }
        .navigationTitle("Egg Location")
    }
}

#Preview {
    @State var eggLocation: CGPoint = CGPoint(x: 0.1, y: 0.05)
    return EggLocationPicker(eggLocation: $eggLocation)
}

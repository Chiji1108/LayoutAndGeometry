//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by 千々岩真吾 on 2025/03/10.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]

    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { proxy in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(
                                Color(
                                    hue: min(
                                        1, proxy.frame(in: .global).minY / fullView.size.height),
                                    saturation: 1, brightness: 1)
                            )
                            .rotation3DEffect(
                                .degrees(proxy.frame(in: .global).minY - fullView.size.height / 2)
                                    / 5, axis: (x: 0, y: 1, z: 0)
                            )
                            .opacity(proxy.frame(in: .global).minY / 200)
                            .scaleEffect(max(0.5, proxy.frame(in: .global).minY / 400))
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

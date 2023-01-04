//
//  TileModifier.swift
//  TravelDiscovery
//
//  Created by Muhammed Gül on 4.01.2023.
//

import SwiftUI

extension Color {
    static let discoverBackground = Color(.init(white: 0.95, alpha: 1))
}

extension View {
    func asTile() -> some View {
        modifier(TileModifier())
    }
}

struct TileModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.white)
            .cornerRadius(5)
            .shadow(color: .init(.sRGB, white: 0.8, opacity: 1), radius: 5, x: 0.0, y: 2.0)
    }
}


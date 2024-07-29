//
//  Extensions.swift
//  PlayBook
//
//  Created by Areeb Rasul on 2024-05-22.
//

import SwiftUI

struct RoundedBack: ViewModifier {
    var color: Color = Color.random

    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 4.0)
            .background(
                RoundedRectangle(cornerRadius: 6)
                    .fill(color)
            )
    }
}

extension Color {
    static var random: Color {
        Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}

//
//  SpotifyCategoryCell.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Artur Remizov on 22.05.24.
//

import SwiftUI

struct SpotifyCategoryCell: View {
    
    let title: String
    let isSelected: Bool
    
    var body: some View {
        Text(title)
            .font(.subheadline)
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
            .background(isSelected ? .spotifyGreen : .spotifyDarkGray)
            .foregroundStyle(isSelected ? .spotifyBlack : .spotifyWhite)
            .clipShape(Capsule())
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        VStack(spacing: 40) {
            SpotifyCategoryCell(title: "All", isSelected: true)
            SpotifyCategoryCell(title: "Title goes here", isSelected: true)
        }
    }
}

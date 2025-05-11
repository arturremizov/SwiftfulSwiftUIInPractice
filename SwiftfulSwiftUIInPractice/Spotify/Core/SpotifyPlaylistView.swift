//
//  SpotifyPlaylistView.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Artur Remizov on 21.03.25.
//

import SwiftUI

struct SpotifyPlaylistView: View {
    
    let product: Product
    let user: User
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            ScrollView(.vertical) {
                LazyVStack(spacing: 12) {
                    PlaylistHeaderView(
                        height: 250,
                        title: product.title,
                        subtitle: product.brand ?? "",
                        imageUrl: product.thumbnail,
                        shadowColor: .spotifyBlack.opacity(0.8)
                    )
                    PlaylistDescriptionCell(
                        text: product.description,
                        userName: user.firstName,
                        subheadline: product.category.rawValue.capitalized
                    )
                    .padding(.horizontal, 16)
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    SpotifyPlaylistView(product: .mock, user: .mock)
}

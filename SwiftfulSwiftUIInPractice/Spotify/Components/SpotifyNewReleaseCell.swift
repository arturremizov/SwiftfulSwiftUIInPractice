//
//  SpotifyNewReleaseCell.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Artur Remizov on 24.05.24.
//

import SwiftUI

struct SpotifyNewReleaseCell: View {
    
    let headline: String
    
    let imageUrlString: String
    let type: String
    let title: String
    let subtitle: String
    
    let onShowMoreInfoPressed: () -> Void
    let onAddToPlaylistPressed: () -> Void
    let onPlayPressed: () -> Void
    
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Text(headline)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.spotifyWhite)
                Spacer()
                Button("", systemImage: "ellipsis", action: onShowMoreInfoPressed)
                    .font(.body)
                .foregroundStyle(.spotifyLightGray)
            }
            HStack {
                ImageLoaderView(urlString: imageUrlString, resizingMode: .fill)
                    .frame(width: 150, height: 150)
                    .background(.spotifyWhite)
                VStack(alignment: .leading, spacing: 3) {
                    Group {
                        Text(type)
                            .font(.footnote)
                            .foregroundStyle(.spotifyLightGray)
                        Text(title)
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundStyle(.spotifyWhite)
                        Text(subtitle)
                            .font(.caption2)
                            .foregroundStyle(.spotifyLightGray)
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 0) {
                        Button("", systemImage: "plus.circle", action: onAddToPlaylistPressed)
                        .foregroundStyle(.spotifyLightGray)
                        .font(.title2)
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        
                        Button("", systemImage: "play.circle.fill", action: onPlayPressed)
                        .foregroundStyle(.spotifyWhite)
                        .font(.largeTitle)
                    }
                }
                .padding(.vertical, 16)
                .padding(.horizontal, 8)
            }
            .frame(height: 140)
            .background(.spotifyDarkGray)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .onTapGesture(perform: onPlayPressed)

        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        SpotifyNewReleaseCell(
            headline: "Headline text", 
            imageUrlString: Constants.randomImageUrl,
            type: "Type",
            title: "Title",
            subtitle: "Subtitle",
            onShowMoreInfoPressed: {},
            onAddToPlaylistPressed: {},
            onPlayPressed: { }
        )
        .padding()
    }
}

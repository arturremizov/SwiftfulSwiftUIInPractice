//
//  PlaylistHeaderView.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Artur Remizov on 21.03.25.
//

import SwiftUI
import SwiftfulUI

struct PlaylistHeaderView: View {
    let height: CGFloat
    let title: String
    let subtitle: String
    let imageUrl: String
    let shadowColor: Color
    
    var body: some View {
        Rectangle()
            .opacity(0)
            .overlay {
                ImageLoaderView(urlString: imageUrl, resizingMode: .fill)
            }
            .overlay(alignment: .bottomLeading, content: {
                VStack(alignment: .leading, spacing: 8) {
                    Text(subtitle)
                        .font(.headline)
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                .foregroundStyle(.spotifyWhite)
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    LinearGradient(colors: [shadowColor.opacity(0), shadowColor], startPoint: .top, endPoint: .bottom)
                )
            })
            .asStretchyHeader(startingHeight: height)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        ScrollView {
            PlaylistHeaderView(
                height: 300,
                title: "Some Playlist Title",
                subtitle: "Some Playlist Subtitle",
                imageUrl: Constants.randomImageUrl,
                shadowColor: .spotifyBlack.opacity(0.8)
            )
        }
        .ignoresSafeArea()
    }
}

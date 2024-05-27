//
//  SpotifyRecentsCell.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Artur Remizov on 24.05.24.
//

import SwiftUI

struct SpotifyRecentsCell: View {
    let urlString: String
    let title: String
    var body: some View {
        HStack(spacing: 8) {
            ImageLoaderView(urlString: urlString, resizingMode: .fit)
                .background(Color.white)
                .frame(width: 56, height: 56)
            
            Text(title)
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(.spotifyWhite)
                .lineLimit(2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.trailing, 8)
        .background(Color.spotifyDarkGray)
        .clipShape(RoundedRectangle(cornerRadius: 6))
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        VStack {
            let randomImage = Constants.randomImageUrl
            let title = "Some random title"
            HStack {
                SpotifyRecentsCell(urlString: randomImage, title: title)
                SpotifyRecentsCell(urlString: randomImage, title: title)
            }
            HStack {
                SpotifyRecentsCell(urlString: randomImage, title: title)
                SpotifyRecentsCell(urlString: randomImage, title: title)
            }
        }
    }
}

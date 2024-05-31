//
//  ImageTitleRowCell.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Artur Remizov on 31.05.24.
//

import SwiftUI

struct ImageTitleRowCell: View {
    let imageName: String
    let imageSize: CGFloat
    let title: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            ImageLoaderView(urlString: imageName, resizingMode: .fit)
                .background(.spotifyWhite)
                .frame(width: imageSize, height: imageSize)
            Text(title)
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundStyle(.spotifyLightGray)
                .lineLimit(2)
                .padding(4)
        }
        .frame(width: imageSize)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        ImageTitleRowCell(
            imageName: Constants.randomImageUrl,
            imageSize: 100,
            title: "Some Title"
        )
    }
}

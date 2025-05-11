//
//  PlaylistDescriptionCell.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Artur Remizov on 21.03.25.
//

import SwiftUI

struct PlaylistDescriptionCell: View {
    
    let text: String
    let userName: String
    let subheadline: String
    
    typealias ActionHandler = () -> Void
    var onAddToPlaylistPressed: ActionHandler? = nil
    var onDownloadPressed: ActionHandler? = nil
    var onSharePressed: ActionHandler? = nil
    var onEllipsisPressed: ActionHandler? = nil
    var onShufflePressed: ActionHandler? = nil
    var onPlayPressed: ActionHandler? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(text)
                .foregroundStyle(.spotifyLightGray)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            madeForYouSection
            
            Text(subheadline)
            
            buttonsRow
        }
        .font(.callout)
        .fontWeight(.medium)
        .foregroundStyle(.spotifyLightGray)
    }
    
    private var madeForYouSection: some View {
        HStack(spacing: 8) {
            Image(systemName: "applelogo")
                .font(.title3)
                .foregroundStyle(.spotifyGreen)
                .offset(y: -2)
            
            Text("Made for ")
            +
            Text(userName)
                .bold()
                .foregroundStyle(.spotifyWhite)
        }
    }
    
    private var buttonsRow: some View {
        HStack(spacing: 0) {
            HStack(spacing: 0) {
                Button {
                    onAddToPlaylistPressed?()
                } label: {
                    Image(systemName: "plus.circle")
                        .padding(8)
                        .background(Color.black.opacity(0.0001))
                }
                Button {
                    onDownloadPressed?()
                } label: {
                    Image(systemName: "arrow.down.circle")
                        .padding(8)
                        .background(Color.black.opacity(0.0001))
                }
                Button {
                    onSharePressed?()
                } label: {
                    Image(systemName: "square.and.arrow.up")
                        .offset(y: -3)
                        .padding(8)
                        .background(Color.black.opacity(0.0001))
                }
                Button {
                    onEllipsisPressed?()
                } label: {
                    Image(systemName: "ellipsis")
                        .padding(8)
                        .background(Color.black.opacity(0.0001))
                }
            }
            .offset(x: -8)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(spacing: 0) {
                Button {
                    onShufflePressed?()
                } label: {
                    Image(systemName: "shuffle")
                        .padding(8)
                        .background(Color.black.opacity(0.0001))
                }
                Button {
                    onPlayPressed?()
                } label: {
                    Image(systemName: "play.circle.fill")
                        .font(.system(size: 46))
                        .bold()
                        .background(Color.black.opacity(0.0001))
                        .foregroundStyle(.spotifyGreen)
                }
                
            }
        }
        .font(.title2)
        .offset(y: -8)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        PlaylistDescriptionCell(
            text: Product.mock.description,
            userName: "User Name",
            subheadline: "Some headline goes here"
        )
        .padding()
    }
}

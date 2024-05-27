//
//  SpotifyCoreView.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Artur Remizov on 22.05.24.
//

import SwiftUI
import SDWebImageSwiftUI

struct SpotifyCoreView: View {
    @State private var currentUser: User? = nil
    @State private var selectedCategory: Category = .all
    @State private var products: [Product] = []
    
    private let gridColumns: [GridItem] = [
        GridItem(.flexible(minimum: 100)), GridItem(.flexible(minimum: 100))
    ]
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            VStack(spacing: 0) {
                header
                    .padding(.vertical, 8)
                
                ScrollView(.vertical) {
                    VStack(spacing: 24) {
                        recentsSection
                            .padding(.top, 8)
                        
                        if let product = products.first {
                            newReleaseSection(product: product)
                        }
                    }
                    
                    ForEach(1...10, id: \.self) { count in
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: 200, height: 100)
                    }
                    
                }
                .scrollIndicators(.hidden)
            }
        }
        .toolbar(.hidden, for: .navigationBar)
        .task {
            await getData()
        }
    }
    
    private func getData() async {
        do {
            currentUser = try await DatabaseHelper().getUsers().first
            products = try await Array(DatabaseHelper().getProducts().prefix(8))
        } catch {
            print(error.localizedDescription)
        }
    }
}

// MARK: - Views
extension SpotifyCoreView {
    
    private var header: some View {
        HStack(spacing: 0) {
            ZStack {
                if let currentUser {
                    ImageLoaderView(urlString: currentUser.image)
                        .background(.spotifyWhite)
                        .clipShape(Circle())
                        .onTapGesture {
                            
                        }
                }
            }
            .frame(width: 35, height: 35)
            
            ScrollView(.horizontal) {
                HStack(spacing: 8.0) {
                    ForEach(Category.allCases, id:\.self) { category in
                        SpotifyCategoryCell(
                            title: category.rawValue.capitalized,
                            isSelected: selectedCategory == category
                        )
                        .onTapGesture {
                            selectedCategory = category
                        }
                    }
                }
                .padding(.horizontal, 12)
            }
            .scrollIndicators(.hidden)
        }
        .padding(.leading, 16)
    }
    
    private var recentsSection: some View {
        LazyVGrid(columns: gridColumns) {
            ForEach(products) { product in
                SpotifyRecentsCell(urlString: product.images[0], title: product.title)
            }
        }
        .padding(.horizontal, 16)
    }
    
    private func newReleaseSection(product: Product) -> some View {
        SpotifyNewReleaseCell(
            headline: product.brand ?? "",
            imageUrlString: product.thumbnail,
            type: product.category.rawValue.capitalized,
            title: product.title,
            subtitle: product.description) {
                
            } onAddToPlaylistPressed: {
                
            } onPlayPressed: {
                
            }
            .padding(.horizontal, 16)

    }
}

#Preview {
    SpotifyCoreView()
}

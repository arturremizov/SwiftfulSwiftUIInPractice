//
//  SpotifyCoreView.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Artur Remizov on 22.05.24.
//

import SwiftUI
import SwiftfulUI

struct SpotifyCoreView: View {
    @State private var currentUser: User? = nil
    @State private var selectedCategory: Category = .all
    @State private var products: [Product] = []
    @State private var productRows: [ProductRow] = []
    
    private let gridColumns: [GridItem] = [
        GridItem(.flexible(minimum: 100)), GridItem(.flexible(minimum: 100))
    ]
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            VStack(spacing: 0) {
                header
                ScrollView(.vertical) {
                    VStack(spacing: 24) {
                        recentsSection
                        if let product = products.first {
                            newReleaseSection(product: product)
                        }
                    }
                    listRows
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
            let allProducts = try await DatabaseHelper().getProducts()
            products = Array(allProducts.prefix(8))
            
            var rows: [ProductRow] = []
            var seen = Set<String>()
            let allBrands = allProducts
                .dropFirst()
                .prefix(8)
                .compactMap { $0.brand }
                .filter { seen.insert($0).inserted }
            
            for brand in allBrands {
//                let products = allProducts.filter { $0.brand == brand }
                rows.append(ProductRow(title: brand.capitalized, products: products))
            }
            productRows = rows
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
        .padding(.vertical, 8)
    }
    
    private var recentsSection: some View {
        LazyVGrid(columns: gridColumns) {
            ForEach(products) { product in
                SpotifyRecentsCell(urlString: product.images[0], title: product.title)
                    .asButton(.press) {
                        
                    }
            }
        }
        .padding(.horizontal, 16)
        .padding(.top, 8)
    }
    
    private func newReleaseSection(product: Product) -> some View {
        SpotifyNewReleaseCell(
            headline: product.brand ?? "",
            imageUrlString: product.images[0],
            type: product.category.rawValue.capitalized,
            title: product.title,
            subtitle: product.description) {
                
            } onAddToPlaylistPressed: {
                
            } onPlayPressed: {
                
            }
            .padding(.horizontal, 16)
    }
    
    private var listRows: some View {
        ForEach(productRows) { productRow in
            LazyVStack(spacing: 14) {
                Text(productRow.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.spotifyWhite)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                    .padding(.top, 20)

                ScrollView(.horizontal) {
                    HStack(alignment: .top, spacing: 16.0) {
                        ForEach(productRow.products) { product in
                            ImageTitleRowCell(
                                imageName: product.images[0],
                                imageSize: 148,
                                title: product.title
                            )
                            .asButton(.press) {
                                
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                }
                .scrollIndicators(.hidden)
            }
        }
    }
}

#Preview {
    SpotifyCoreView()
}

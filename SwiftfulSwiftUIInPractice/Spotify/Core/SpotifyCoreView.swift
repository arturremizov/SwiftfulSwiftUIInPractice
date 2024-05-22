//
//  SpotifyCoreView.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Artur Remizov on 22.05.24.
//

import SwiftUI

struct SpotifyCoreView: View {
    @State private var currentUser: User? = nil
    @State private var selectedCategory: Category = .all
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            VStack(spacing: 0) {
                header
                    .padding(.vertical, 8)
                ScrollView(.vertical) {
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
//            products = try await DatabaseHelper().getProducts()
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
                .padding(.horizontal, 16)
            }
            .scrollIndicators(.hidden)
        }
        .padding(.leading, 16)
    }
}

#Preview {
    SpotifyCoreView()
}

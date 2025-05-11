//
//  Product.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Artur Remizov on 20.05.24.
//

import Foundation

struct ProductResult: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

struct Product: Codable, Identifiable {
    let id: Int
    let title, description: String
    let category: ProductCategory
    let price, discountPercentage, rating: Double
    let stock: Int
    let brand: String?
    let thumbnail: String
    let images: [String]
}

enum ProductCategory: String, Codable {
    case beauty = "beauty"
    case fragrances = "fragrances"
    case furniture = "furniture"
    case groceries = "groceries"
}

struct ProductRow: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let products: [Product]
}


extension Product {
    static var mock: Product {
        Product(
            id: 1,
            title: "Example product title",
            description: "This is some mock product description that goes here.",
            category: .beauty,
            price: 999,
            discountPercentage: 15,
            rating: 4.5,
            stock: 50,
            brand: "Apple",
            thumbnail: Constants.randomImageUrl,
            images: [Constants.randomImageUrl, Constants.randomImageUrl, Constants.randomImageUrl]
        )
    }
}

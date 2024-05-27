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

//struct Welcome: Codable {
//    let products: [Product]
//    let total, skip, limit: Int
//}
//
//// MARK: - Product
//struct Product: Codable {
//    let id: Int
//    let title, description: String
//    let category: Category
//    let price, discountPercentage, rating: Double
//    let stock: Int
//    let tags: [String]
//    let brand: String?
//    let sku: String
//    let weight: Int
//    let dimensions: Dimensions
//    let warrantyInformation, shippingInformation: String
//    let availabilityStatus: AvailabilityStatus
//    let reviews: [Review]
//    let returnPolicy: ReturnPolicy
//    let minimumOrderQuantity: Int
//    let meta: Meta
//    let images: [String]
//    let thumbnail: String
//}
//
//enum AvailabilityStatus: String, Codable {
//    case inStock = "In Stock"
//    case lowStock = "Low Stock"
//}



//
//  DatabaseHelper.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Artur Remizov on 20.05.24.
//

import Foundation

struct DatabaseHelper {
    func getProducts() async throws -> [Product] {
        let result: ProductResult = try await getData(urlString: "https://dummyjson.com/products")
        return result.products
    }
    
    func getUsers() async throws -> [User] {
        let result: UserResult = try await getData(urlString: "https://dummyjson.com/users")
        return result.users
    }
    
    private func getData<T:Decodable>(urlString: String) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(T.self, from: data)
    }
}
